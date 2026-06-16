package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC {
    private static final String URL = "jdbc:mysql://localhost:3306/vehicleservice";
    private static final String USER = "root";
    private static final String PASSWORD = "Rashini@1210";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            
        } 
        catch (SQLException e) {
            System.out.println("Database connection failed.");
            e.printStackTrace();
        }catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver not found.");
            e.printStackTrace();
        } 
        return conn;
    }
}
