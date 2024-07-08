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
                // Display main menu
                displayMainMenu();

                // Get user input
                System.out.print("Choose an option: ");
                text = scanner.nextLine();

                switch (text) {
                    case "1":
                        registerApplicant(scanner, writer,reader);
                        break;
                    case "2":
                        loginParticipant(scanner, writer, reader);
                        break;
                    case "3":
                        loginSchoolRepresentative(scanner, writer, reader);
                        break;
                    case "4":
                        writer.println("Bye!");
                        break;
                    default:
                        System.out.println("Invalid option");
                        continue;
                }

                // Read and display server responses
                String response;
                while ((response = reader.readLine()) != null && !response.isEmpty()) {
                    System.out.println(response);
                }

            } while (!text.equals("4"));

        } catch (UnknownHostException ex) {
            System.out.println("Server not found: " + ex.getMessage());
        } catch (IOException ex) {
            System.out.println("I/O error: " + ex.getMessage());
        }
    }

    private static void displayMainMenu() {
        System.out.println("Main Menu:");
        System.out.println("1. Register");
        System.out.println("2. Login (Participant)");
        System.out.println("3. Login (School Representative)");
        System.out.println("4. Exit");
    }

    private static void displayParticipantMenu() {
        System.out.println("Participant Menu:");
        System.out.println("1. View Challenges");
        System.out.println("2. Attempt Challenge");
        System.out.println("3. Logout");
    }

    private static void displaySchoolRepMenu() {
        System.out.println("School Representative Menu:");
        System.out.println("1. View Applicants");
        System.out.println("2. Confirm Applicant");
        System.out.println("3. Register School");
        System.out.println("4. Logout");
    }

    private static void registerApplicant(Scanner scanner, PrintWriter writer,BufferedReader reader) {
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
        String password = readPasswordSecurely();

        writer.println("register " + username + " " + firstName + " " + lastName + " " + schoolRegNumber + " " + email + " " + dob + " " + password);

        try {
            String response;
            while ((response = reader.readLine()) != null && !response.isEmpty()) {
                System.out.println(response);
                if (response.contains("Applicant registered successfully!")) {
                    displayParticipantMenu();
                    handleParticipantOptions(scanner, writer, reader);
                    return;
                }
            }
        } catch (IOException e) {
            System.out.println("Error during registration: " + e.getMessage());
        }
    }
    
    
    private static void loginParticipant(Scanner scanner, PrintWriter writer, BufferedReader reader) {
        try {
            System.out.print("Enter username: ");
            String username = scanner.nextLine();
            String password = readPasswordSecurely();
    
            // Send login command to server
            writer.println("login participant");
            writer.flush();
            writer.println(username); 
            writer.flush();
            writer.println(password);
            writer.flush();

            // Read response from server
            String response = reader.readLine();
            System.out.println(response);
    
            if (response.equals("Login successful!")) {
                // Display participant menu
                displayParticipantMenu();
                handleParticipantOptions(scanner, writer, reader);
            }
        } catch (IOException e) {
            System.out.println("Error during login: " + e.getMessage());
        }
    }

    private static String readPasswordSecurely() {
        Console console = System.console();
        if (console == null) {
            throw new RuntimeException("No console available");
        }
        char[] passwordArray = console.readPassword("Enter password: ");
        return new String(passwordArray);
    }
    
    private static void handleParticipantOptions(Scanner scanner, PrintWriter writer, BufferedReader reader) {
        String text;
        do {
            // displayParticipantMenu();
            System.out.print("Choose an option: ");
            text = scanner.nextLine();

            switch (text) {
                case "1":
                    viewChallenges(scanner,writer, reader);
                    break;
                case "2":
                    attemptChallenge(scanner, writer, reader);
                    break;
                case "3":
                    writer.println("logout");
                    break;
                default:
                    System.out.println("Invalid option");
                    break;
            }

            // Read and display server responses
            if (!text.equals("3")) {
                String response;
                try {
                    while ((response = reader.readLine()) != null && !response.isEmpty()) {
                        System.out.println(response);
                    }
                } catch (IOException e) {
                    System.out.println("Error reading response: " + e.getMessage());
                }
            }

        } while (!text.equals("3"));
    }

    private static void loginSchoolRepresentative(Scanner scanner, PrintWriter writer, BufferedReader reader) {
        try {
            System.out.print("Enter username: ");
            String username = scanner.nextLine();
            String password = readPasswordSecurely();
    
            // Send login command to server
            writer.println("login school_representative");
            writer.flush();
            writer.println(username); 
            writer.flush();
            writer.println(password);
            writer.flush();

            // Read response from server
            String response = reader.readLine();
            System.out.println(response);
    
            if (response.equals("Login successful!")) {
                // Display participant menu
                displaySchoolRepMenu();
                handleSchoolRepOptions(scanner, writer, reader);
            }
        } catch (IOException e) {
            System.out.println("Error during login: " + e.getMessage());
        }
    }

    private static void handleSchoolRepOptions(Scanner scanner, PrintWriter writer, BufferedReader reader) {
        String text;
        do {
            System.out.print("Choose an option: ");
            text = scanner.nextLine();

            switch (text) {
                case "1":
                    viewApplicants(scanner,writer, reader);
                    break;
                case "2":
                    confirmApplicant(scanner, writer,reader);
                    break;
                case "3":
                    registerSchool(scanner, writer,reader);
                    break;
                case "4":
                    writer.println("logout");
                    break;
                default:
                    System.out.println("Invalid option");
                    continue;
            }

            // Read and display server responses
            String response;
            try {
                while ((response = reader.readLine()) != null && !response.isEmpty()) {
                    System.out.println(response);
                }
            } catch (IOException e) {
                System.out.println("Error reading response: " + e.getMessage());
            }

        } while (!text.equals("4"));
    }

    private static void registerSchool(Scanner scanner, PrintWriter writer,BufferedReader reader) {
        System.out.print("School Name: ");
        String name = scanner.nextLine();
        System.out.print("District: ");
        String district = scanner.nextLine();
        System.out.print("School Registration Number: ");
        String schoolRegNumber = scanner.nextLine();
        System.out.print("Representative Email: ");
        String representativeEmail = scanner.nextLine();
        System.out.println("Representative Name: ");
        String representativeName = scanner.nextLine();

        writer.println("registerSchool " + name + " " + district + " " + schoolRegNumber + " " + representativeEmail + " " + representativeName);

        try {
            String response;
            while ((response = reader.readLine()) != null && !response.isEmpty()) {
                System.out.println(response);
                if (response.contains("School registered successfully!")) {
                    displaySchoolRepMenu();
                    handleSchoolRepOptions(scanner, writer, reader);
                    return;
                }
            }
        } catch (Exception e) {
            System.out.println("Error during registration: " + e.getMessage());
        }
    }


    private static void viewApplicants(Scanner scanner,PrintWriter writer, BufferedReader reader) {
        writer.println("viewApplicants");
        writer.flush();

        try {
            String response;
            while ((response = reader.readLine()) != null && !response.isEmpty()) {
                System.out.println(response);
            }
            displaySchoolRepMenu();
            handleSchoolRepOptions(scanner, writer, reader);
        } catch (IOException e) {
            System.out.println("Error reading response: " + e.getMessage());
        }
    }

    private static void viewChallenges(Scanner scanner,PrintWriter writer, BufferedReader reader) {
        writer.println("viewChallenges");
        writer.flush();

        try {
            String response;
            while ((response = reader.readLine())!=null && !response.equals("END_OF_CHALLENGES")) {
                System.out.println(response);
                // return;
            }
            displayParticipantMenu();
            handleParticipantOptions(scanner, writer, reader);
        } catch (IOException e) {
            System.out.println("Error reading response: " + e.getMessage());
        }
    }

    private static void confirmApplicant(Scanner scanner, PrintWriter writer, BufferedReader reader) {
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

        try {
            String response;
            while ((response = reader.readLine()) != null && !response.isEmpty()) {
                System.out.println(response);
                if (response.contains("Participant confirmed successfully!")) {
                    displaySchoolRepMenu();
                    handleSchoolRepOptions(scanner, writer, reader);
                    return;
                }
            }
        } catch (IOException e) {
            System.out.println("Error during confirmation: " + e.getMessage());
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
                    displayParticipantMenu();
                    handleParticipantOptions(scanner, writer, reader);
                    break;
                } else if (serverResponse.equals("Invalid participant username.")) {
                    break;
                } else if (serverResponse.contains("Challenge Summary")) {
                    break;
                }
            }
        } catch (IOException e) {
            System.out.println("Error during challenge attempt: " + e.getMessage());
        }
    }
}
