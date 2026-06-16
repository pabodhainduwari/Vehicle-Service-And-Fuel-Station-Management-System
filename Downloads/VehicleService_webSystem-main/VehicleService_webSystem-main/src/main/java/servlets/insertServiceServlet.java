package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.vehicleServiceModel;
import services.vehicleServicesService;;

@WebServlet("/insertServiceServlet")
public class insertServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String serviceName = request.getParameter("serviceName");
		String serviceType = request.getParameter("serviceType");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		
		vehicleServiceModel newService = new vehicleServiceModel();
		
		newService.setServiceName(serviceName);
		newService.setServiceType(serviceType);
		newService.setDescription(description);
		newService.setPrice(price);
		
		boolean isTrue;
		isTrue = vehicleServicesService.insertServicedata(newService);
		
		if(isTrue == true) {
			String alertMessage = "Data Insert Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='getAllServicesServlet'</script>");
		}
		else {
			RequestDispatcher dispacher = request.getRequestDispatcher("wrong.jsp");
			dispacher.forward(request, response);
		}

	}
	


}
