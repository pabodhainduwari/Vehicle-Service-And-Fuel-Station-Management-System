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

import model.YoungDriver;
import model.employeeModel;
import model.fuelInventoryModel;
import model.regularCustomer;
import model.seniorServerModel;
import model.userModel;
import model.vehicleServiceModel;
import services.fuelInventoryServices;
import services.userDetailsServices;
import services.vehicleServicesService;

@WebServlet("/indexServlet")
public class indexServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userID = 0;
		HttpSession session = request.getSession(false); // false to avoid creating a new session
		if (session != null && session.getAttribute("userID") != null) {
		    userID = (int) session.getAttribute("userID");
		}
		
		List<vehicleServiceModel> allServices = vehicleServicesService.getAllService();
		request.setAttribute("allServices", allServices);

		List<fuelInventoryModel> allFuelDetails = fuelInventoryServices.showFueldetails();
		request.setAttribute("allFuelDetails", allFuelDetails);
		
		/*
		 * cal discount
		 */
		
		userModel user = new regularCustomer();
		user.setUserID(userID);
		
		String userType = userDetailsServices.getUserTypeById(user);
		
		userModel user2 = null ;
		if ("regular".equals(userType)) {
			
			user2 = new regularCustomer();
			user2.setUserType(null);
		}
		else if("youngDriver".equals(userType)) {
			user2 = new YoungDriver();
			user2.setUserType("Young Driver");
			
		}
		else if("seniorServer".equals(userType)) {
			
			user2 = new seniorServerModel();
			user2.setUserType("Senior Server");
		}
		
		else if("employee".equals(userType)) {
			
			user2 = new employeeModel();
			user2.setUserType("Employee of MechFuel");
		}
		
		if (user2 != null) {
		    System.out.println(user2.getUserType()); // ✅ Only log if not null
		    request.setAttribute("user2", user2);    // ✅ Only set if not null
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);

	}
}
