package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.vehicleModel;
import services.vehicleService;

@WebServlet("/UpdateVehicleProfileServlet")
public class UpdateVehicleProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		vehicleModel vehicle = new vehicleModel();
		
		vehicle.setId(Integer.parseInt(request.getParameter("v-ID")));
		vehicle.setOwner(request.getParameter("owner-name"));
		vehicle.setvType(request.getParameter("vehicle-type"));
		vehicle.setReg_Num(request.getParameter("reg-number"));
		vehicle.setChassis(request.getParameter("chassis-number"));
		vehicle.setEngine(request.getParameter("engine-number"));
		vehicle.setFuel(request.getParameter("fuel-type"));
		vehicle.setYear(request.getParameter("year"));
		vehicle.setvMake(request.getParameter("make"));
		vehicle.setvModel(request.getParameter("model"));
		vehicle.setCusID(Integer.parseInt(request.getParameter("cus-ID")));
		
		boolean isTrue;
		
		isTrue=vehicleService.updateVehicle(vehicle);
		
		if(isTrue==true)
		{
			String alertMessage = "Vehicle Profile Update Successfully!!";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='customerDashboardServlet'</script>");
		}
		else {
			String alertMessage = "Vehicle Profile Update Unsuccessfully!!";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='customerDashboardServlet'</script>");
		}
	}

}
