package servlets;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import services.vehicleService;

@WebServlet("/deleteVehicleProfileServlet")
public class deleteVehicleProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String vid = request.getParameter("vid");
	    int vehicleId = Integer.parseInt(vid);
	    
	    boolean isTrue;
		
		isTrue = vehicleService.deleteVehicle(vehicleId);
		System.out.println(vid);
		
		if(isTrue==true)
		{
			
			String alertMessage = "Vehicle Profile delete Successfully!!";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='customerDashboardServlet'</script>");
		}
		else {
			
			String alertMessage = "Vehicle Profile delete Unsuccessfully!!";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='customerDashboardServlet'</script>");
		}
	}

     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

}
