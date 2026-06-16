<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Vehicle Service Booking Form</title>
  <link rel="Stylesheet" href="css/header_footer.css">
  <script src="js/header.js"></script>
  

  <style>
    body {
	    font-family: Arial, sans-serif;
	    background-color: rgb(97, 97, 97);
	    background-repeat: no-repeat;
		background-size: cover;
		background-position: center;
		background-attachment: fixed;
		width: 100%;
		margin: 0;
	  }

    .form-container {
    	max-width: 800px;
      margin: auto;
      background: #ffffff;
      padding: 30px;
      border-radius: 10px;
      width: 700px;
      box-shadow: 0 0 10px rgba(0,0,0,0.6);
      margin-top:50px;
      margin-bottom:20px;
    }

    h2 {
      color: #000000;
      border-bottom: 1px solid #db7500;
      padding-bottom: 5px;
      margin-top: 30px;
    }
    
    h1{
    	color:rgb(0, 0, 0);
    	text-align:center;
    }

    .form-group {
      margin: 15px 0;
      display: flex;
      flex-direction: column;
    }

    .form-group label {
      font-weight: bold;
      margin-bottom: 5px;
    }

    .form-group input,
    .form-group select,
    .form-group textarea {
      padding: 10px;
      border: none;
      border-radius: 5px;
      background-color: #4d412f;
      color: #ffffff;
    }

    .form-group input::placeholder,
    .form-group textarea::placeholder {
      color: #cccccc;
    }

    .form-row {
      display: flex;
      gap: 20px;
    }

    .form-row .form-group {
      flex: 1;
    }

    .form-group textarea {
      resize: vertical;
      min-height: 60px;
    }

    small {
      font-size: 12px;
      color: #aaa;
      margin-top: 5px;
    }

    .submit-btn {
      margin-top: 30px;
      display: flex;
      justify-content: center;
    }

    .submit-btn button {
      padding: 12px 30px;
      font-size: 16px;
      background-color: #ff9900;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .submit-btn button:hover {
      background-color: #ffbb00;
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
  <div class="form-container">
  <h1>Service Booking Form </h1>
    
	<form action="serviceBookingServlet" method="POST" >
	  <h2>📋 Customer Information</h2>
	  <div class="form-row">
	    <div class="form-group">
	      <label for="fullName">👤 Full Name</label>
	      <input type="text" id="fullName" name="full_name" placeholder="Enter your full name" required>
	    </div>
	    <div class="form-group">
	      <label for="phone">📞 Phone Number</label>
	      <input type="tel" id="phone" name="phone_number" placeholder="0712345678" required>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="email">📧 Email Address</label>
	    <input type="email" id="email" name="email_address" placeholder="yourname@example.com">
	  </div>
	
	  <h2>🚗 Vehicle Information</h2>
	  <div class="form-row">
	    <div class="form-group">
	      <label for="vehicleType">🚙 Vehicle Type</label>
	      <select id="vehicleType" name="vehicle_type">
	        <option value="">Select vehicle type</option>
	        <option value="car">Car</option>
	        <option value="bike">Bike</option>
	        <option value="truck">Truck</option>
	        <option value="van">Van</option>
	        <option value="other">Other</option>
	      </select>
	    </div>
	    <div class="form-group">
	      <label for="vehicleModel">🚘 Vehicle Model</label>
	      <input type="text" id="vehicleModel" name="vehicle_model" placeholder="e.g., Nissan X-Trail">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="plate">🔢 Number Plate</label>
	    <input type="text" id="plate" name="number_plate" placeholder="ABC-1234">
	    <small>Format: ABC-1234</small>
	  </div>
	
	  <h2>🛠️ Booking Service Information</h2>
	  <div class="form-group">
	    <label for="serviceType">🧰 Service Type</label>
	    <select id="serviceType" name="service_type">
	      <option value="">Select service type</option>
	      <option value="maintenance">Maintenance</option>
	      <option value="oil_change">Oil Change</option>
	      <option value="repair">Repair</option>
	      <option value="inspection">Inspection</option>
	    </select>
	  </div>
	  <div class="form-row">
	    <div class="form-group">
	      <label for="lastService">📅 Last Service Date</label>
	      <input type="date" id="lastService" name="last_service_date">
	    </div>
	    <div class="form-group">
	      <label for="serviceDate">📅 Service Date</label>
	      <input type="date" id="serviceDate" name="service_date">
	    </div>
	    <div class="form-group">
	      <label for="serviceTime">⏰ Service Time</label>
	      <input type="time" id="serviceTime" name="service_time">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="pickupDrop">🚗 Pickup & Drop Required?</label>
	    <select id="pickupDrop" name="pickup_drop">
	      <option value="">Select option</option>
	      <option value="yes">Yes</option>
	      <option value="no">No</option>
	    </select>
	  </div>
	  <div class="form-group">
	    <label for="issues">📝 Describe Issues (if any)</label>
	    <textarea id="issues" name="vehicle_issues" placeholder="Describe any issues with your vehicle..."></textarea>
	  </div>
	
	  <!-- ✅ Submit Button -->
	  <div class="submit-btn">
	    <button type="submit">Book Service</button>
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
