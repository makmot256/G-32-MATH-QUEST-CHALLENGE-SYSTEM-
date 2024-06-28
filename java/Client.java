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
                System.out.println("2. View Challenges");
                System.out.println("3. Confirm Participant");
                System.out.println("4. Attempt Challenge");
                System.out.println("5. Exit");
                System.out.print("Choose an option: ");
                text = scanner.nextLine();

                switch (text) {
                    case "1":
                        register(scanner, writer);
                        break;
                    case "2":
                        viewChallenges(writer);
                        break;
                    case "3":
                        confirmParticipant(scanner, writer);
                        break;
                    case "4":
                        attemptChallenge(scanner, writer);
                        break;
                    case "5":
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

    private static void viewChallenges(PrintWriter writer) {
        writer.println("viewChallenges");
    }

    private static void confirmParticipant(Scanner scanner, PrintWriter writer) {
        System.out.print("Username: ");
        String username = scanner.nextLine();
        System.out.print("Confirm (yes/no): ");
        String confirm = scanner.nextLine();

        writer.println("confirm " + confirm + " " + username);

        if (confirm.equalsIgnoreCase("yes")) {
            System.out.println("Participant confirmed successfully!");
        } else if (confirm.equalsIgnoreCase("no")) {
            System.out.println("Participant rejected and removed successfully!");
        } else {
            System.out.println("Invalid confirmation command.");
        }
    }

    private static void attemptChallenge(Scanner scanner, PrintWriter writer) {
        System.out.print("Challenge Number: ");
        String challengeNumber = scanner.nextLine();

        writer.println("attemptChallenge " + challengeNumber);
    }
}
