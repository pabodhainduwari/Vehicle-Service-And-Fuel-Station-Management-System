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


@WebServlet("/updateMechanicServlet")
public class updateMechanicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mechanicID = request.getParameter("mechanicID");
		String mechanicName = request.getParameter("mechanicName");
		String mechanicContact = request.getParameter("mechanicContact");
		String specialty = request.getParameter("specialty");
		String experience = request.getParameter("experience");
		
		mechanicModel mechanic = new mechanicModel();
		
		mechanic.setMechanicID(Integer.parseInt(mechanicID));
		mechanic.setMechanicName(mechanicName);
		mechanic.setMechanicContact(mechanicContact);
		mechanic.setSpecialty(specialty);
		mechanic.setExperience(experience);
		
		boolean isTrue;
		isTrue = mechanicServices.updateMechanicdata(mechanic);
		
		if(isTrue == true) {
			String alertMessage = "Data Update Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='"+request.getContextPath()+"/displayMechanic'</script>");
		}
		else {
			String alertMessage = "Data Update Unsuccessful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='displayMechanic'</script>");
		}
	}

}
