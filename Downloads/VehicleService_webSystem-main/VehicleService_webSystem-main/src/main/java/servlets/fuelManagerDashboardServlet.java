package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.fuelInventoryModel;
import services.fuelInventoryServices;

@WebServlet("/fuelManagerDashboardServlet")
public class fuelManagerDashboardServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		
		
		fuelInventoryServices newfuelService = new fuelInventoryServices();
		ArrayList<fuelInventoryModel> fuelList = new ArrayList<fuelInventoryModel>();
		
		fuelList = newfuelService.showFueldetails();
		request.setAttribute("fuelList", fuelList); // send list to JSP
		if(fuelList != null)
		{
						
	        RequestDispatcher dispatcher = request.getRequestDispatcher("fuelManagerDashboard.jsp");         
	        dispatcher.forward(request, response);
		}
		else {
			System.out.println("fuellis is null");
		}
        
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // allow POST to fallback to GET
    }
	
}
