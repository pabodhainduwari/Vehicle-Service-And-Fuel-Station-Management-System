package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.employeeModel;
import services.EmployeeServices;


@WebServlet("/adminDashboardServlet")
public class adminDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<employeeModel> employees = EmployeeServices.getAllEmployee();
		
		 	request.setAttribute("em", employees);

	        // Forward to adminList.jsp
	        RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboard.jsp");
	        dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
