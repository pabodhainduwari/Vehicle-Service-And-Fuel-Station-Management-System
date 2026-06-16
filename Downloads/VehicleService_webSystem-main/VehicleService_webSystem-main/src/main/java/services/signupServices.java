package services;
import java.sql.*;

import controller.JDBC;
import model.regularCustomer;
import model.userModel;

public class signupServices {
	
    public boolean[] insertUserDetails(userModel newUser){
        boolean[] values ={false, false} ;
        try{
            String email = newUser.getEmail();
            String userName = newUser.getUserName();
            String name = newUser.getName();
            String password = newUser.getPassword();
            String NIC = newUser.getNIC();
            
            Connection conn = JDBC.getConnection();
            
         // check if the email is already in the DB
            
            String sql = "SELECT * FROM userDetails WHERE email = ?";
            PreparedStatement pstmt ;
            ResultSet rs;
            pstmt = conn.prepareStatement(sql);
            
    
            pstmt.setString(1, email);
                rs = pstmt.executeQuery();
    
                if (rs.next()) {
                    values[0]= true;  
                }
    
            
                          
            sql = "SELECT * FROM userDetails WHERE userName = ?";
            pstmt = conn.prepareStatement(sql);
    
            pstmt.setString(1, userName);
                rs = pstmt.executeQuery();
    
                if (rs.next()) {
                    values[1] = true;
                    
                }
    
            
                        
                if (!values[0] && !values[1]){
                
                sql = ("INSERT INTO userDetails(email, UserName, name, password, NIC) VALUES (?, ?, ?, ?, ?);");
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, email);
                pstmt.setString(2, userName);
                pstmt.setString(3, name);
                pstmt.setString(4, password);
                pstmt.setString(5, NIC);

                pstmt.executeUpdate();

                
                }
                System.out.println(values[0]);
                System.out.println(values[1]);
                pstmt.close();
                conn.close();
                
    	    	rs.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }      
        
        
        
        return values;
    }
    public static userModel getLastAddedUser(){
    	
    	userModel user = new regularCustomer();
    	
    	
    	
    	try {
    		Connection conn = JDBC.getConnection();
        	String sql = "SELECT * FROM userDetails ORDER BY userID DESC LIMIT 1;";
        	Statement stmt;
        	ResultSet rs;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
	    	if (rs.next()) {
	    		int userID = rs.getInt("userID");
	    		user.setUserID(userID);
	    		
	        }
	    	conn.close();
	    	stmt.close();
	    	rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	
    	return user;
    }
}
