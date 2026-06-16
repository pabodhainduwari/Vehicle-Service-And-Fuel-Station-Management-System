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

@WebServlet("/CheckVehicleServlet")
public class CheckVehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("userID");
		String customerId = String.valueOf(id);
	    

	    if (customerId == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }

	    System.out.println("Customer ID in session: " + id);
	    
	    int vehicleId = vehicleService.getVehicleIdByUserId(id);
	    if (vehicleId != 0) {
	    	
	        List<vehicleModel> newvehicleDetails = vehicleService.getVehicleDetails(vehicleId);
	        request.setAttribute("vehicleDetails", newvehicleDetails);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("vehicleProfile.jsp");
	        dispatcher.forward(request, response);

	    } else {
	    	System.out.println("noid");
	        
	        
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("createvehicleProfile.jsp");
	        dispatcher.forward(request, response);

	    }

	}

}
