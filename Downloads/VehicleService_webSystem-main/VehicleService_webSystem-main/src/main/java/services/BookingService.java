package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import controller.JDBC;
import model.bookingModel;
import model.serviceManagerDashboardModel;



public class BookingService {
	 
	public static boolean isSuccess;
	public static Connection conn = null;
	public static Statement stmt = null;
	public static ResultSet rs = null;

	public static boolean  bookingServices(bookingModel newService)
	{
		
		try {
			
			String name=newService.getName();
			String phone=newService.getPhone();
			String email=newService.getEmail();
			String vType=newService.getvType();
			String v_Model=newService.getV_Model();
			String numberPlate=newService.getNumberPlate();
			String sType=newService.getsType();
			String lastService=newService.getLastService();
			String sDate=newService.getsDate();
			String sTime=newService.getsTime();
			String answer=newService.getAnswer();
			String issues=newService.getIssues();
			int customer=newService.getCusID();
			
			 conn = JDBC.getConnection();
			 
			 String checkCustomerSQL = "SELECT userID FROM userDetails WHERE userID = ?";
			 PreparedStatement checkCustomer = conn.prepareStatement(checkCustomerSQL);
			 checkCustomer.setInt(1, customer);
			 ResultSet rs = checkCustomer.executeQuery();
			 
			 if (rs.next())
			 {
				 stmt = conn.createStatement();
				 
				 String sql="INSERT INTO servicebooking(customerName, customerID, contactNo, email, vehicleType, vehicleModel, numberPlate, service, lastServiceDate, serviceDate, serviceTime, pickup_Drop, issue) VALUES ('"+name+"','"+customer+"','"+phone+"','"+email+"','"+vType+"','"+v_Model+"','"+numberPlate+"','"+sType+"','"+lastService+"','"+sDate+"','"+sTime+"','"+answer+"','"+issues+"')";
					 
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
	
	public static List<bookingModel> getDetailsByUserID(String userID){
		int convertedID = Integer.parseInt(userID);
		ArrayList <bookingModel> service=new ArrayList<>();
		
		try {
			
			conn = JDBC.getConnection();
			
			stmt = conn.createStatement();
			String sql="SELECT * FROM servicebooking WHERE customerID = '"+convertedID+"'";
			rs = stmt.executeQuery(sql);

					
			while(rs.next())
			{
				int bookingId = rs.getInt(1);
				String name=rs.getString(2);
				int customer=rs.getInt(3);
				String phone=rs.getString(4);
				String email=rs.getString(5);
				String vType=rs.getString(6);
				String v_Model=rs.getString(7);
				String numberPlate=rs.getString(8);
				String sType=rs.getString(9);
				String answer=rs.getString(10);
				String issues=rs.getString(11);
				String lastService=rs.getString(12);
				String sDate=rs.getString(13);
				String sTime=rs.getString(14);
				int mechID = rs.getInt(15);
				
				String mechStatus = "Pending";
				if(mechID != 0) {
					mechStatus = "Assigned";
				}
				bookingModel newService = new bookingModel(bookingId,name,customer,phone,email,vType,v_Model,numberPlate,sType,lastService,sDate,sTime,answer,issues, mechStatus );
				
				service.add(newService);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return service;
		
	}

	
	public static boolean updateService(bookingModel newService)
	{
		try {
			int bookingID=newService.getBookingId();
			String name=newService.getName();
			int customer=newService.getCusID();			
			String phone=newService.getPhone();
			String email=newService.getEmail();
			String vType=newService.getvType();
			String v_Model=newService.getV_Model();
			String numberPlate=newService.getNumberPlate();
			String sType=newService.getsType();
			String lastService=newService.getLastService();
			String sDate=newService.getsDate();
			String sTime=newService.getsTime();
			String answer=newService.getAnswer();
			String issues=newService.getIssues();
			 
			conn=JDBC.getConnection();
			stmt=conn.createStatement();
			
			String sql="UPDATE servicebooking SET customerName='"+name+"',customerID='"+customer+"',contactNo='"+phone+"',email='"+email+"',vehicleType='"+vType+"',vehicleModel='"+v_Model+"',numberPlate='"+numberPlate+"',service='"+sType+"',lastServiceDate='"+lastService+"',serviceDate='"+sDate+"',serviceTime='"+sTime+"',pickup_Drop='"+answer+"',issue='"+issues+"'"
					+ "WHERE bookingID='"+bookingID+"'";
			
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
	public static List<bookingModel> getServiceDetails(String Id)
	{
		int convertedID = Integer.parseInt(Id);
		ArrayList<bookingModel> sDetails= new ArrayList<>();
		
		try {
			
			conn=JDBC.getConnection();
			stmt=conn.createStatement();
			
			String sql="SELECT * FROM servicebooking WHERE customerID = '"+convertedID+"'";
			
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int bookingId = rs.getInt(1);
				String name=rs.getString(2);
				int customer=rs.getInt(3);
				String phone=rs.getString(4);
				String email=rs.getString(5);
				String vType=rs.getString(6);
				String v_Model=rs.getString(7);
				String numberPlate=rs.getString(8);
				String sType=rs.getString(9);
				String answer=rs.getString(10);
				String issues=rs.getString(11);
				String lastService=rs.getString(12);
				String sDate=rs.getString(13);
				String sTime=rs.getString(14);
				int mechID = rs.getInt(15);
				
				String mechStatus = "Pending";
				if(mechID != 0) {
					mechStatus = "Assigned";
				}
				bookingModel newService = new bookingModel(bookingId,name,customer,phone,email,vType,v_Model,numberPlate,sType,lastService,sDate,sTime,answer,issues,mechStatus );
				
				sDetails.add(newService);
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return sDetails;
	}
	
	public static boolean deleteService(int Id)
	{
		
		
		try {
			
			conn=JDBC.getConnection();
			stmt=conn.createStatement();
			
			String sql =" DELETE FROM servicebooking WHERE bookingID='"+Id+"'";
			
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
	
	public static List<bookingModel> getDetailsByBookingID(int Id){
		
		ArrayList <bookingModel> booking=new ArrayList<>();
		
		try {
			
			conn = JDBC.getConnection();
			
			stmt = conn.createStatement();
			String sql="SELECT * FROM servicebooking WHERE bookingID = '"+Id+"'";
			rs = stmt.executeQuery(sql);

					
			if(rs.next())
			{
				int bookingId = rs.getInt(1);
				String name=rs.getString(2);
				int customer=rs.getInt(3);
				String phone=rs.getString(4);
				String email=rs.getString(5);
				String vType=rs.getString(6);
				String v_Model=rs.getString(7);
				String numberPlate=rs.getString(8);
				String sType=rs.getString(9);
				String answer=rs.getString(10);
				String issues=rs.getString(11);
				String lastService=rs.getString(12);
				String sDate=rs.getString(13);
				String sTime=rs.getString(14);
				int mechID = rs.getInt(15);
				
				String mechStatus = "Pending";
				if(mechID != 0) {
					mechStatus = "Assigned";
				}
				bookingModel newService = new bookingModel(bookingId,name,customer,phone,email,vType,v_Model,numberPlate,sType,lastService,sDate,sTime,answer,issues, mechStatus);
				
				booking.add(newService);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return booking;
	}
	public static List<serviceManagerDashboardModel> getAllBookingDetails(){
		ArrayList <serviceManagerDashboardModel> allbookings=new ArrayList<>();
		try {
			
			conn = JDBC.getConnection();
			
			stmt = conn.createStatement();
			String sql="SELECT * FROM servicebooking";
			rs = stmt.executeQuery(sql);

					
			while(rs.next())
			{
				serviceManagerDashboardModel booking = new serviceManagerDashboardModel();
				
				int bookingId = rs.getInt("bookingID");
				String name = rs.getString("customerName");
				int customer = rs.getInt("customerID");
				String phone = rs.getString("contactNo");
				String sType = rs.getString("service");
				String sDate = rs.getString("serviceDate");
				String sTime = rs.getString("serviceTime");
				int mechID = rs.getInt("mechanicID");
				
				if(mechID == 0) {
					booking.setBookingID(bookingId);
					booking.setCustomerName(name);
					booking.setCustomerID(customer);
					
					booking.setContactNumber(phone);
					booking.setService(sType);
					booking.setServiceDate(sDate);
					booking.setServiceTime(sTime);
					
					
					allbookings.add(booking);
				}
				
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return allbookings;
	}
	
	public static void assignMechanic(int bookingID , int mechanicID) {
		
		
		Connection con;
		try {
			con = JDBC.getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE servicebooking SET mechanicID = ? WHERE bookingID = ?");
			
			ps.setInt(1, mechanicID);
			ps.setInt(2, bookingID);
			
			int affectedRows = ps.executeUpdate();
			if(affectedRows > 0) {
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}
	
}


