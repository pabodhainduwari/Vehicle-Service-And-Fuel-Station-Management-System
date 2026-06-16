package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.vehicleModel;
import services.vehicleService;

@WebServlet("/createvehicleProfileServlet")
public class createvehicleProfileServlet extends HttpServlet {
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
		
		
	    vehicleModel newVehicle = new vehicleModel();
		
		newVehicle.setCusID(id);
		newVehicle.setOwner(request.getParameter("owner-name"));
		newVehicle.setvType(request.getParameter("vehicle-type"));
		newVehicle.setReg_Num(request.getParameter("reg-number"));
		newVehicle.setChassis(request.getParameter("chassis-number"));
		newVehicle.setEngine(request.getParameter("engine-number"));
		newVehicle.setFuel(request.getParameter("fuel-type"));
		newVehicle.setYear(request.getParameter("year"));
		newVehicle.setvMake(request.getParameter("make"));
		newVehicle.setvModel(request.getParameter("model"));
		
		
		boolean isTrue;
		
		isTrue = vehicleService.registerVehicle(newVehicle);
		
		if (isTrue==true) {
			String alertMessage = "Vehicle Profile create Successfully!!";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='customerDashboardServlet'</script>");
		}

		else {
			String alertMessage = "Vehicle Profile create Unsuccessfully!!";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='customerDashboardServlet'</script>");
			request.setAttribute("username", "Alice");
		}
		
	}

}
