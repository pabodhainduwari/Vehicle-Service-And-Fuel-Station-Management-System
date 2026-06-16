package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bookingModel;
import services.BookingService;

@WebServlet("/updateBookingServiceServlet")
public class updateBookingServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bookingModel newService = new bookingModel();
		
		newService.setBookingId(Integer.parseInt(request.getParameter("bookingID")));
		newService.setCusID(Integer.parseInt(request.getParameter("customerID")));
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
		
		isTrue=BookingService.updateService(newService);
		
		if(isTrue==true)
		{
			int id = newService.getBookingId();
			List<bookingModel> service = BookingService.getDetailsByBookingID(id);
			
			request.setAttribute("sDetails", service);
			
			RequestDispatcher dis = request.getRequestDispatcher("viewBookingDetailsServlet");
			dis.forward(request, response);
		}
		else {
			int id = newService.getBookingId();
			List<bookingModel> service = BookingService.getDetailsByBookingID(id);
			
			request.setAttribute("sDetails", service);
			
			RequestDispatcher dis = request.getRequestDispatcher("viewBookingDetailsServlet");
			dis.forward(request, response);
		}
	}

}
