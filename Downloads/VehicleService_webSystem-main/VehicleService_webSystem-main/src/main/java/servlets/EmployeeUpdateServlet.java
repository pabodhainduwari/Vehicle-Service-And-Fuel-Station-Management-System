package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.EmployeeServices;

@WebServlet("/EmployeeUpdateServlet")
public class EmployeeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String nic = request.getParameter("nic");
		String phone = request.getParameter("mobile");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		float salary = Float.parseFloat(request.getParameter("salary"));
		String empType = request.getParameter("empType");
		//String action = request.getParameter("action");
		
		boolean isTrue;
		isTrue = EmployeeServices.updateEmployeeProfile(id, name, nic, phone, email, address,salary, empType );
		if(isTrue == true) {
			
				String alertMessage = "Data Update Sucessful";
				response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='adminDashboardServlet'</script>");
						
		}		
		else {
			String alertMessage = "Data Update Unsucessful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='adminDashboardServlet'</script>");
			 }
				
		}
	
	

}
