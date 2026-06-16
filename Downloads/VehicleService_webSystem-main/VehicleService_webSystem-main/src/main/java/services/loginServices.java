package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



import controller.JDBC;
import model.userModel;

public class loginServices {
public String[] validateLoginDetails(userModel newUser){
    	
		String[] values = {"1", "", "", ""};
    	
    	
        try{
        	String email = newUser.getEmail();
        	String password = newUser.getPassword();
        	
        	//create data base connection
        	 Connection conn = JDBC.getConnection();
        	 
        	 String sql = "SELECT * FROM userDetails WHERE email = ? AND password = ?";
        	 PreparedStatement pstmt ;             
             pstmt = conn.prepareStatement(sql);
             pstmt.setString(1, email);
             pstmt.setString(2, password);
             
             ResultSet rs = pstmt.executeQuery();
     
             if (!rs.next()) {
                 values[0]= "0";
                 System.out.println("no email or password");
             }
                         
             
             if (values[0].equals("1")){
            	 
            	 String name = null ;
            	 String userType = null  ;
            	 int userID ;
            	 name = rs.getString("name");
            	 userType = rs.getString("userType");
            	 userID = rs.getInt("userID");
            	 
            	 
            	 values[1] = name;
            	 values[3] = Integer.toString(userID);
            	 
            	 if(!userType.equals("customer")) {
            		 sql =  "SELECT * FROM empDetails WHERE userID = ?";
            		 pstmt = conn.prepareStatement(sql);
            		 pstmt.setInt(1, userID);
            		 rs = pstmt.executeQuery();
            		 
            		 
            		 if (rs.next()) {
            		        String empType = rs.getString("empType");            		        
             		        values[2] = empType;
            		         
            		    }
            		 else {
            			 System.out.println("not emp");
            		 }
            		 
            	 }
            	 
            	 else {
            		 values[2] = userType;
            	 }
            	 
            	    
             }
             
             
             pstmt.close();
             conn.close();
             
        }

        catch(Exception e){
            e.printStackTrace();
        }
        
		return values;
    }
}
