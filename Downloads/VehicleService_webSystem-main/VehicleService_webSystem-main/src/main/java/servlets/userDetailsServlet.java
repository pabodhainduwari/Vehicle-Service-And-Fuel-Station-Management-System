package servlets;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.userModel;
import model.regularCustomer;
import services.userDetailsServices;

@WebServlet("/userDetailsServlet")
public class userDetailsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int cusID = (Integer) session.getAttribute("userID");

        System.out.println("Customer ID in session: " + cusID);

        userModel newUserModel =
                userDetailsServices.getuserDetailsByUserID(cusID);

        request.setAttribute("userDetails", newUserModel);

        RequestDispatcher dis = request.getRequestDispatcher("profile.jsp");
        dis.forward(request, response);
    }
}
