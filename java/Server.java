import java.io.*;
import java.net.*;
import java.sql.*;

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
    private final String txtFilePath = "log.txt"; 
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
                handleRequest(request, writer);
            }

            socket.close();
        } catch (IOException ex) {
            System.out.println("Server exception:" + ex.getMessage());
            ex.printStackTrace();
        }
    }

    private void handleRequest(String request, PrintWriter writer) {
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
                attemptChallenge(parts, writer);
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
            logToTextFile("register " + username + " " + firstName + " " + lastName + " " + schoolRegNumber + " " + email + " " + dob);

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
            } else if (confirm.equalsIgnoreCase("no")) {
                logToTextFile("confirm no " + username);

                String query = "DELETE FROM participants WHERE username = ?";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, username);

                int rowsDeleted = statement.executeUpdate();
                if (rowsDeleted > 0) {
                    writer.println("Participant rejected and removed successfully!");
                }
            } else {
                writer.println("Invalid confirmation command.");
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
            writer.println("Error confirming participant: " + e.getMessage());
        }
    }

    private void attemptChallenge(String[] parts, PrintWriter writer) {
        String challengeNumber = parts[1];

        try {
            String query = "SELECT * FROM questions WHERE challenge_id = ? ORDER BY RAND() LIMIT 10";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, Integer.parseInt(challengeNumber));
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String questionText = resultSet.getString("question_text");

                writer.println("Question ID: " + id);
                writer.println("Question: " + questionText);
                writer.println();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            writer.println("Error attempting challenge: " + e.getMessage());
        }
    }

    private void logToTextFile(String data) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(txtFilePath, true))) {
            writer.write(data + System.lineSeparator());
        }
    }
}
