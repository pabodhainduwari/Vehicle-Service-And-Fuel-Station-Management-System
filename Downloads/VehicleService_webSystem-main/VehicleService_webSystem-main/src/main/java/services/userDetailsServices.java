package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import model.regularCustomer;
import model.userModel;
import controller.JDBC;

public class userDetailsServices {
	
	
	public static userModel  getuserDetailsByUserID(int customerId){
		int userID = customerId;
		
		userModel user = new regularCustomer();
		try {
			
			Connection conn = JDBC.getConnection();
			
			
			String sql="SELECT * FROM userDetails WHERE userID = ?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userID);
			ResultSet rs = pstmt.executeQuery();

			
			String email = null;
		    String userName = null;
		    String password = null;
		    String name = null;
		    String royaltyType = null;
			while(rs.next())
			{
				
				
			    email=rs.getString("email");
			    userName=rs.getString("userName");
			    password=rs.getString("password");
			    name=rs.getString("name"); 
			}
			
			sql="SELECT * FROM customerDetails WHERE userID = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				royaltyType = rs.getString("royaltyType"); 
			}
			
			user.setUserID(userID);
			user.setEmail(email);
			user.setUserName(userName);
			user.setPassword(password);
			user.setName(name);
			user.setRoyaltyType(royaltyType);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return user;
		
			
		
	}

	public static String getUserTypeById(userModel user) {
		int userID = user.getUserID();
        String userType = null;
        try (Connection con = JDBC.getConnection()) {
            String sql = "SELECT userType FROM userDetails WHERE userID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userType = rs.getString("userType");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userType;
    }

	public static boolean setLoyaltyType(userModel user) {
		String email = user.getEmail();
		String userType = user.getUserType();
		String sql = "UPDATE userDetails SET userType = ? WHERE email = ?";
		boolean isvalid = false;
	    try (Connection con = JDBC.getConnection();
	         PreparedStatement stmt = con.prepareStatement(sql)) {

	        stmt.setString(1, userType);
	        stmt.setString(2, email);
	        
	        
	        int rowsUpdated = stmt.executeUpdate();

	        if( rowsUpdated > 0)
	        {
	        	isvalid = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace(); // For debugging — consider logging in production
	    }
		return isvalid;

		
	}
	
	
}
