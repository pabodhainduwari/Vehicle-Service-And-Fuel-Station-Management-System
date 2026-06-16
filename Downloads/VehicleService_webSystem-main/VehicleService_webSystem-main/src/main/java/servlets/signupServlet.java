package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.regularCustomer;
import model.userModel;
import services.signupServices;

@WebServlet("/signupServlet")
public class signupServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		//used polymorphism
		userModel newUser = new regularCustomer();

        // get values from the form
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String name = request.getParameter("name");
        String password = request.getParameter("passWord");
        String NIC = request.getParameter("NIC");

        // set values to the new user object        
        
        newUser.setEmail(email);
        newUser.setUserName(userName);
        newUser.setName(name);
        newUser.setPassword(password);
        newUser.setNIC(NIC);
        

        //new object from sign up services to validate email and username
        signupServices newUserService = new signupServices();
        
        
        boolean[] values = newUserService.insertUserDetails(newUser);
        
        
        
        String url = "indexServlet";
        if(values[0]){
            request.setAttribute("emailTaken", true);
            url = "signup.jsp";
            
        }
        if(values[1]){
            request.setAttribute("usernameTaken", true);
            url = "signup.jsp";
            
        }
        if(!values[0] && !values[1]){
            request.setAttribute("emailTaken", false);
            request.setAttribute("usernameTaken", false);
            
            
            
			userModel user = signupServices.getLastAddedUser();
			
			int userID = user.getUserID();
			
			request.getSession().setAttribute("name", name);
			request.getSession().setAttribute("userID", userID);
            
			
                    
        }
        

        response.sendRedirect(url);
	}
}
    