import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.Scanner;
import java.util.Arrays;

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
                registerParticipant(parts, writer);
                break;
            case "viewChallenges":
                viewChallenges(writer);
                break;
            case "confirm":
                confirmParticipant(parts, writer);
                break;
            case "attemptChallenge":
                attemptChallenge(parts, writer,reader);
                break;
            default:
                writer.println("Invalid command");
        }
    }

    private void registerParticipant(String[] parts, PrintWriter writer) {
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

    private void viewChallenges(PrintWriter writer) {
        try {
            String query = "SELECT * FROM challenges WHERE NOW() BETWEEN start_date AND end_date";
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
                writer.println("Duration: " + duration);
                writer.println("Number of Questions: " + numQuestions);
                writer.println();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            writer.println("Error viewing challenges: " + e.getMessage());
        }
    }

    private void confirmParticipant(String[] parts, PrintWriter writer) {
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

    private void attemptChallenge(String[] parts, PrintWriter writer, BufferedReader reader) {
        String challengeNumber = parts[1];
    
        try {
            String query = "SELECT * FROM questions WHERE id = ? ORDER BY RAND() LIMIT 10";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, Integer.parseInt(challengeNumber));
            ResultSet questionResultSet = statement.executeQuery();
    
            int totalQuestions = 0;
            int correctAnswers = 0;
            int incorrectAnswers = 0;
    
            // Prepare a StringBuilder to collect log messages
            StringBuilder logMessage = new StringBuilder();
    
            while (questionResultSet.next()) {
                int questionId = questionResultSet.getInt("id");
                String questionText = questionResultSet.getString("question_text");
                String correctAnswer = questionResultSet.getString("answer");
    
                writer.println("Question ID: " + questionId);
                writer.println("Question: " + questionText);
                writer.flush();
    
                // Append question details to log message
                logMessage.append("Question ID: ").append(questionId).append("\n");
                logMessage.append("Question: ").append(questionText).append("\n");
    
                // Simulate answering logic (replace with actual user input handling)
                String userAnswer = reader.readLine(); // Read the user's answer from the client
                boolean isCorrectAnswer = correctAnswer.equals(userAnswer);
    
                if (isCorrectAnswer) {
                    correctAnswers++;
                } else {
                    incorrectAnswers++;
                }
    
                totalQuestions++;
            }
    
            // Calculate score and prepare report
            double score = (double) correctAnswers / totalQuestions * 100;
    
            writer.println("Challenge Summary:");
            writer.println("Total Questions: " + totalQuestions);
            writer.println("Correct Answers: " + correctAnswers);
            writer.println("Incorrect Answers: " + incorrectAnswers);
            writer.println("Score: " + score + "%");
            writer.flush();
    
            // Append summary to log message
            logMessage.append("Challenge Summary:\n");
            logMessage.append("Total Questions: ").append(totalQuestions).append("\n");
            logMessage.append("Correct Answers: ").append(correctAnswers).append("\n");
            logMessage.append("Incorrect Answers: ").append(incorrectAnswers).append("\n");
            logMessage.append("Score: ").append(score).append("%\n");
    
            // Log the entire challenge attempt to a file
            logForChallenges(logMessage.toString());
    
        } catch (SQLException | IOException e) {
            e.printStackTrace();
            writer.println("Error attempting challenge: " + e.getMessage());
            writer.flush();
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
        String query = "INSERT INTO rejected_participants (username,reason) VALUES (?,?)";
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
