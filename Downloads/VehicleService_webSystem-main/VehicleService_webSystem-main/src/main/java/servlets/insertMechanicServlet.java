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


@WebServlet("/insertMechanicServlet")
public class insertMechanicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mechanicName = request.getParameter("mechanicName");
		String mechanicContact = request.getParameter("mechanicContact");
	    String specialty = request.getParameter("specialty");
		String experience = request.getParameter("experience");
		
		mechanicModel newMechanic = new mechanicModel();
		
		newMechanic.setMechanicName(mechanicName);
		newMechanic.setMechanicContact(mechanicContact);
		newMechanic.setSpecialty(specialty);
		newMechanic.setExperience(experience);
		
;		boolean isTrue;
		isTrue = mechanicServices.insertMechanicdata(newMechanic);
		
		if(isTrue == true) {
			String alertMessage = "Data Insert Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='displayMechanic'</script>");
		}
		else {
			String alertMessage = "Data Insert Unsuccessful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='displayMechanic'</script>");
			
		}
	}

}
