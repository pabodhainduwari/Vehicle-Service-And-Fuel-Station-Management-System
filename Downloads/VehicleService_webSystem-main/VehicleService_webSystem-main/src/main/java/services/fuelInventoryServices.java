package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import controller.JDBC;
import model.fuelInventoryModel;

public class fuelInventoryServices {
	public void insertFuelDetails(fuelInventoryModel newFuelModel) {
		
		
		String fuelName = newFuelModel.getFuelName();
		int stockAmount = newFuelModel.getStockAmount();
		float pricePerUnit = newFuelModel.getPricePerUnit();
		String lastUpdated = newFuelModel.getLastUpdated();
		try {
			Connection conn = JDBC.getConnection();
			
			String sql = "SELECT MAX(fuelNumber) FROM fuelInventory";
			PreparedStatement pstmt ; 
	        pstmt = conn.prepareStatement(sql);
	        
	        ResultSet rs = pstmt.executeQuery();

	        // Declare a variable to store the max value
	        int maxFuelNumber = 0;

	        if (rs.next()) {
	        	maxFuelNumber = rs.getInt(1);  // Get the first column in the result set
	        	
	        }
			
			sql = "INSERT INTO fuelInventory(fuelName, stockAmount, pricePerUnit, lastUpdatedDate,fuelNumber ) VALUES (?, ?, ?, ?, ?);";			             
	        pstmt = conn.prepareStatement(sql);
	        
	        
	        pstmt.setString(1, fuelName);
            pstmt.setInt(2, stockAmount);
            pstmt.setFloat(3, pricePerUnit);                      
            pstmt.setString(4, lastUpdated);
            pstmt.setInt(5, maxFuelNumber + 1);
            
            int rowsAffected = pstmt.executeUpdate();
            if(rowsAffected > 0){
            	System.out.println("inserted");
            }
            else {
            	System.out.println("insertion error");
            }
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	
	public static ArrayList<fuelInventoryModel> showFueldetails(){
		
		ArrayList<fuelInventoryModel> fuelList = new ArrayList<fuelInventoryModel>();
		try {
			Connection conn = JDBC.getConnection();
			
			String sql = "SELECT * FROM fuelInventory";
			PreparedStatement pstmt ;             
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            
            
            
            while (rs.next()) {
            		            	
            	fuelInventoryModel newfuel = new fuelInventoryModel();
            	
            	int fuelID = rs.getInt("fuelID");
            	int fuelNumber = rs.getInt("fuelNumber");
            	String fuelName = rs.getString("fuelName");
            	int stockAmount = rs.getInt("stockAmount");
            	float setPricePerUnit = rs.getFloat("pricePerUnit");
            	String lastUpdated = rs.getString("lastUpdatedDate");
            	
            	
            	newfuel.setFuelID(fuelID);
            	newfuel.setFuelNumber(fuelNumber);
            	newfuel.setFuelName(fuelName);
            	newfuel.setStockAmount(stockAmount);
            	newfuel.setPricePerUnit(setPricePerUnit);
            	newfuel.setLastUpdated(lastUpdated);
            	
            	fuelList.add(newfuel);
            	
             }    
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fuelList;
		
	}
	
	public void updateFuelDetails(fuelInventoryModel newFuelModel) {
		int fuelNumber = newFuelModel.getFuelNumber();
		String fuelName = newFuelModel.getFuelName();
		int stockAmount = newFuelModel.getStockAmount();
		float pricePerUnit = newFuelModel.getPricePerUnit();
		String lastUpdated = newFuelModel.getLastUpdated();
		try {
			Connection conn = JDBC.getConnection();
	        
			String sql = "UPDATE fuelInventory SET fuelName = ?, stockAmount = ?, pricePerUnit = ?, lastUpdatedDate = ? WHERE fuelNumber = ?;";
			PreparedStatement pstmt ;             
	        pstmt = conn.prepareStatement(sql);
	        
	        
	        pstmt.setString(1, fuelName);
            pstmt.setInt(2, stockAmount);
            pstmt.setFloat(3, pricePerUnit);                      
            pstmt.setString(4, lastUpdated);
            pstmt.setInt(5, fuelNumber);
            
            int rowsAffected = pstmt.executeUpdate();
            if(rowsAffected > 0){
            	System.out.println("inserted");
            }
            else {
            	System.out.println("insertion error");
            }
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void deleteFuelDetails(fuelInventoryModel newFuelModel) {
		int fuelNumber = newFuelModel.getFuelNumber();

		try {
			Connection conn = JDBC.getConnection();
			
			String sql = "DELETE FROM fuelInventory WHERE fuelNumber = ?;";
			PreparedStatement pstmt ;             
	        pstmt = conn.prepareStatement(sql);        
	        
	        pstmt.setInt(1, fuelNumber);	        
	        pstmt.executeUpdate();
	        
	        
	        sql = "SELECT * FROM fuelInventory WHERE fuelNumber > ? ORDER BY fuelNumber ASC;";
	        pstmt = conn.prepareStatement(sql);        
	        
	        pstmt.setInt(1, fuelNumber);
	        ResultSet rs = pstmt.executeQuery();
            
			while(rs.next()){
				System.out.println(fuelNumber);
				sql = "UPDATE fuelInventory SET fuelNumber = ? WHERE fuelNumber = ?;";				           
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, fuelNumber);		        
		        pstmt.setInt(2, fuelNumber + 1);
		        fuelNumber++;		        
		        
		        pstmt.executeUpdate();
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
}
