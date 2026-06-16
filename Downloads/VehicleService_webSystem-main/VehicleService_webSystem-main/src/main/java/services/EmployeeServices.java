package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import controller.JDBC;
import model.employeeModel;
import model.userModel;

public class EmployeeServices {
	//Connect DB
		private static boolean isSucess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
		
	public static List<employeeModel> getAllEmployee() {
	    ArrayList<employeeModel> employees  = new ArrayList<>();
	    try {
	        con = JDBC.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT * FROM empDetails";
	        rs = stmt.executeQuery(sql);
	        
	        String sql2;
	        ResultSet rs2;
	        
	        while (rs.next()) {
	            int empID = rs.getInt(1);
	            String empType = rs.getString(2);
	            int userID = rs.getInt(3);
	            String mobile = rs.getString(4);
	            float salary = rs.getFloat(5);
	            String address = rs.getString(6);
	            
	            
	            sql2 = "SELECT * FROM userDetails WHERE userID = '" + userID + "'";
	            Statement stmt2 = con.createStatement();
	            rs2 = stmt2.executeQuery(sql2);
	            
		        String email = null;
		        String name = null;
		        String nic = null;
		        
		        while (rs2.next()) {
		        	
		        	email = rs2.getString(2);
		        	name = rs2.getString(4);
		            nic = rs2.getString(7);
		            
		        }
	            
		        rs2.close();
	            stmt2.close();
	            
	            employeeModel emp = new employeeModel();
	            
	            emp.setEmpID(empID);
	            emp.setEmpType(empType);
	            emp.setUserID(userID);
	            emp.setMobile(mobile);
	            emp.setAddress(address);
	            emp.setSalary(salary);
	            emp.setEmail(email);
	            emp.setName(name);
	            emp.setNIC(nic);
	            employees .add(emp);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    
	    return employees ;
	}
	
	public static boolean insertEmployee(employeeModel newEmployee) {
		
		
		 try {
		        con = JDBC.getConnection();
		        stmt = con.createStatement();

		        String name = newEmployee.getName();
		        String empType = newEmployee.getEmpType();
		        String nic = newEmployee.getNIC();
		        String phone = newEmployee.getMobile();
		        String address = newEmployee.getAddress();
		        float salary = newEmployee.getSalary();
		        
		        String sql = "SELECT * FROM UserDetails WHERE NIC = '" + nic + "'";
		        rs = stmt.executeQuery(sql);
		        if (rs.next()) {
		        	
		        	
		        	int userID = rs.getInt("userID");
		        	PreparedStatement pstmt;
		        	
		        	sql = "UPDATE userDetails SET userType = ? WHERE userID = ?;";
		        	pstmt = con.prepareStatement(sql);
		        	pstmt.setString(1, "employee");
		        	pstmt.setInt(2, userID);
		        	pstmt.executeUpdate();
		        	
		        	
		        	sql = "INSERT INTO empDetails (empType, userID, mobileNum, address, salary ) VALUES ('" + empType + "','" + userID + "','" + phone + "', '" + address + "', '" + salary + "')";
			        
			        int rs = stmt.executeUpdate(sql);

			        isSucess = rs > 0;
		        }
		        
		        

		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        try { if (stmt != null) stmt.close(); } catch (Exception ignored) {}
		        try { if (con != null) con.close(); } catch (Exception ignored) {}
		    }
		
		return isSucess;

	}
	
	public static boolean updateEmployeeProfile(int id, String name, String nic, String phone, String email, String address, float salary, String empType) {
	    boolean isSuccess = false;
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    

	    try {
	        con = JDBC.getConnection();
	        
	        String sql = "UPDATE empDetails SET empType=?, mobileNum=?, salary=?, address=? WHERE empID=?";
	        pstmt = con.prepareStatement(sql);

	        // Set parameters
	        pstmt.setString(1, empType);
	        pstmt.setString(2, phone);
	        pstmt.setFloat(3, salary);
	        pstmt.setString(4, address);
	        
	        pstmt.setInt(5, id); 
	        
	        pstmt.executeUpdate();
	        
	        
	        sql = "SELECT userID FROM empDetails WHERE empID = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, id);
	        
	        rs = pstmt.executeQuery();
	        
	        
	        int userID;
	        
	        if (rs.next()) {
	        	
	        	userID = rs.getInt("userID");
	        	sql = "UPDATE userDetails SET name = ?,email = ?, NIC= ? WHERE  userID = ?";
	        	pstmt = con.prepareStatement(sql);
	        	
	        	pstmt.setString(1, name);
		        pstmt.setString(2, email);
		        pstmt.setString(3, nic);
		        pstmt.setInt(4, userID);
		        
	        }
	        else {
	        	System.out.println("rs is null " + rs);
	        }
	        int rowsAffected = pstmt.executeUpdate();        

	        

	        if (rowsAffected > 0) {
	            isSuccess = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // Optionally close resources
	    }

	    return isSuccess;
	}
	
	public static boolean deleteEmployee(String id) {
	    boolean isSuccess = false;
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        con = JDBC.getConnection();
	        String sql = "DELETE FROM empDetails WHERE empID = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, id);

	        int rowsAffected = pstmt.executeUpdate();

	        if (rowsAffected > 0) {
	            isSuccess = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // Optionally close resources
	    }
	    return isSuccess;
	}
	
	public static employeeModel getEmpDetails(userModel user) {
		
		
		int userID = user.getUserID() ;
		
		employeeModel emp = new employeeModel();
		
		Connection con = null;
	    
	    try {
			con = JDBC.getConnection();
			stmt = con.createStatement();
	        String sql = "SELECT * FROM empDetails WHERE userID = '" + userID + "'";
	        rs = stmt.executeQuery(sql);
	        
	        
	        while (rs.next()) {
	            int empID = rs.getInt(1);
	            String empType = rs.getString(2);	            
	            String mobile = rs.getString(4);
	            float salary = rs.getFloat(5);
	            String address = rs.getString(6);
	            
	            
	            String sql2 = "SELECT * FROM userDetails WHERE userID = '" + userID + "'";
	            Statement stmt2 = con.createStatement();
	            ResultSet rs2 = stmt2.executeQuery(sql2);
	            
		        String email = null;
		        String name = null;
		        String nic = null;
		        
		        while (rs2.next()) {
		        	
		        	email = rs2.getString(2);
		        	name = rs2.getString(4);
		            nic = rs2.getString(7);
		            
		        }
	            
		        rs2.close();
	            stmt2.close();
	            	            
	            
	            emp.setEmpID(empID);
	            emp.setEmpType(empType);
	            emp.setUserID(userID);
	            emp.setMobile(mobile);
	            emp.setAddress(address);
	            emp.setSalary(salary);
	            emp.setEmail(email);
	            emp.setName(name);
	            emp.setNIC(nic);
	        }
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        

		return emp;
		
	}
	
}
