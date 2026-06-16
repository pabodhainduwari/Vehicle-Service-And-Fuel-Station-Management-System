<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Service Details</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/servicesStyles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header_footer.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Spectral|Rubik">
<link href='https://fonts.googleapis.com/css?family=EB Garamond'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Lato'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Varela Round' rel='stylesheet'>
<script src="js/header.js"></script>
<script src="js/addServiceDetails.js"></script>

<style>
	
	.background {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image: url("asset/addServicePageBackground.jpg");
    background-size: cover;
    background-position: center;
    filter: blur(8px);
    z-index: -1;
    transform: scale(1.1);
	
    
}

body{
	background-color: transparent;
	margin: 0;
}
tr:nth-child(odd){
	background-color:#ffffff;
    color: rgb(0, 0, 0);
    
}
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
<main style="margin-top: 50px;">
	<div class="background"></div>
		
	<form action="insertServiceServlet" method="post" onsubmit = " return validateForm();">
		<h3> Add New Vehicle Service</h3>
		<table>
			<tr>
  				<td>Service name:</td>
  				<td><input type = "text" class="form-control" id="serviceName" name="serviceName" required></td>
  			</tr>
  			
  			<tr>
    			<td>Service Type:</td>
    			<td><select class="form-select" id="serviceType" name="serviceType" required>
  						<option value="Repair">Repair</option>
  						<option value="Maintenance">Maintenance</option>
  						<option value="Diagnostics">Diagnostics</option>
  						<option value="Inspection">Inspection</option>
  						<option value="Cleaning"> Cleaning </option>
  					</select>
  				</td>
  			</tr>
  			<tr>
  				<td>Description:</td>
  				<td><textarea class="form-control" id="description" name="description" rows="5" required></textarea></td>
  			</tr>
  			<tr>
  				<td>Price(LKR):</td>
  				<td><input type="number" class="form-control" id="price" name="price" required></td>
  			</tr>
  			
  			<tr>
  				<td colspan="2"><input type="submit" value="Submit" class="btn btn-add"></td>
  			</tr>
  			</table>
  		</form>
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