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


@WebServlet("/updateServicesServlet")
public class updateServicesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String serviceID = request.getParameter("serviceID");
		String serviceName = request.getParameter("serviceName");
		String serviceType = request.getParameter("serviceType");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		
		boolean isTrue;
		isTrue = vehicleServicesService.updateServicedata(serviceID, serviceName, serviceType, description, price);
		
		if(isTrue == true) {
			List<vehicleServiceModel> serviceDetails = vehicleServicesService.getServiceById(serviceID);
			request.setAttribute("serviceDetails", serviceDetails);
			
			String alertMessage = "Data Update Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='"+request.getContextPath()+"/getAllServicesServlet'</script>");
		}
		else {
			String alertMessage = "Data Update Unsuccessful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='"+request.getContextPath()+"/getAllServicesServlet'</script>");
		}
		
	}

}
