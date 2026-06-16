package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import controller.JDBC;
import model.mechanicModel;

public class mechanicServices {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	//insert data
	public static boolean insertMechanicdata(mechanicModel newMechanic) {
		
		boolean isSuccess = false;
		try {
			//DB connection call
			con = JDBC.getConnection();
			stmt = con.createStatement();			
			
			
			String mechanicName = newMechanic.getMechanicName();
			String mechanicContact = newMechanic.getMechanicContact();
			String specialty = newMechanic.getSpecialty();
			String experience = newMechanic.getExperience();
			
			String sql = "INSERT INTO mechanicDetails ( mechanicName, mechanicContact, specialty, experience) VALUES('"+mechanicName+"', '"+mechanicContact+"', '"+specialty+"','"+experience+"')";
			
			int rs = stmt.executeUpdate(sql);

			
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//get all data
	public static List<mechanicModel> getAllMechanic(){
		ArrayList<mechanicModel> allMechanics = new ArrayList<>();
		
		try {
			//db connection call
			con = JDBC.getConnection();
			stmt = con.createStatement();
			
			//sql query
			String sql = "SELECT * FROM mechanicDetails";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int mechanicID = rs.getInt(1);
				String mechanicName = rs.getString(2);
				String mechanicContact = rs.getString(3);
				String specialty = rs.getString(4);
				String experience = rs.getString(5);
				
				mechanicModel mechanic = new mechanicModel();
				
				mechanic.setMechanicID(mechanicID);
				mechanic.setMechanicName(mechanicName);
				mechanic.setMechanicContact(mechanicContact);
				mechanic.setSpecialty(specialty);
				mechanic.setExperience(experience);
				
				
				allMechanics.add(mechanic);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return allMechanics;
	}
	
	
	//update data
	public static boolean updateMechanicdata(mechanicModel mechanic){
		try {
			//db connection
			con = JDBC.getConnection();
			stmt = con.createStatement();
			
			int mechanicID = mechanic.getMechanicID();
			String mechanicName = mechanic.getMechanicName();
			String mechanicContact = mechanic.getMechanicContact();
			String specialty = mechanic.getSpecialty();
			String experience = mechanic.getExperience();
			
			//sql query
			String sql = "UPDATE mechanicDetails SET mechanicName='"+mechanicName+"', mechanicContact='"+mechanicContact+"', specialty='"+specialty+"', experience='"+experience+"' WHERE mechanicID ='"+mechanicID+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	//delete data 
	public static boolean deleteMechanicdata(mechanicModel mechanic) {
		try {
			//db connection
			con = JDBC.getConnection();
			stmt = con.createStatement();
			
			int mechanicID = mechanic.getMechanicID();
			
			
			String sql = "DELETE FROM mechanicDetails WHERE mechanicID='"+mechanicID+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
}
