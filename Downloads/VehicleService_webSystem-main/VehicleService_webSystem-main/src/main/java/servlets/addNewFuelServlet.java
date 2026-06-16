package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.fuelInventoryModel;
import services.fuelInventoryServices;

@WebServlet("/addNewFuelServlet")
public class addNewFuelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

		fuelInventoryModel newFuelModel = new fuelInventoryModel();

		String fuelName = request.getParameter("fuelName");

		// Parse the string input to int and float properly
		int stockAmount = Integer.parseInt(request.getParameter("stockAmount"));
		float pricePerUnit = Float.parseFloat(request.getParameter("pricePerUnit"));


		newFuelModel.setFuelName(fuelName);
		newFuelModel.setStockAmount(stockAmount);
		newFuelModel.setPricePerUnit(pricePerUnit);
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String lastUpdated = sdf.format(today);
		newFuelModel.setLastUpdated(lastUpdated);

		fuelInventoryServices newInventoryService = new fuelInventoryServices();

		newInventoryService.insertFuelDetails(newFuelModel);
		
		response.sendRedirect("fuelManagerDashboardServlet");
		
//		RequestDispatcher dis = request.getRequestDispatcher("/fuelManagerDashboard.jsp");
//        
//        dis.forward(request, response);

	}
}
