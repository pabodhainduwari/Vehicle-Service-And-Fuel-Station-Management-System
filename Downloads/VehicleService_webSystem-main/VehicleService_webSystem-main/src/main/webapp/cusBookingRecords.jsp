<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Service Booking History</title>
  <link rel="Stylesheet" href="css/header_footer.css">
  <script src="js/header.js"></script>
  <style>
    body {
      background-color: #121212;
      color: #fff;
      font-family: Arial, sans-serif;
      padding: 20px;
      margin: 0;
    }

    h1 {
      text-align: center;
    }

    .top-bar {
      display: flex;
      justify-content: space-between;
      margin-bottom: 20px;
    }

    .top-bar button {
	  padding: 4px 16px; /* smaller vertical padding */
	  background-color: #1abc9c;
	  color: white;
	  border: none;
	  border-radius: 5px;
	  cursor: pointer;
	  font-size: 16px;
	}


    table {
      width: 100%;
      border-collapse: collapse;
      background-color: #1e1e1e;
      margin-bottom:220px;
    }

    th, td {
      padding: 12px;
      text-align: center;
      border-bottom: 1px solid #333;
    }

    th {
      background-color: #222;
    }

    .btn-view {
      background-color: gold;
      border: none;
      padding: 5px 10px;
      border-radius: 4px;
      cursor: pointer;
    }

    .btn-delete {
      background-color: #e74c3c;
      color: white;
      border: none;
      padding: 5px 10px;
      border-radius: 4px;
      cursor: pointer;
    }

    .btn-view:hover, .btn-delete:hover {
      opacity: 0.8;
    }
  </style>
</head>
<header>
	<script>
window.onload = function() {
    var userType = "${not empty user2 ? user2.userType : ''}";
    var name = "<%= session.getAttribute("name") != null ? session.getAttribute("name") : "" %>";
    var nameCont = document.getElementById("dp_nameCont");
    var loginSignupCont = document.getElementById("login_signup_cont");
    var discountLine = document.getElementById("discountLine");

    if (!name || name === "null") {
        if (nameCont) nameCont.style.display = 'none';
        if (loginSignupCont) loginSignupCont.style.display = 'flex';
    }

    if (!userType || userType === "null" || userType.trim() === "") {
        if (discountLine) discountLine.style.display = 'none';
    } else {
        if (discountLine) discountLine.style.display = 'flex';
    }
};
</script>


    <div class="headerCont">
        <div class="systemNameCont">
            <p class="" id="systemName1">Mech</p><p id="systemName2">Fuel</p>
        </div>
        <div class="navCont">
            <nav>
                <a href="indexServlet">Home</a>
                <a href="aboutUs_contactUs.jsp">About Us</a>
                <a href="FAQ.jsp">FAQ</a>
                <a href="aboutUs_contactUs.jsp#contact-section">Contact Us</a>
            </nav>
        </div>
        <div class="dp_nameCont" id="dp_nameCont">
            <div class="dpCont">
                <img src="asset/dp2.jpg" id="dp">
            </div>
            <div class="dropdownWrapper">
                <button class="userName" onclick="toggleDropDown()"><%= session.getAttribute("name") %></button>

    
                <div class="dropDownCont" id="dropDownCont">
                    <a href="login.jsp" class="logoutButton">Log Out</a>
                    <a href="dashboardCheckerServlet" class="logoutButton">Dashboard</a>
                </div>
            </div>
            
        </div> 
        <div class="login_signup_cont" id="login_signup_cont">
            <div class="login_signup_btn" id="loginBtn">
                <a href="login.jsp">Log In</a>
            </div>
            <div class="login_signup_btn" id="signupBtn">
                <a href="signup.jsp">Sign Up</a>
            </div>
        </div>       
    </div>
    
</header>
<body>

  <div class="top-bar">
    <h1>Service Booking History</h1>
    <a href="BookingForm.jsp">
    <button style="margin-top:50px;">Book a Service</button>
    </a>
  </div>

  <table>
    <thead>
      <tr>
        <th>Booking Id</th>
        <th>CustomerName</th>
        <th>Contact No</th>
        <th>Email</th>
        <th>Services</th>
        <th>Date</th>
        <th>Time</th>
        <th>Additional Notes</th>
        <th>Mechanic Status</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="service" items="${sDetails}">
    
      <tr>
        <td>${service.bookingId}</td>
        <td>${service.name}</td>
        <td>${service.phone}</td>
        <td>${service.email}</td>
        <td>${service.sType}</td>
        <td>${service.sDate}</td>
        <td>${service.sTime}</td>
        <td>${service.issues}</td>
        <td>${service.mechStatus}</td>
        <td>
        <form action="viewBookingDetailsServlet" method="post">
          <input type="hidden" name="bookingID" value="${service.bookingId }">
          <button class="btn-view">view</button>
        </form>
        </td>
      </tr>
    </c:forEach> 
    </tbody>
  </table>
<footer class="footer-section">
			  <div class="footer-overlay"></div>
			
			  <div class="footer-content" style="display: flex; justify-content: space-between; align-items: center;margin: 0;">
			    <div class="footer-branding">
			      <h2><span style="color: #FFA500;">Mech</span>Fuel</h2>
			      <p>Your trusted pit stop for service & fuel</p>
			    </div>
			
			    <div class="footer-links">
			      <a href="indexServlet">Home</a>
			      <a href="aboutUs_contactUs.jsp">About Us</a>
			      <a href="FAQ.jsp">FAQ</a>
			      <a href="aboutUs_contactUs.jsp#contact-section">Contact Us</a>
			    </div>
			
			    <div class="footer-contact">
			      <p>📍 123 Auto Lane, MechCity</p>
			      <p>📞 +1 800-123-MECH</p>
			      <p>✉️ support@mechfuel.com</p>
			    </div>
			  </div>
			</footer>
</body>
</html>
