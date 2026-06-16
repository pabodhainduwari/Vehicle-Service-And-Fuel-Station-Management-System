package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bookingModel;
import services.BookingService;

@WebServlet("/serviceBookingServlet")
public class serviceBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("userID");
		String customerId = String.valueOf(id);
	    

	    if (customerId == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }

	    System.out.println("Customer ID in session: " + customerId);

		
	    bookingModel newService = new bookingModel();
		
		newService.setCusID(id);
		newService.setName(request.getParameter("full_name"));
		newService.setPhone(request.getParameter("phone_number"));
		newService.setEmail(request.getParameter("email_address"));
		newService.setvType(request.getParameter("vehicle_type"));
		newService.setV_Model(request.getParameter("vehicle_model"));
		newService.setNumberPlate(request.getParameter("number_plate"));
		newService.setsType(request.getParameter("service_type"));
		newService.setLastService(request.getParameter("last_service_date"));
		newService.setsDate(request.getParameter("service_date"));
		newService.setsTime(request.getParameter("service_time"));
		newService.setAnswer(request.getParameter("pickup_drop"));
		newService.setIssues(request.getParameter("vehicle_issues"));
		
		
		boolean isTrue;
		
		isTrue = BookingService.bookingServices(newService);
		
		if (isTrue==true) {
			String alertMessage = "Vehicle Service Booking Successfully!!";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='cusBookingRecordServlet'</script>");
		}

		else {
			String alertMessage = "Vehicle Service Booking Unsuccessfully!!";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='cusBookingRecordServlet'</script>");
		}
	}

}
