package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.employeeModel;
import services.EmployeeServices;



@WebServlet("/EmployeeInsertServlet")
public class EmployeeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String nic = request.getParameter("nic");
        String phone = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String empType = request.getParameter("empType");
        int salary = Integer.valueOf(request.getParameter("salary"));
        
        
        employeeModel newEmployee = new employeeModel();
        
        
        newEmployee.setNIC(nic);
        newEmployee.setMobile(phone);        
        newEmployee.setAddress(address);
        newEmployee.setSalary(salary);
        newEmployee.setEmpType(empType);
        
        boolean isTrue = EmployeeServices.insertEmployee(newEmployee);
        
        
        
        if(isTrue == true) {
			String alertMessage = "Employee Register Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='adminDashboardServlet'</script>");
		}
		else {
			String alertMessage = "Unsuccessful! Employee must already be registered as a regular user";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='adminDashboardServlet'</script>");
		}
			
	}

}
