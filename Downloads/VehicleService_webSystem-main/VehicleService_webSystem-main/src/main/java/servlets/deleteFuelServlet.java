package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.fuelInventoryModel;
import services.fuelInventoryServices;

@WebServlet("/deleteFuelServlet")
public class deleteFuelServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		fuelInventoryModel newFuelModel = new fuelInventoryModel();
		
		int fuelNumber = Integer.parseInt(request.getParameter("fuelNumber"));
		newFuelModel.setFuelNumber(fuelNumber);
		
		fuelInventoryServices newInventoryService = new fuelInventoryServices();
		
		newInventoryService.deleteFuelDetails(newFuelModel);
		response.sendRedirect("fuelManagerDashboardServlet");
	}
	
	
	
}
