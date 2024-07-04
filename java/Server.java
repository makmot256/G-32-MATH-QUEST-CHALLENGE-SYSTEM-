import java.io.*;
import java.net.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

// server hangs on attempt challenge and view challenge
// need to implement more menu stuff on client to reflect what is on the server

public class Server {

    private static final int PORT = 8001;
    private static Connection connection;

    public static void main(String[] args) throws ClassNotFoundException {
        System.out.println("Server is starting...");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/math_quest", "root", "root");
            try (ServerSocket serverSocket = new ServerSocket(PORT)) {
                System.out.println("Server is listening on port " + PORT);
                while (true) {
                    new ClientHandler(serverSocket.accept(), connection).start();
                }
            } catch (IOException ex) {
                System.out.println("Server error: " + ex.getMessage());
                ex.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

class ClientHandler extends Thread {
    private final Socket socket;
    private final Connection connection;
    private final String txtFilePath = "applicants.txt"; 
    public ClientHandler(Socket socket, Connection connection) {
        this.socket = socket;
        this.connection = connection;
    }

    public void run() {
        try {
            InputStream input = socket.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            OutputStream output = socket.getOutputStream();
            PrintWriter writer = new PrintWriter(output, true);

            String request;

            while ((request = reader.readLine()) != null) {
                System.out.println("Received from client: " + request);
                handleRequest(request, writer,reader);
            }

            socket.close();
        } catch (IOException ex) {
            System.out.println("Server exception:" + ex.getMessage());
            ex.printStackTrace();
        }
    }

    private void handleRequest(String request, PrintWriter writer,BufferedReader reader){
        String[] parts = request.split(" ");
        String command = parts[0];

        switch (command) {
            case "register":
                registerApplicant(parts, writer);
                break;
            case "viewChallenges":
                viewChallenges(writer);
                break;
            case "confirm":
                confirmApplicant(parts, writer);
                break;
            case "attemptChallenge":
                attemptChallenge(new Scanner(reader), writer, Integer.parseInt(parts[1]), Integer.parseInt(parts[2]));
                break;
            case "login":
            if ("school".equals(parts[1])) {
                loginSchoolRepresentative(new Scanner(reader), writer);
            } else if ("participant".equals(parts[1])) {
                loginParticipant(new Scanner(reader), writer);
            }
            break;
            default:
                writer.println("Invalid command");
        }
        // Check if the client has closed the connection
        // if (!reader.ready()) {
        //     // Handle the end of the input stream
        //     // For example, you can close the connection or perform any necessary cleanup
        //     socket.close();
        //     return;
        // }

    }


    private void displayMainMenu(Scanner scanner, PrintWriter writer) {
        while (true) {
            writer.println("Main Menu:");
            writer.println("1. Login as Participant");
            writer.println("2. Login as School Representative");
            writer.println("3. Exit");
            writer.print("Enter your choice: ");
            writer.flush();
    
            String choice = scanner.nextLine().trim();
    
            switch (choice) {
                case "1":
                    if (loginParticipant(scanner, writer)) {
                        displayParticipantMenu(scanner, writer);
                    }
                    break;
                case "2":
                    if (loginSchoolRepresentative(scanner, writer)) {
                        displaySchoolRepresentativeMenu(scanner, writer);
                    }
                    break;
                case "3":
                    writer.println("Exiting...");
                    writer.flush();
                    return;
                default:
                    writer.println("Invalid choice. Please try again.");
                    writer.flush();
            }
        }
    }

    private void displayParticipantMenu(Scanner scanner, PrintWriter writer) {
        while (true) {
            writer.println("Participant Menu:");
            writer.println("1. View Challenges");
            writer.println("2. Attempt Challenge");
            writer.println("3. Logout");
            writer.print("Enter your choice: ");
            writer.flush();
    
            String choice = scanner.nextLine().trim();
    
            switch (choice) {
                case "1":
                    // Implement viewChallenges method for participant
                    break;
                case "2":
                    writer.print("Enter Challenge ID to attempt: ");
                    writer.flush();
                    int challengeId = Integer.parseInt(scanner.nextLine().trim());
                    // Implement attemptChallenge method
                    attemptChallenge(scanner, writer, challengeId, getParticipantIdByUsername(username));
                    break;
                case "3":
                    writer.println("Logging out...");
                    writer.flush();
                    return;
                default:
                    writer.println("Invalid choice. Please try again.");
                    writer.flush();
            }
        }
    }
    
    private void displaySchoolRepresentativeMenu(Scanner scanner, PrintWriter writer) {
        while (true) {
            writer.println("School Representative Menu:");
            writer.println("1. View Applicants");
            writer.println("2. Logout");
            writer.print("Enter your choice: ");
            writer.flush();
    
            String choice = scanner.nextLine().trim();
    
            switch (choice) {
                case "1":
                    // Implement viewApplicants method for school representative
                    viewApplicants(writer);
                    break;
                case "2":
                    writer.println("Logging out...");
                    writer.flush();
                    return;
                default:
                    writer.println("Invalid choice. Please try again.");
                    writer.flush();
            }
        }
    }
    
    private int getParticipantIdByUsername(String username) {
        int participantId = -1;
        try {
            String query = "SELECT id FROM participants WHERE username = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
    
            if (resultSet.next()) {
                participantId = resultSet.getInt("id");
            }
    
        } catch (SQLException e) {
            e.printStackTrace();
        }
    
        return participantId;
    }

    private static String readPasswordSecurely(PrintWriter writer) {
        Console console = System.console();
        if (console == null) {
            throw new RuntimeException("No console available");
        }
        char[] passwordArray = console.readPassword("Enter password: ");
        return new String(passwordArray);
    }

    private void registerApplicant(String[] parts, PrintWriter writer) {
        String username = parts[1];
        String firstName = parts[2];
        String lastName = parts[3];
        String schoolRegNumber = parts[4];
        String email = parts[5];
        String dob = parts[6];

        try {
            // logToTextFile("register " + username + " " + firstName + " " + lastName + " " + schoolRegNumber + " " + email + " " + dob);
            logToTextFile(String.join(" ", parts));

            // Check if the applicant is in the rejected_applicants table
            String checkQuery = "SELECT * FROM rejected_applicants WHERE username = ?";
            PreparedStatement checkStatement = connection.prepareStatement(checkQuery);
            checkStatement.setString(1, username);
            ResultSet checkResult = checkStatement.executeQuery();

            if (checkResult.next()) {
                writer.println("Registration failed. This applicant has been rejected previously.");
                return; 
            }    

            String query = "INSERT INTO applicants (username, firstname, lastname, school_registration_number, email, date_of_birth) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, firstName);
            statement.setString(3, lastName);
            statement.setString(4, schoolRegNumber);
            statement.setString(5, email);
            statement.setDate(6, Date.valueOf(dob));

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                writer.println("Applicant registered successfully!");
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
            writer.println("Error registering applicant: " + e.getMessage());
        }
    }

    // view applicants for school representative so login school rep then show the menu including view applicants

    private void viewApplicants(PrintWriter writer)
    {
        try{
            String query = "SELECT username,firstname,lastname,school_registration_number,email,date_of_birth FROM participants WHERE status = 'pending'";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            // display applicants
            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String firstName = resultSet.getString("firstname");
                String lastName = resultSet.getString("lastname");
                String schoolRegNumber = resultSet.getString("school_registration_number");
                String email = resultSet.getString("email");
                Date dateOfBirth = resultSet.getDate("date_of_birth");

                writer.println("Username: " + username);
                writer.println("Name: " + firstName + " " + lastName);
                writer.println("School Registration Number: " + schoolRegNumber);
                writer.println("Email: " + email);
                writer.println("Date of Birth: " + dateOfBirth);
                writer.println();

            }
        } catch (SQLException e) {
            e.printStackTrace();
            writer.println("Error viewing applicants: " + e.getMessage());
        }
    }
    // add the confirm participant solely for school representative
    // function to shuffle questions/pick randomly from db
    private List<Integer> shuffleQuestions(int challengeId){
        List<Integer> questionIds = new ArrayList<>();
        try {
            String query = "SELECT question_id FROM challenge_questions WHERE challenge_id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, challengeId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int questionId = resultSet.getInt("question_id");
                questionIds.add(questionId);
            }

            Collections.shuffle(questionIds);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return questionIds;
    }
    // handling email(smtp)
    // login for both participant and school representative
    private boolean loginParticipant(Scanner scanner,PrintWriter writer) {
        writer.print("Enter username: ");
        writer.flush();
        String username = scanner.nextLine();

        String password = readPasswordSecurely(writer);

        try {
            String query = "SELECT * FROM participants WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                writer.println("Login successful!");
                writer.flush();
                return true;
            } else {
                writer.println("Invalid username or password");
                writer.flush();
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            writer.println("Error during login: " + e.getMessage());
            writer.flush();
            return false;
        }
    }

    private boolean loginSchoolRepresentative(Scanner scanner, PrintWriter writer) {
        writer.print("Enter username: ");
        writer.flush();
        String username = scanner.nextLine();

        String password = readPasswordSecurely(writer);

        try {
            String query = "SELECT * FROM school_representatives WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                writer.println("Login successful!");
                writer.flush();
                return true;
            } else {
                writer.println("Invalid username or password");
                writer.flush();
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            writer.println("Error during login: " + e.getMessage());
            writer.flush();
            return false;
        }
    }
    // query the many-to-many relationship between challenge and question pivot table and use it to display the questions in each challenge (done)
    // checking rejected_applicants table when student tries to register(done)
    // add details/description of each challenge
    // record every attempt per question and stop attempts after the maximum of 3
    //  The questions will be presented one by one and each time a question is presented, the number of remaining questions and time are indicated above the question
    // we need to implement a timer
    // wrong answer = -3 marks , not sure = 0 marks , correct answer = marks originally assigned(necessitate a marks column on each question)
    // can use a pivot table to track attempts(participant_attempts)
    //  When the time for attempting the question expires, the participant challenge is closed and the participant is given their score and report.
    // generate report for each participant on close and esepcialy when duration closes. can put it in a dunction that shows scores,time taken for each question and total time for the whole challenge

    

    // log the participant and their school since their school exists 
    // send an email immediately to the school representative
    private void viewChallenges(PrintWriter writer) {
        try {
            String query = "SELECT c.id, c.name, c.start_date, c.end_date, c.duration, c.description, COUNT(q.id) AS num_questions " +
                       "FROM challenges c " +
                       "LEFT JOIN challenge_questions cq ON c.id = cq.challenge_id " +
                       "LEFT JOIN questions q ON cq.question_id = q.id " +
                       "WHERE c.end_date >= NOW() " +
                       "GROUP BY c.id";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
    
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Date startDate = resultSet.getDate("start_date");
                Date endDate = resultSet.getDate("end_date");
                int duration = resultSet.getInt("duration");
                String description = resultSet.getString("description");
                int numQuestions = resultSet.getInt("num_questions");
    
                writer.println("Challenge ID: " + id);
                writer.println("Name: " + name);
                writer.println("Description: " + description);
                writer.println("Start Date: " + startDate);
                writer.println("End Date: " + endDate);
                writer.println("Duration: " + duration + " minutes");
                writer.println("Number of Questions: " + numQuestions);
                writer.println();
            }
    
            // Indicate the end of challenges listing
            writer.println("END_OF_CHALLENGES");
            writer.flush();
    
        } catch (SQLException e) {
            e.printStackTrace();
            writer.println("Error viewing challenges: " + e.getMessage());
            writer.flush();
        }
    }
    
    
    private void confirmApplicant(String[] parts, PrintWriter writer) {
        String confirm = parts[1];
        String username = parts[2];
        String reason = String.join(" ", Arrays.copyOfRange(parts, 3, parts.length));
    
        try {
            if (confirm.equalsIgnoreCase("yes")) {
                logToTextFile("confirm yes " + username);
    
                // Move applicant to participants table
                String moveToParticipantsQuery = "INSERT INTO participants (username,firstname,lastname,school_registration_number,email,date_of_birth ) SELECT username, firstname, lastname, school_registration_number, email, date_of_birth FROM applicants WHERE username = ?";
                PreparedStatement moveToParticipantsStmt = connection.prepareStatement(moveToParticipantsQuery);
                moveToParticipantsStmt.setString(1, username);
    
                int rowsInserted = moveToParticipantsStmt.executeUpdate();
                if (rowsInserted > 0) {
                    writer.println("Participant confirmed successfully!");
    
                    // Remove from applicants table
                    removeFromApplicantsTable(username);
    
                    // Remove from file
                    removeFromFile(username);
                } else {
                    writer.println("Error: No matching applicant found to confirm.");
                }
    
            } else if (confirm.equalsIgnoreCase("no")) {
                logToTextFile("confirm no " + username + " " + reason);
    
                // Move applicant to rejected_applicants table
                String moveToRejectedQuery = "INSERT INTO rejected_applicants (username, reason) SELECT username, ? FROM applicants WHERE username = ?";
                PreparedStatement moveToRejectedStmt = connection.prepareStatement(moveToRejectedQuery);
                moveToRejectedStmt.setString(1, reason);
                moveToRejectedStmt.setString(2, username);
    
                int rowsInserted = moveToRejectedStmt.executeUpdate();
                if (rowsInserted > 0) {
                    writer.println("Participant rejected successfully with reason: " + reason);
    
                    // Remove from applicants table
                    removeFromApplicantsTable(username);
    
                    // Remove from file
                    removeFromFile(username);
                } else {
                    writer.println("Error: No matching applicant found to reject.");
                }
    
            } else {
                writer.println("Invalid confirmation command.");
            }
    
        } catch (SQLException | IOException e) {
            e.printStackTrace();
            writer.println("Error confirming participant: " + e.getMessage());
        }
    }
    
    private void removeFromApplicantsTable(String username) throws SQLException {
        String deleteFromApplicantsQuery = "DELETE FROM applicants WHERE username = ?";
        PreparedStatement deleteFromApplicantsStmt = connection.prepareStatement(deleteFromApplicantsQuery);
        deleteFromApplicantsStmt.setString(1, username);
        deleteFromApplicantsStmt.executeUpdate();
    }
    
    private void removeFromFile(String username) throws IOException {
        Path path = Paths.get("applicants.txt");
        List<String> lines = Files.readAllLines(path);
        lines.removeIf(line -> line.startsWith(username + " "));
        Files.write(path, lines);
    }
    

    private List<String> getQuestionsForChallenge(int challengeId) {
        List<String> questions = new ArrayList<>();
        String query = "SELECT q.id, q.question_text FROM questions q " +
                       "INNER JOIN challenge_questions cq ON q.id = cq.question_id " +
                       "WHERE cq.challenge_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, challengeId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                questions.add(resultSet.getString("question_text"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }
    
    // TODO: participant can do as many as possible but cannot do more than one at a time.
    // TODO: add check to see if challenge is valid
    // TODO: add check to see if user is eligible to participate

    private void attemptChallenge(Scanner scanner, PrintWriter writer, int challengeId, int participantId) {
        try {
            // Fetch challenge duration from the database
            int challengeDuration = getChallengeDuration(challengeId); // Implement this method to fetch duration
    
            // Fetch all question IDs for the challenge
            List<Integer> questionIds = shuffleQuestions(challengeId);
            int totalQuestions = questionIds.size();
            int remainingQuestions = totalQuestions;
    
            // Count existing attempts for this participant and challenge
            int attemptsCount = countAttempts(participantId, challengeId); // Implement this method to count attempts
    
            // Check if participant has exceeded maximum attempts
            if (attemptsCount >= 3) {
                writer.println("You have already attempted this challenge three times. Maximum attempts reached.");
                return;
            }
    
            // Timer variables
            long startTime = System.currentTimeMillis();
            long endTime = startTime + (challengeDuration * 60 * 1000); // Convert duration to milliseconds
    
            int attemptNumber = attemptsCount + 1; // Calculate the attempt number for the current attempt
            // Arrays to store per question data
            long[] questionTimes = new long[totalQuestions];
            boolean[] questionCorrectness = new boolean[totalQuestions];
            int[] questionScores = new int[totalQuestions];
            int totalScore = 0;
    
            for (int i = 0; i < totalQuestions; i++) {
                int questionId = questionIds.get(i);
    
                // Fetch question details using questionId
                String query = "SELECT question_text, answer, marks FROM questions WHERE id = ?";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setInt(1, questionId);
                ResultSet questionResultSet = statement.executeQuery();
    
                if (questionResultSet.next()) {
                    String questionText = questionResultSet.getString("question_text");
                    String correctAnswer = questionResultSet.getString("answer");
                    int marks = questionResultSet.getInt("marks");
    
                    // Display remaining questions and time
                    writer.println("Remaining Questions: " + remainingQuestions);
                    displayRemainingTime(startTime, endTime, writer);
    
                    // Present question to participant
                    writer.println("Question: " + questionText);
                    writer.print("Your answer: ");
                    writer.flush();
    
                    String userAnswer = scanner.nextLine().trim();
    
                    // Check answer correctness and record attempt
                    boolean isCorrect = correctAnswer.equalsIgnoreCase(userAnswer);
                    recordAttempt(participantId, challengeId, questionId, attemptNumber, isCorrect, marks, System.currentTimeMillis() - startTime);

                    // Store question data
                    questionTimes[i] = System.currentTimeMillis() - startTime;
                    questionCorrectness[i] = isCorrect;
                    questionScores[i] = isCorrect ? marks : 0;
                    totalScore += questionScores[i];
    
                    if (isCorrect) {
                        writer.println("Correct!");
                    } else {
                        writer.println("Incorrect! Correct answer was: " + correctAnswer);
                    }
                    writer.println();
                }
    
                remainingQuestions--;
    
                // Check if time is up
                if (System.currentTimeMillis() >= endTime) {
                    writer.println("Time's up! Challenge will be closed.");
                    break;
                }
            }
    
            // Provide challenge summary after all questions are attempted
            writer.println("Challenge completed. Provide summary here.");
            generateChallengeSummary(writer, totalQuestions, questionTimes, questionCorrectness, questionScores, totalScore, System.currentTimeMillis() - startTime);
            writer.flush();
    
        } catch (SQLException e) {
            e.printStackTrace();
            writer.println("Error during challenge attempt: " + e.getMessage());
        }
    }
    
    private int countAttempts(int participantId, int challengeId) {
        int attemptCount = 0;
        try {
            String query = "SELECT COUNT(*) AS attempt_count FROM participant_attempts " +
                           "WHERE participant_id = ? AND challenge_id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, participantId);
            statement.setInt(2, challengeId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                attemptCount = resultSet.getInt("attempt_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return attemptCount;
    }
    
    private void displayRemainingTime(long startTime, long endTime, PrintWriter writer) {
        long currentTime = System.currentTimeMillis();
        long remainingTimeMillis = endTime - currentTime;
    
        if (remainingTimeMillis <= 0) {
            writer.println("Time Remaining: 0 seconds");
        } else {
            long remainingSeconds = remainingTimeMillis / 1000;
            writer.println("Time Remaining: " + remainingSeconds + " seconds");
        }
    }
    

    private int getChallengeDuration(int challengeId) throws SQLException {
        int duration = 0;
        String query = "SELECT duration FROM challenges WHERE id = ?";
        
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, challengeId);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                duration = resultSet.getInt("duration");
            }
        }
        
        return duration;
    }
    
        
    
    private void recordAttempt(int participantId, int challengeId, int questionId, int attemptNumber, boolean isCorrect, int score, long timeTaken) {
        String query = "INSERT INTO participant_attempts (participant_id, challenge_id, question_id, attempt_number, is_correct, score, time_taken) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, participantId);
            statement.setInt(2, challengeId);
            statement.setInt(3, questionId);
            statement.setInt(4, attemptNumber);
            statement.setBoolean(5, isCorrect);
            statement.setInt(6, score);
            statement.setLong(7, timeTaken);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
        
        
    private static void generateChallengeSummary(PrintWriter writer, int totalQuestions, long[] questionTimes,boolean[] questionCorrectness, int[] questionScores, int totalScore,long totalTimeTaken) {
        writer.println("Challenge Summary:");
        writer.println("Total Questions: " + totalQuestions);
        writer.println("Total Score: " + totalScore);
        writer.println("Total Time Taken: " + (totalTimeTaken / 1000) + " seconds");
            writer.println();

        for (int i = 0; i < totalQuestions; i++) {
            writer.println("Question " + (i + 1) + ":");
            writer.println("   Time Taken: " + (questionTimes[i] / 1000) + " seconds");
            writer.println("   Correct: " + (questionCorrectness[i] ? "Yes" : "No"));
            writer.println("   Score: " + questionScores[i]);
            writer.println();
        }
    }

    // Simulate user answering logic
    // private String simulateAnswer(String questionText) {
    //     Scanner scanner = new Scanner(System.in);
    //     System.out.print("Enter your answer for \"" + questionText + "\": ");
    //     scanner.close();
    //     return scanner.nextLine().trim();
    // }
    
    
    private void logForChallenges(String logMessage) {
        String logFilePath = "challenge_log.txt";

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(logFilePath, true))) {
            writer.write(logMessage + "\n\n");
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Error writing to log file: " + e.getMessage());
        }
    }

    // private boolean simulateAnswer(int questionId) {
    //     // Replace with actual user input handling logic
    //     // For simulation purposes, let's assume all answers are correct
    //     return true;
    // }

    private void logToTextFile(String data) throws IOException {
        try(BufferedWriter writer = new BufferedWriter(new FileWriter(txtFilePath,true))){
            writer.write(data + System.lineSeparator());
        }
    }

    // private void removeFromFile(String username) throws IOException{
    //     File inputFile = new File(txtFilePath);
    //     File tempFile = new File("tempApplicants.txt");

    //     try(BufferedReader reader = new BufferedReader(new FileReader(inputFile));
    //         BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))){

    //         String line;
    //         while((line = reader.readLine())!= null) {
    //             if(!line.contains(username)) {
    //                 writer.write(line + System.lineSeparator());
    //             }
    //         }
    //     }

    //     if(!inputFile.delete()){
    //         System.err.println("Could not delete original file");
    //     }
    //     if (!tempFile.renameTo(inputFile)) {
    //         System.err.println("Could not rename temporary file");
    //     }
    // }

    private void addToRejected(String username,String reason) throws SQLException{
        String query = "INSERT INTO rejected_applicants (username,reason) VALUES (?,?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1,username);
        statement.setString(2,reason);
        statement.executeUpdate();
    }

    private void removeFromParticipants(String username) throws SQLException {
        String query = "DELETE FROM participants WHERE username = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, username);
        statement.executeUpdate();
    }
}
