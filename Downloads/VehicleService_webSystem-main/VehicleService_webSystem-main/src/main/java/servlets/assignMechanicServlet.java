package servlets;


import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import controller.JDBC;
import services.BookingService;


@WebServlet("/assignMechanicServlet")
public class assignMechanicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int bookingID = Integer.parseInt(request.getParameter("bookingID"));
			int mechanicID = Integer.parseInt(request.getParameter("mechanicID"));
					
			BookingService.assignMechanic(bookingID, mechanicID);
			
			
			response.sendRedirect("serviceManagerDashboardServlet");
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("viewBookingDetailsServlet?message=Error+Assigning+Mechanic");
		}
	}

}
