import java.io.*;
import java.net.*;
import java.util.Scanner;

public class Client {

    private static final String HOST = "localhost";
    private static final int PORT = 8001;

    public static void main(String[] args) {
        try (Socket socket = new Socket(HOST, PORT)) {

            OutputStream output = socket.getOutputStream();
            PrintWriter writer = new PrintWriter(output, true);

            InputStream input = socket.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));

            Scanner scanner = new Scanner(System.in);
            String text;

            do {
                System.out.println("1. Register");
                System.out.println("2. Login(Participant)");
                System.out.println("3. Login(School Representative)");
                System.out.println("4. View Challenges");
                System.out.println("5. Confirm Participant");
                System.out.println("6. Attempt Challenge");
                System.out.println("7. View Applicants");
                System.out.println("8. Exit");
                System.out.print("Choose an option: ");
                text = scanner.nextLine();

                switch (text) {
                    case "1":
                        register(scanner, writer);
                        break;
                    case "4":
                        viewChallenges(writer,reader);
                        break;
                    case "5":
                        confirmApplicant(scanner, writer);
                        break;
                    case "6":
                        attemptChallenge(scanner, writer,reader);
                        break;
                    case "7":
                        viewApplicants(writer,reader);
                        break;
                    case "8":
                        writer.println("Bye!");
                        break;
                    default:
                        System.out.println("Invalid option");
                }

                String response;
                while (reader.ready() && (response = reader.readLine()) != null) {
                    System.out.println(response);
                }

            } while (!text.equals("5"));

        } catch (UnknownHostException ex) {
            System.out.println("Server not found: " + ex.getMessage());
        } catch (IOException ex) {
            System.out.println("I/O error: " + ex.getMessage());
        }
    }

    private static void viewApplicants(PrintWriter writer,BufferedReader reader) throws IOException {
        writer.println("viewApplicants");
        writer.flush();

        String response;
        while ((response = reader.readLine()) != null && !response.isEmpty()) {
            System.out.println(response);
        }
    }

    private static void register(Scanner scanner, PrintWriter writer) {
        System.out.print("Username: ");
        String username = scanner.nextLine();
        System.out.print("First Name: ");
        String firstName = scanner.nextLine();
        System.out.print("Last Name: ");
        String lastName = scanner.nextLine();
        System.out.print("School Registration Number: ");
        String schoolRegNumber = scanner.nextLine();
        System.out.print("Email: ");
        String email = scanner.nextLine();
        System.out.print("Date of Birth (YYYY-MM-DD): ");
        String dob = scanner.nextLine();

        writer.println("register " + username + " " + firstName + " " + lastName + " " + schoolRegNumber + " " + email + " " + dob);
    }

    private static void viewChallenges(PrintWriter writer, BufferedReader reader) {
        writer.println("viewChallenges");
        writer.flush();

        try {
            String response;
            while (!(response = reader.readLine()).equals("END_OF_CHALLENGES")) {
                System.out.println(response);
            }
        } catch (IOException e) {
            System.out.println("Error reading response: " + e.getMessage());
        }
    }

    private static void confirmApplicant(Scanner scanner, PrintWriter writer) {
        System.out.print("Username: ");
        String username = scanner.nextLine();
        System.out.print("Confirm (yes/no): ");
        String confirm = scanner.nextLine();

        writer.println("confirm " + confirm + " " + username);

        if (confirm.equalsIgnoreCase("yes")) {
            System.out.println("Participant confirmed successfully!");
        } else if (confirm.equalsIgnoreCase("no")) {
            System.out.print("Reason for rejection: ");
            String reason = scanner.nextLine();
            writer.println("confirm no " + username + " " + reason);
        } else {
            System.out.println("Invalid confirmation command.");
        }
    }

    private static void attemptChallenge(Scanner scanner, PrintWriter writer, BufferedReader reader) {
        try {
            // Ask for participant username
            System.out.print("Participant Username: ");
            String participantUsername = scanner.nextLine();
            
            // Ask for challenge number
            System.out.print("Challenge Number: ");
            String challengeNumber = scanner.nextLine();
        
            // Send command and parameters to the server
            writer.println("attemptChallenge " + participantUsername + " " + challengeNumber);
        
            String serverResponse;
            while ((serverResponse = reader.readLine()) != null) {
                System.out.println(serverResponse);
        
                if (serverResponse.startsWith("Question ID: ")) {
                    // Extract question ID from server response
                    int questionId = Integer.parseInt(serverResponse.substring(serverResponse.indexOf(':') + 2).trim());
                    
                    // Query the server for question text
                    writer.println("getQuestionText " + questionId);
                    
                    // Read server's response for question text
                    String questionTextResponse = reader.readLine();
                    if (questionTextResponse.startsWith("Question: ")) {
                        // Display question text
                        String questionText = questionTextResponse.substring("Question: ".length()).trim();
                        System.out.println("Question: " + questionText);
    
                        // Ask for participant's answer
                        System.out.print("Your answer: ");
                        String answer = scanner.nextLine();
    
                        // Send answer to the server
                        writer.println(answer);
                    } else {
                        System.out.println("Error fetching question text.");
                    }
                } else if (serverResponse.equals("Max Attempts Reached!")) {
                    System.out.println("You have already attempted this challenge three times. Maximum attempts reached.");
                    System.out.println("Returning to main menu...");
                    break;  
                } else if (serverResponse.equals("Invalid participant username.")) {
                    break;                  
                }else if (serverResponse.contains("Challenge Summary")) {
                    break;
                }
            }
        } catch (IOException e) {
            System.out.println("Error during challenge attempt: " + e.getMessage());
        }
    }          
}
