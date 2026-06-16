package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.mechanicModel;
import services.mechanicServices;

@WebServlet("/deleteMechanicServlet")
public class deleteMechanicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mechanicID = request.getParameter("mechanicID");
		
		mechanicModel mechanic = new mechanicModel();
		mechanic.setMechanicID(Integer.parseInt(mechanicID));
		
		boolean isTrue;
		isTrue = mechanicServices.deleteMechanicdata(mechanic);
		
		if(isTrue == true) {
			String alertMessage = "Data Delete Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='displayMechanic'</script>");
		}
		else {
			String alertMessage = "Data Delete Unsuccessful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='displayMechanic'</script>");
		}
	}

}
