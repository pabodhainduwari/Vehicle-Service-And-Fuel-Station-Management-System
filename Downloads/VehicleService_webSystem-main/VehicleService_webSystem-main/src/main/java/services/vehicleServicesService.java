package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import controller.JDBC;
import model.vehicleServiceModel;

public class vehicleServicesService {
	//Connect DB
	private static boolean isSuccess;
	private static Connection conn = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//insert data function
	public static boolean insertServicedata(vehicleServiceModel newService) {
		
		boolean isSuccess = false;
		try {
			//DB connection call
			
			
			conn = JDBC.getConnection();
			stmt = conn.createStatement();
			
			
			String serviceName = newService.getServiceName();
			String serviceType = newService.getServiceType();
			String description = newService.getDescription();
			String price = newService.getPrice();
			
			String sql = "INSERT INTO services (serviceName, serviceType, description, price) VALUES ('" + serviceName + "', '" + serviceType + "', '" + description + "', '" + price + "')";
			
			//System.out.println("SQL: " + sql);
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
				
		}catch(Exception e) {
			e.printStackTrace();
			//System.out.println("Insert failed: " + e.getMessage());
		}
		return isSuccess;
	}
	
	//GetById
	
	public static List<vehicleServiceModel> getServiceById(String sID){
		int convertedID = Integer.parseInt(sID);
		
		ArrayList<vehicleServiceModel> vService = new ArrayList<>();
		
		try {
			//DB connection call
			conn = JDBC.getConnection();
			stmt = conn.createStatement();
			
			//sql Query
			String sql = "SELECT * FROM services WHERE serviceID = '"+convertedID+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int serviceID = rs.getInt(1);
				String serviceName = rs.getString(2);
				String serviceType = rs.getString(3);
				String description = rs.getString(4);
				String price = rs.getString(5);
				
				vehicleServiceModel vs = new vehicleServiceModel(serviceID, serviceName, serviceType, description, price);
				vService.add(vs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vService;
	}
	
	//GetAll data
	public static List<vehicleServiceModel> getAllService(){
		ArrayList<vehicleServiceModel> vServices = new ArrayList<>();
		
		try {
			//DB connection call
			conn = JDBC.getConnection();
			stmt = conn.createStatement();
			
			//sql Query
			String sql = "select * from services";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int serviceID = rs.getInt(1);
				String serviceName = rs.getString(2);
				String serviceType = rs.getString(3);
				String description = rs.getString(4);
				String price = rs.getString(5);
				
				vehicleServiceModel vs = new vehicleServiceModel(serviceID, serviceName, serviceType, description, price);
				vServices.add(vs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vServices;
	}
	//Update Data
	public static boolean updateServicedata(String serviceID, String serviceName, String serviceType, String description, String price) {
		try {
			//DB connection call
			conn = JDBC.getConnection();
			stmt = conn.createStatement();
			
			//sql query
			String sql = "UPDATE services SET serviceName='"+serviceName+"', serviceType= '"+serviceType+"', description= '"+description+"', price= '"+price+"'"+ "WHERE serviceID='"+serviceID+"'";
			

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
	public static boolean deleteServicedata(String serviceID) {
		int convID = Integer.parseInt(serviceID);
		try {
			//DB connection call
			conn = JDBC.getConnection();
			stmt = conn.createStatement();
			
			
			String sql = "DELETE FROM services WHERE serviceID ='"+convID+"'";
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
	

