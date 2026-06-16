package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.EmployeeServices;

/**
 * Servlet implementation class EmployeeDeleteServlet
 */
@WebServlet("/EmployeeDeleteServlet")
public class EmployeeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        boolean isDeleted = EmployeeServices.deleteEmployee(id);

        if (isDeleted) {
            response.getWriter().println("<script>alert('Employee Deleted Successfully'); window.location.href='adminDashboardServlet'</script>");
        } else {
            response.getWriter().println("<script>alert('Failed to Delete Employee'); window.location.href='adminDashboardServlet'</script>");
        }
    }

}
