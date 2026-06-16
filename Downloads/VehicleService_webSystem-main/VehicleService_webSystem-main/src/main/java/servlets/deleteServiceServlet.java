package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.vehicleServiceModel;
import services.vehicleServicesService;

@WebServlet("/deleteServiceServlet")
public class deleteServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String serviceID = request.getParameter("serviceID");
		
		
		boolean isTrue;
		isTrue = vehicleServicesService.deleteServicedata(serviceID);
		
		if(isTrue == true) {
			String alertMessage = "Booking Delete Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='"+request.getContextPath()+"/getAllServicesServlet'</script>");
		}
		else {
			
				
			String alertMessage = "Booking Delete Unsuccessful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='"+request.getContextPath()+"/getAllServicesServlet'</script>");
				
		}
	}

}
