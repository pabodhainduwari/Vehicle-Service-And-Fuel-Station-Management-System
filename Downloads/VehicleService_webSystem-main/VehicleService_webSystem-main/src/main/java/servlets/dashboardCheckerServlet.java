package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.employeeModel;
import model.regularCustomer;
import model.userModel;
import services.EmployeeServices;


@WebServlet("/dashboardCheckerServlet")
public class dashboardCheckerServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int userID = (Integer) session.getAttribute("userID"); 
		
		System.out.println(userID);
		//polymorphism used		
		userModel user = new regularCustomer();
		
		user.setUserID(userID);
		
		employeeModel emp = new employeeModel();
		emp = EmployeeServices.getEmpDetails(user);
		
		String empType = emp.getEmpType();
		
		String url = null;
		System.out.println("user type "+ empType);
		if("serviceManager".equals(empType)){
			
			request.getSession().setAttribute("empType", "serviceManager");
			url = "serviceManagerDashboardServlet";
		}
		else if ("fuelManager".equals(empType)){
			request.getSession().setAttribute("empType", "fuelManager");
			url = "fuelManagerDashboardServlet";
		}
		else if("admin".equals(empType)){
			request.getSession().setAttribute("empType", "admin");
			url = "adminDashboardServlet";
		}else {
			request.getSession().setAttribute("empType", "customer");
			url = "customerDashboardServlet";
		}
		
		response.sendRedirect(url);
	}

}
