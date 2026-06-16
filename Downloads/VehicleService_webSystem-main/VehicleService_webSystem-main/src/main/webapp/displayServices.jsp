<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service Details</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/servicesStyles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header_footer.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Spectral|Rubik">
<link href='https://fonts.googleapis.com/css?family=EB Garamond'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Lato'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Varela Round' rel='stylesheet'>
<script src="js/header.js"></script>
<style>
	
</style>
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
<main >
	<h2> Vehicle Service Details</h2>
	<form action="addServiceDetails.jsp" method="post" style="margin-bottom: 15px; ">
		<button type ="submit" class="btn btn-add"> Add New Service</button>
	</form>
	
	<table>
		<tr>
			<th>Service ID</th>
			<th>Service Name</th>
			<th>Service Type</th>
			<th>Description</th>
			<th>Price</th>
			<th>Action</th>
		</tr>
		<c:forEach var="vService" items="${allServices}">
		<tr>
			<td>${vService.serviceID}</td>
			<td>${vService.serviceName}</td>
			<td>${vService.serviceType}</td>
			<td>${vService.description}</td>
			<td>${vService.price}</td>
			
			
			<td class="action-buttons">
    		<form action="updateServices.jsp" method="post">
        		<input type="hidden" name="serviceID" value="${vService.serviceID}">
        		<input type="hidden" name="serviceName" value="${vService.serviceName}">
        		<input type="hidden" name="servicetype" value="${vService.serviceType}">
        		<input type="hidden" name="description" value="${vService.description}">
        		<input type="hidden" name="price" value="${vService.price}">
        		
        		<button type="submit" class="btn btn-update">Update</button>
    		</form>
    		
    	<form action="deleteServiceServlet" method="post">
        	<input type="hidden" name="serviceID" value="${vService.serviceID}">
        	<button type="submit" class="btn btn-delete">Delete</button>
    	</form>
	</td>

</tr>
		</c:forEach>
	</table>
</main>
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