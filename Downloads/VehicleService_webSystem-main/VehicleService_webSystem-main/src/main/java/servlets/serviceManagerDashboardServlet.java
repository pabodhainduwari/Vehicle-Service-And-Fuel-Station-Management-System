package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.serviceManagerDashboardModel;
import services.BookingService;
import services.mechanicServices;
import model.mechanicModel;



@WebServlet("/serviceManagerDashboardServlet")
public class serviceManagerDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
                  

            List<mechanicModel> allMechanics = mechanicServices.getAllMechanic();
            request.setAttribute("allMechanics", allMechanics);
            
            List<serviceManagerDashboardModel> allbookings = BookingService.getAllBookingDetails(); 
            request.setAttribute("bookings", allbookings);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("serviceManagerDashboard.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
