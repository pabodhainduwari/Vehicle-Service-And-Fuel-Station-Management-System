package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.vehicleModel;
import services.vehicleService;
@WebServlet("/customerDashboardServlet")
public class customerDashboardServlet extends HttpServlet{
private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userID = (int) session.getAttribute("userID");
		String customerId = String.valueOf(userID);
		
	    if (customerId == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }

	    System.out.println("Customer ID in session: " + userID);
	    
	    int vid = vehicleService.getVehicleIdByUserId(userID);
	    boolean hasVehicleProfile = false;
	    
	    if (vid != 0) {
	    	
	        List<vehicleModel> newvehicleDetails = vehicleService.getVehicleDetails(vid);
	        request.setAttribute("vehicleDetails", newvehicleDetails);
	        hasVehicleProfile = true;
	        
	    } 
	    System.out.println(hasVehicleProfile);
	    request.setAttribute("hasVehicleProfile", hasVehicleProfile); 
	    RequestDispatcher dispatcher = request.getRequestDispatcher("customerDashboard.jsp");
	    dispatcher.forward(request, response);

	}
}
