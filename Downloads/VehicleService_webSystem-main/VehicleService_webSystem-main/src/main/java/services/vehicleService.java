package services;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import controller.JDBC;
import model.vehicleModel;



public class vehicleService {
	
	private static boolean isSuccess;
	private static Connection conn = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	//rashini
		public static boolean  registerVehicle(vehicleModel newVehicle)
		{
			
			try {
				 String owner=newVehicle.getOwner();
				 String vType=newVehicle.getvType();
			     String reg_Num=newVehicle.getReg_Num();
				 String chassis=newVehicle.getChassis();
				 String engine=newVehicle.getEngine();
				 String fuel=newVehicle.getFuel();
				 String year=newVehicle.getYear();
				 String vMake=newVehicle.getvMake();
				 String vModel=newVehicle.getvModel();
				 int cusID=newVehicle.getCusID();
				 
				 
				 
				 conn = JDBC.getConnection();
				 
				 String checkCustomerSQL = "SELECT userID FROM userdetails WHERE userID = ?";
				 PreparedStatement checkCustomer = conn.prepareStatement(checkCustomerSQL);
				 checkCustomer.setInt(1, cusID);
				 ResultSet rs = checkCustomer.executeQuery();
				 
				 if (rs.next()) {
					 stmt = conn.createStatement();
					 
					 String sql="INSERT INTO vehicle (Owner_name, vType, Reg_num, Chassis, engine, fType, year, make, model, userID) VALUES ( '"+owner+"','"+vType+"','"+reg_Num+"','"+chassis+"','"+engine+"','"+fuel+"','"+year+"','"+vMake+"','"+vModel+"','"+cusID+"')";
						 
					 int result= stmt.executeUpdate(sql);
						 
					 if(result>0)
					 {
						isSuccess = true;
					 }
					 else {
						isSuccess = false;
					 }
						 
					 stmt.close();
					 
				 }
				 else {
				        // Customer ID does not exist
				        System.out.println("Customer ID does not exist.");
				    } 
				 
			}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return isSuccess; 
		}
		
		public static List<vehicleModel> getByRegNumber(String regNum){
			
			ArrayList <vehicleModel> vehicle=new ArrayList<>();
			
			try {
				
				conn = JDBC.getConnection();
				
				stmt = conn.createStatement();
				String sql="SELECT * FROM vehicle WHERE Reg_num = '"+regNum+"'";
				rs = stmt.executeQuery(sql);

						
				if(rs.next())
				{
					int id = rs.getInt(1);
					String owner = rs.getString(2);
					String vType = rs.getString(3);
					String reg_Num = rs.getString(4);
					String chassis = rs.getString(5);
					String engine = rs.getString(6);
					String fuel = rs.getString(7);
					String year = rs.getString(8);
					String vMake = rs.getString(9);
					String vModel = rs.getString(10);
					int cusID=rs.getInt(11);
					
					vehicleModel newvehicle = new vehicleModel(id,owner,vType,reg_Num,chassis,engine,fuel,year,vMake,vModel,cusID);
					
					vehicle.add(newvehicle);
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return vehicle;
			
		}

		
		public static boolean updateVehicle(vehicleModel vehicle)
		{
			try {
				 int id=vehicle.getId();
				 String owner=vehicle.getOwner();
				 String vType=vehicle.getvType();
			     String reg_Num=vehicle.getReg_Num();
				 String chassis=vehicle.getChassis();
				 String engine=vehicle.getEngine();
				 String fuel=vehicle.getFuel();
				 String year=vehicle.getYear();
				 String vMake=vehicle.getvMake();
				 String vModel=vehicle.getvModel();
				 int cusID=vehicle.getCusID();
				 
				 String convertedID = String.valueOf(id);
				 String convertedCusID = String.valueOf(cusID);;
				 
				 if (convertedID == null || convertedCusID == null || convertedID.isEmpty() || convertedCusID.isEmpty()) {
			            System.out.println("Vehicle ID or Customer ID is missing");
			            return false;
			        }

			     
			        
				conn=JDBC.getConnection();
				stmt=conn.createStatement();
				
				String sql="UPDATE vehicle SET Owner_name='"+owner+"',vType='"+vType+"',Reg_num='"+reg_Num+"',Chassis='"+chassis+"',engine='"+engine+"',fType='"+fuel+"',year='"+year+"',make='"+vMake+"',model='"+vModel+"',userID='"+convertedCusID+"'"
						+ "WHERE vehicleID='"+id+"'";
				
				int rs=stmt.executeUpdate(sql);
				
				if(rs>0)
				 {
					isSuccess = true;
				 }
				 else {
					isSuccess = false;
				 }
					 
				 stmt.close();
			}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return isSuccess;
		}
		
		public static List<vehicleModel> getVehicleDetails(int vehicleId)
		{
			int id = vehicleId;
			ArrayList<vehicleModel> vDetails= new ArrayList<>();
			
			try {
				
				conn=JDBC.getConnection();
				stmt=conn.createStatement();
				
				String sql="SELECT * FROM vehicle WHERE vehicleID = '"+id+"'";
				
				rs=stmt.executeQuery(sql);
				
				while(rs.next())
				{
					
					String owner = rs.getString(2);
					String vType = rs.getString(3);
					String reg_Num = rs.getString(4);
					String chassis = rs.getString(5);
					String engine = rs.getString(6);
					String fuel = rs.getString(7);
					String year = rs.getString(8);
					String vMake = rs.getString(9);
					String vModel = rs.getString(10);
					int cusID = rs.getInt(11);
					
					vehicleModel newvehicle = new vehicleModel(id,owner,vType,reg_Num,chassis,engine,fuel,year,vMake,vModel,cusID);
					
					vDetails.add(newvehicle);
				}
			}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return vDetails;
		}
		
		public static boolean deleteVehicle(int vehicleId)
		{
			int vid = vehicleId;
			
			try {
				
				conn=JDBC.getConnection();
				stmt=conn.createStatement();
				
				String sql =" DELETE FROM vehicle WHERE vehicleID='"+vid+"'";
				
				int result = stmt.executeUpdate(sql);
				
				if(result>0)
				 {
					isSuccess = true;
				 }
				 else {
					isSuccess = false;
				 }
					 
				 stmt.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return isSuccess;
			
		}
		
		public static int getVehicleIdByUserId(int customerId) {
			int Id = customerId;
		    int vehicleId = 0 ;
		    try {
		        
		        conn = JDBC.getConnection();
		        stmt = conn.createStatement();
		        String sql = "SELECT vehicleID FROM vehicle WHERE userID='" + Id + "'";
		        rs = stmt.executeQuery(sql);
		        
		        if (rs.next()) {
		        	vehicleId = rs.getInt("vehicleID");
		            
		        }

		        stmt.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    
		    return vehicleId;
		}
		
		
	
		
		
}
