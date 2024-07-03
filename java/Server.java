import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

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

    private void handleRequest(String request, PrintWriter writer,BufferedReader reader) {
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
                    viewApplicants(scanner, writer);
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

            String query = "INSERT INTO participants (username, firstname, lastname, school_registration_number, email, date_of_birth) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, firstName);
            statement.setString(3, lastName);
            statement.setString(4, schoolRegNumber);
            statement.setString(5, email);
            statement.setDate(6, Date.valueOf(dob));

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                writer.println("Participant registered successfully!");
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
            writer.println("Error registering participant: " + e.getMessage());
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
    private static List<Integer> shuffleQuestions(int challengeId){
        List<Integer> questionIds = new ArrayList<>();
        try {
            String query = "SELECT question_id FROM challenge_question WHERE challenge_id = ?";
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
    private static boolean loginParticipant(Scanner scanner,PrintWriter writer) {
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

    private static boolean loginSchoolRepresentative(Scanner scanner, PrintWriter writer) {
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
    // query the many-to-many relationship between challenge and question pivot table and use it to display the questions in each challenge
    // checking rejected_applicants table when student tries to register
    // check if status is "accepted/confirmed" before participant logs in
    // add details/description of each challenge
    // record every attempt per question and stop attempts after the maximum of 3
    //  The questions will be presented one by one and each time a question is presented, the number of remaining questions and time are indicated above the question
    // we need to implement a timer
    // wrong answer = -3 marks , not sure = 0 marks , correct answer = marks originally assigned(necessitate a marks column on each question)
    // can use a pivot table to track attempts
    //  When the time for attempting the question expires, the participant challenge is closed and the participant is given their score and report.
    // generate report for each participant on close and esepcialy when duration closes. can put it in a dunction that shows scores,time taken for each question and total time for the whole challenge

    

    private static void viewChallenges(PrintWriter writer) {
        // log the participant and their school since their school exists 
        // send an email immediately to the school representative
        try {
            String query = "SELECT c.id, c.name, c.start_date, c.end_date, c.duration, COUNT(q.id) AS num_questions " +
                           "FROM challenges c " +
                           "JOIN challenge_question cq ON c.id = cq.challenge_id " +
                           "JOIN questions q ON cq.question_id = q.id " +
                           "WHERE NOW() BETWEEN c.start_date AND c.end_date " +
                           "GROUP BY c.id";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
    
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Date startDate = resultSet.getDate("start_date");
                Date endDate = resultSet.getDate("end_date");
                int duration = resultSet.getInt("duration");
                int numQuestions = resultSet.getInt("num_questions");
    
                writer.println("Challenge ID: " + id);
                writer.println("Name: " + name);
                writer.println("Start Date: " + startDate);
                writer.println("End Date: " + endDate);
                writer.println("Duration: " + duration + " minutes");
                writer.println("Number of Questions: " + numQuestions);
                writer.println();
            }
    
            // Prompt the participant to choose a challenge ID to attempt
            writer.println("Enter the Challenge ID you want to attempt:");
            writer.flush();
    
        } catch (SQLException e) {
            e.printStackTrace();
            writer.println("Error viewing challenges: " + e.getMessage());
        }
    }
    
    private void confirmApplicant(String[] parts, PrintWriter writer) {
        String confirm = parts[1];
        String username = parts[2];
        String reason = String.join(" ", Arrays.copyOfRange(parts, 3, parts.length));

        try {
            if (confirm.equalsIgnoreCase("yes")) {
                logToTextFile("confirm yes " + username);
              
                String query = "UPDATE participants SET status = 'confirmed' WHERE username = ?";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, username);

                int rowsUpdated = statement.executeUpdate();
                if (rowsUpdated > 0) {
                    writer.println("Participant confirmed successfully!");
                }
                // remove username from applicants.txt
                removeFromFile(username);
            } else if (confirm.equalsIgnoreCase("no")) {
                // if (parts.length < 4) {
                //     writer.println("Error: Reason for rejection not provided.");
                //     return;
                // }
                logToTextFile("confirm no " + username + " " + reason);
                // Add to rejected table
                addToRejected(username,reason);
                // Remove from participants table
                removeFromParticipants(username);
                writer.println("Participant rejected successfully with reason: " + reason);
                // Remove from file
                removeFromFile(username);
            } else {
                writer.println("Invalid confirmation command.");
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
            writer.println("Error confirming participant: " + e.getMessage());
        }
    }


    private static List<String> getQuestionsForChallenge(int challengeId) {
        List<String> questions = new ArrayList<>();
        String query = "SELECT q.id, q.question_text FROM questions q " +
                       "INNER JOIN challenge_question cq ON q.id = cq.question_id " +
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
    
    private static void attemptChallenge(Scanner scanner, PrintWriter writer, int challengeId, int participantId) {
        // TODO: participant can do as many as possible but cannot do more than one at a time.
        // TODO: add check to see if challenge is valid
        // TODO: add check to see if user is eligible to participate
        int totalScore = 0;
        List<Integer> questionIds = shuffleQuestions(challengeId);
        
        for (int questionId : questionIds) {
            try {
                // Fetch question details using questionId and present to participant
                String query = "SELECT question_text, answer,marks FROM questions WHERE id = ?";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setInt(1, questionId);
                ResultSet questionResultSet = statement.executeQuery();

                // Display question to participant and handle their response
                if (questionResultSet.next()) {
                    String questionText = questionResultSet.getString("question_text");
                    String correctAnswer = questionResultSet.getString("answer");
                    int marks = questionResultSet.getInt("marks");

                    writer.println("Question: " + questionText);
                    writer.print("Your answer: ");
                    writer.flush();

                    String userAnswer = scanner.nextLine().trim();

                    int marksAwarded;
                    boolean isCorrect = false;
                    
                    if(userAnswer.equalsIgnoreCase("-")) {
                        marksAwarded = 0;
                    } else if (correctAnswer.equalsIgnoreCase(userAnswer)) {
                        marksAwarded = marks;
                        isCorrect = true;
                    }else{
                        marksAwarded = -3;
                    }

                    // record attempt and update total score
                    recordAttempt(participantId, challengeId, questionId, isCorrect,marksAwarded);
                    totalScore += marksAwarded;
                    
                    
                    if (isCorrect) {
                        writer.println("Correct!");
                    } else {
                        writer.println("Incorrect! Correct answer was: " + correctAnswer);
                    }
                    writer.println("Marks Awarded: " + marksAwarded);
                    writer.println();
                }

            } catch (SQLException e) {
                e.printStackTrace();
                writer.println("Error fetching question: " + e.getMessage());
                writer.println();
            }
        }

        // Provide challenge summary after all questions are attempted
        writer.println("Challenge completed. Totlal score: " + totalScore + ". Provide summary here.");
        writer.flush();
    }
    
    private static void recordAttempt(int participantId, int challengeId, int questionId, boolean isCorrect,int marksAwarded) {
        String query = "INSERT INTO attempts (participant_id, challenge_id, question_id, is_correct) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, participantId);
            statement.setInt(2, challengeId);
            statement.setInt(3, questionId);
            statement.setBoolean(4, isCorrect);
            statement.setInt(5, marksAwarded);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
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

    private void removeFromFile(String username) throws IOException{
        File inputFile = new File(txtFilePath);
        File tempFile = new File("tempApplicants.txt");

        try(BufferedReader reader = new BufferedReader(new FileReader(inputFile));
            BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))){

            String line;
            while((line = reader.readLine())!= null) {
                if(!line.contains(username)) {
                    writer.write(line + System.lineSeparator());
                }
            }
        }

        if(!inputFile.delete()){
            System.err.println("Could not delete original file");
        }
        if (!tempFile.renameTo(inputFile)) {
            System.err.println("Could not rename temporary file");
        }
    }

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