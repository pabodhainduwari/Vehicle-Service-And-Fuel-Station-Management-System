package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.regularCustomer;
import model.userModel;
import services.loginServices;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		//used polymorphism
		userModel newUser = new regularCustomer();
		
		// get values from the form
		String email = request.getParameter("email");
		String password = request.getParameter("passWord");
		
		// set values to the new user object
		
		newUser.setEmail(email);
		newUser.setPassword(password);
		
		//new object from log in services to validate email and password
		loginServices newUserService = new loginServices();
		
		String[] values = newUserService.validateLoginDetails(newUser);
		
		String url = null;
		
		if(values[0].equals("0")){
            request.setAttribute("invalid_Credentials", true);
            url = "login.jsp";
            
            
        }
        
        if(values[0].equals("1")){
            request.setAttribute("invalid_Credentials", false);
            
            request.getSession().setAttribute("name", values[1]);
            request.getSession().setAttribute("userID", Integer.parseInt(values[3]));
            String userType = values[2];
             url = "indexServlet";
            
            
        }
        
        response.sendRedirect(url);
	}

}
