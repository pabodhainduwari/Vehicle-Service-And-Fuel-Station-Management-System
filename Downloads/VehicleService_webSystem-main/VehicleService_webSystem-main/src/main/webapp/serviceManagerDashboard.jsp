<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Service Manager Dashboard</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/serviceManagerDashboard.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header_footer.css">
<script src="js/header.js"></script>
</head>
<body>

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
    
    <div class="dashboard-container">
    <!-- sidebar -->
	<aside class="sidebar">
		<div class="user-profile">
    	<img src="${pageContext.request.contextPath}/images/services/your_photo.jpg" alt="Your Photo" class="profile-photo">

        <h2>Welcome!! <%= session.getAttribute("name") %></h2>
    </div>
    <div class="sidebar-nav">
         <a href="getAllServicesServlet"> 🛠️ Service Details</a>
         <a href="displayMechanic"> 👨‍🔧 Mechanic Details</a>
    </div>
	
	</aside>
      <!-- main container -->  
   <main class="main-container">
 		<!-- table first -->
 		
 		<div>
 		<h2 class="booking-header">Service Booking Details</h2>
 		</div>
	<div>
		<table>
			<tr>
				<th>BookingID</th>
				<th>Customer ID</th>
				<th>Customer Name</th>
				<th>Contact Number</th>
				<th>Service</th>
				<th>Service Date</th>
				<th>Service Time</th>
				
				<th>Action</th>
			</tr>
			<c:forEach var="booking" items="${bookings}">
				<tr>
					<td>${booking.bookingID}</td>
					<td>${booking.customerID}</td>
					<td>${booking.customerName}</td>
					<td>${booking.contactNumber}</td>
					<td>${booking.service}</td>
					<td>${booking.serviceDate}</td>
					<td>${booking.serviceTime}</td>
					
					<td>	
						<form action="assignMechanicServlet" method="post">
							<input type="hidden" name="bookingID" value="${booking.bookingID}">
							<select name="mechanicID">
								<option value="0">Assign</option>
								<c:forEach var="mech" items="${allMechanics}">
									<option value="${mech.mechanicID}">${mech.mechanicName}</option>
								</c:forEach>
							</select>
							
					
						<button type="submit">Assign</button>
				
						</form>
					</td>
				
					
				</tr>
				
			</c:forEach>
		</table>
	</div>
	
    </main>
 </div>
 <footer class="footer-section">
			  <div class="footer-overlay"></div>
			
			  <div class="footer-content" style="display: flex; justify-content: space-between; align-items: center;">
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