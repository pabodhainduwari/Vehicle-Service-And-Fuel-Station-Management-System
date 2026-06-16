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

@WebServlet("/viewBookingDetailsServlet")
public class viewBookingDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * 
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookingID = Integer.parseInt(request.getParameter("bookingID"));
		
		List<bookingModel> service = BookingService.getDetailsByBookingID(bookingID);
		request.setAttribute("sDetails", service);
		
		RequestDispatcher dis = request.getRequestDispatcher("viewBookingDetails.jsp");
		dis.forward(request, response);
	}

}
