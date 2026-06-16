package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.userDetailsServices;
import model.regularCustomer;
import model.userModel;

@WebServlet("/setLoyaltyServlet")
public class setLoyaltyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String loyaltyType = request.getParameter("loyaltyType");
		
		userModel user = new regularCustomer();
		user.setEmail(email);
		user.setUserType(loyaltyType);
		boolean isvalid = userDetailsServices.setLoyaltyType(user);
		
		if(isvalid) {
			response.getWriter().println("<script>alert('Loyalty Type Set Successfully'); window.location.href='adminDashboardServlet'</script>");
		}
		else {
			response.getWriter().println("<script>alert('Loyalty Type Set Unsuccessfully'); window.location.href='adminDashboardServlet'</script>");

		}
	}

}
