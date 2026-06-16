package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.BookingService;

@WebServlet("/deleteServiceBookingServlet")
public class deleteServiceBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id= Integer.parseInt(request.getParameter("bookingID"));
		
		boolean isTrue;
		
		isTrue=BookingService.deleteService(id);
		
		if(isTrue==true)
		{
			String alertMessage = "Vehicle Service Booking Cancel Successfully!!";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='cusBookingRecordServlet'</script>");
		}
		else {
			
			String alertMessage = "Vehicle Service Booking Cancel Unsuccessfully!!";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='cusBookingRecordServlet'</script>");
		}
	}

}
