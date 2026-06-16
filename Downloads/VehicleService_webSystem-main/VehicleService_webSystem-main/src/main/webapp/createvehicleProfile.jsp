<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Vehicle Registration Form</title>
  <link rel="Stylesheet" href="css/Vehicle.css">
  <link rel="Stylesheet" href="css/header_footer.css">
  <script src="js/header.js"></script>
  <style>
  body {
  font-family: 'Segoe UI', sans-serif;
  background-color: #f5f5f5;
  margin: 0;
  padding: 20px;
}

.vehicle-form-wrapper {
  max-width: 750px;
  margin: 40px auto;
  background: #fff;
  padding: 40px;
  border-radius: 12px;
  box-shadow: 0 6px 20px rgba(0,0,0,0.1);
}

h1 {
  text-align: center;
  color: #ff9900;
  margin-bottom: 35px;
}

.form-section {
  margin-bottom: 30px;
}

.form-section h2 {
  font-size: 20px;
  color: #0077b6;
  margin-bottom: 20px;
  border-bottom: 1px solid #ddd;
  padding-bottom: 5px;
}

.form-row {
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
}

.form-group {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.form-group label {
  margin-bottom: 6px;
  font-weight: bold;
}

.form-group input,
.form-group select {
  padding: 12px 15px;
  border-radius: 6px;
  border: 1px solid #ccc;
  font-size: 14px;
  background: #fff;
  color: #000;
  box-sizing: border-box; /* ensures proper width */
}

.form-group input:focus,
.form-group select:focus {
  border-color: #ff9900;
  box-shadow: 0 0 6px rgba(255,153,0,0.3);
  outline: none;
}

.form-submit {
  text-align: center;
  margin-top: 30px;
}

.form-submit button {
  background-color: #ff9900;
  color: white;
  font-size: 16px;
  padding: 14px 50px;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: 0.3s;
}

.form-submit button:hover {
  background-color: #e68a00;
  transform: scale(1.05);
}

/* Responsive */
@media screen and (max-width: 650px) {
  .form-row {
    flex-direction: column;
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
  <div class="vehicle-form-wrapper">
  <h1>🚗 Vehicle Registration Form</h1>

  <form action="createvehicleProfileServlet" method="POST">

    <!-- Owner Information -->
    <div class="form-section">
      <h2>Owner Information</h2>
      <div class="form-row">
        <div class="form-group">
          <label for="ownerName">Full Name</label>
          <input type="text" id="ownerName" name="owner-name" placeholder="John Doe" required>
        </div>
        <div class="form-group">
          <label for="phone">Phone Number</label>
          <input type="tel" id="phone" name="phone-number" placeholder="0712345678" required>
        </div>
      </div>
      <div class="form-group">
        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" placeholder="example@email.com">
      </div>
    </div>

    <!-- Vehicle Information -->
    <div class="form-section">
      <h2>Vehicle Information</h2>
      <div class="form-row">
        <div class="form-group">
          <label for="vehicleType">Vehicle Type</label>
          <select id="vehicleType" name="vehicle-type" required>
            <option value="" disabled selected>Select type</option>
            <option value="car">Car</option>
            <option value="bike">Bike</option>
            <option value="truck">Truck</option>
            <option value="van">Van</option>
            <option value="other">Other</option>
          </select>
        </div>
        <div class="form-group">
          <label for="vehicleMake">Vehicle Make</label>
          <input type="text" id="vehicleMake" name="make" placeholder="Toyota, Honda" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label for="vehicleModel">Vehicle Model</label>
          <input type="text" id="vehicleModel" name="model" placeholder="Civic, Splendor" required>
        </div>
        <div class="form-group">
          <label for="regNumber">Registration Number</label>
          <input type="text" id="regNumber" name="reg-number" placeholder="ABC-1234" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label for="chassisNumber">Chassis Number</label>
          <input type="text" id="chassisNumber" name="chassis-number" placeholder="CH12345678" required>
        </div>
        <div class="form-group">
          <label for="engineNumber">Engine Number</label>
          <input type="text" id="engineNumber" name="engine-number" placeholder="ENG1234567" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label for="fuelType">Fuel Type</label>
          <select id="fuelType" name="fuel-type" required>
            <option value="" disabled selected>Select fuel</option>
            <option value="petrol">Petrol</option>
            <option value="diesel">Diesel</option>
            <option value="electric">Electric</option>
            <option value="hybrid">Hybrid</option>
          </select>
        </div>
        <div class="form-group">
          <label for="year">Manufacturing Year</label>
          <input type="number" id="year" name="year" min="1990" max="2070" placeholder="2023" required>
        </div>
      </div>
    </div>

    <div class="form-submit">
      <button type="submit">Register Vehicle</button>
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
<script src="js/createVehicleProfile.js"></script>
</body>
</html>