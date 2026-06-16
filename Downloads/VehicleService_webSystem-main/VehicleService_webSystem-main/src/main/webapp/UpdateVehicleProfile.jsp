<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="Stylesheet" href="css/Vehicle.css">
<link rel="Stylesheet" href="css/header_footer.css">
  <script src="header.js"></script>
  <style>
  body {
      margin: 0;
      padding: 40px;
      font-family: 'Segoe UI', sans-serif;
      background-image: url("https://4kwallpapers.com/images/wallpapers/windows-11-dark-mode-abstract-background-black-background-3840x2400-8710.jpg");
    }
    	
.styled-form {
    max-width: 900px;
    margin-top:0px;
    margin-bottom:20px;
    padding: 30px 40px;
    background-color: rgba(30,30,30,0.95); /* dark transparent */
    border-radius: 12px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.7);
    font-family: 'Segoe UI', sans-serif;
    color: #f0f0f0; /* soft light text for labels */
}

/* Grid layout for inputs */
.vehicle-info-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px 40px;
}

.vehicle-info-grid div {
    display: flex;
    flex-direction: column;
}

/* Labels */
.vehicle-info-grid label {
    font-weight: bold;
    font-size: 14px;
    color: #ffd600; /* bright yellow labels */
    margin-bottom: 6px;
}

/* Inputs and selects */
.vehicle-info-grid input,
.vehicle-info-grid select {
    padding: 10px 12px;
    border-radius: 6px;
    border: 1px solid #555555;
    background-color: #3b3b3b; /* dark input background */
    color: #f0f0f0; /* soft light text */
    font-size: 14px;
    transition: 0.3s;
}

/* Input focus effect */
.vehicle-info-grid input:focus,
.vehicle-info-grid select:focus {
    border-color: #ffd600; /* yellow border on focus */
    box-shadow: 0 0 8px rgba(255, 214, 0, 0.5); /* yellow glow */
    outline: none;
}

/* Read-only fields */
.vehicle-info-grid input[readonly] {
    background-color: #2e2e2e;
    color: #cccccc;
}

/* Buttons */
.form-buttons input[type="submit"] {
    background-color: #ffd600; /* yellow button */
    color: #1a1a1a; /* dark text on button */
    font-weight: bold;
    padding: 12px 30px;
    border-radius: 8px;
    border: none;
    cursor: pointer;
    font-size: 16px;
    transition: 0.3s;
}

.form-buttons input[type="submit"]:hover {
    background-color: #e6c200; /* darker yellow on hover */
    transform: scale(1.05);
}

/* Responsive */
@media screen and (max-width:700px){
    .vehicle-info-grid {
        grid-template-columns: 1fr;
    }
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
	<%
		String id=request.getParameter("id");
		String oName=request.getParameter("owner");
		String vType=request.getParameter("vType");
		String regNum=request.getParameter("regNum");
		String chassis=request.getParameter("chassis");
		String engine=request.getParameter("engine");
		String fuel=request.getParameter("fuel");
		String year=request.getParameter("year");
		String vMake=request.getParameter("vMake");
		String vModel=request.getParameter("vModel");
		String cusId=request.getParameter("cusID");
	
	
	%>
<hr>
<div id="form" style="margin-top:70px;">
    <form action="UpdateVehicleProfileServlet" method="POST" class="styled-form">
        <h2 style="text-align:center; color:#00e5ff; margin-bottom:30px;">Vehicle Profile</h2>

        <div class="vehicle-info-grid">
            <div>
                <label>Vehicle ID:</label>
                <input type="text" name="v-ID" value="<%= id %>" readonly>
            </div>

            <div>
                <label>Owner's Name:</label>
                <input type="text" id="owner-name" name="owner-name" value="<%= oName %>">
            </div>

            <div>
                <label for="vehicle-type">Vehicle Type:</label>
                <select id="vehicle-type" name="vehicle-type">
                    <option value="car" <%= "car".equals(vType) ? "selected" : "" %>>Car</option>
                    <option value="bike" <%= "bike".equals(vType) ? "selected" : "" %>>Bike</option>
                    <option value="truck" <%= "truck".equals(vType) ? "selected" : "" %>>Truck</option>
                    <option value="other" <%= "other".equals(vType) ? "selected" : "" %>>Other</option>
                </select>
            </div>

            <div>
                <label>Registration Number:</label>
                <input type="text" id="reg-number" name="reg-number" value="<%= regNum %>">
            </div>

            <div>
                <label>Chassis Number:</label>
                <input type="text" id="chassis-number" name="chassis-number" value="<%= chassis %>">
            </div>

            <div>
                <label>Engine Number:</label>
                <input type="text" id="engine-number" name="engine-number" value="<%= engine %>">
            </div>

            <div>
                <label>Fuel Type:</label>
                <select id="fuel-type" name="fuel-type">
                    <option value="petrol" <%= "petrol".equals(fuel) ? "selected" : "" %>>Petrol</option>
                    <option value="diesel" <%= "diesel".equals(fuel) ? "selected" : "" %>>Diesel</option>
                    <option value="electric" <%= "electric".equals(fuel) ? "selected" : "" %>>Electric</option>
                    <option value="hybrid" <%= "hybrid".equals(fuel) ? "selected" : "" %>>Hybrid</option>
                </select>
            </div>

            <div>
                <label>Manufacturing Year:</label>
                <input type="number" id="year" name="year" min="1990" max="2099" value="<%= year %>">
            </div>

            <div>
                <label>Vehicle Make:</label>
                <input type="text" id="make" name="make" value="<%= vMake %>">
            </div>

            <div>
                <label>Vehicle Model:</label>
                <input type="text" id="model" name="model" value="<%= vModel %>">
            </div>

            <div>
                <label>Customer ID:</label>
                <input type="text" name="cus-ID" value="<%= cusId %>" readonly>
            </div>
        </div>

        <div class="form-buttons" style="display:flex; justify-content:center; margin-top:30px; gap:25px; flex-wrap:wrap;">
            <input type="submit" name="submit" value="Update Profile">
        </div>
    </form>
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