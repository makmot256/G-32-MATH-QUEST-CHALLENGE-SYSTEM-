import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class math_questdb {
    public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/math_quest";
        String username = "root";
        String password = "";

        Connection connection = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            connection = DriverManager.getConnection(jdbcURL, username, password);
            System.out.println("Connected to the database!");

            // Create a SQL query
            String sql = "SELECT * FROM administrators";
            PreparedStatement statement = connection.prepareStatement(sql);

            // Execute the query
            ResultSet resultSet = statement.executeQuery();

            // Process the result set
            while (resultSet.next()) {
                // Example: get data from the result set
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                System.out.println("ID: " + id + ", Name: " + name);
            }

            // Close the result set, statement, and connection
            resultSet.close();
            statement.close();
            connection.close();

        } catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver not found");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error connecting to the database");
            e.printStackTrace();
        } finally {
            try {
                if (connection != null && !connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
