<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	    background-image: url("../asset/login_page_background.jpg");
	    background-repeat: no-repeat;
		background-size: cover;
		background-position: center;
		background-attachment: fixed;
		width: 100%;
		margin: 0;
	  }
	  
	  .form-group label,
		label {
    		color: #ffffff;
		}
	  
    .form-container {
    	max-width: 800px;
      margin: auto;
      background: #1c2e40;
      padding: 30px;
      border-radius: 10px;
      width: 700px;
      box-shadow: 0 0 10px rgba(0,0,0,0.6);
      margin-top:50px;
      margin-bottom:20px;
    }

    h2 {
      color: #00bfff;
      border-bottom: 1px solid #00bfff;
      padding-bottom: 5px;
      margin-top: 30px;
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
      background-color: #2f3e4d;
      color: #fff;
    }

    .form-group input::placeholder,
    .form-group textarea::placeholder {
      color: #ccc;
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
      background-color: #00bfff;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .submit-btn button:hover {
      background-color: #008ecc;
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
  <h2>Service Booking Details</h2>
	<form>
	
	  <c:forEach var="service" items="${sDetails}">
    
	    <c:set var="id" value="${service.bookingId }"/>
	    <c:set var="customer" value="${service.cusID }"/>
	    <c:set var="name" value="${service.name }"/>
	    <c:set var="phonenum" value="${service.phone }"/>
	    <c:set var="mail" value="${service.email }"/>
	    <c:set var="type" value="${service.vType }"/>
	    <c:set var="model" value="${service.v_Model }"/>
	    <c:set var="numPlate" value="${service.numberPlate }"/>
	    <c:set var="sType" value="${service.sType }"/>
	    <c:set var="lDate" value="${service.lastService }"/>
	    <c:set var="date" value="${service.sDate }"/>
	    <c:set var="time" value="${service.sTime }"/>
	    <c:set var="answer" value="${service.answer}"/>
	    <c:set var="issues" value="${service.issues }"/>
	
	  <label>Booking ID:</label>
	  <input type="text" id="id" name="bookingID" value="${service.bookingId}" readonly>
	  
	  <label>Customer ID:</label>
	  <input type="text" id="id" name="customerID" value="${service.cusID}" readonly>
	  
	  <h2>📋 Customer Information</h2>
	  <div class="form-row">
	    <div class="form-group">
	      <label>👤 Full Name</label>
	      <input type="text" id="fullName" name="full_name" value="${service.name}" readonly>
	    </div>
	    <div class="form-group">
	      <label>📞 Phone Number</label>
	      <input type="tel" id="phone" name="phone_number" value="${service.phone}" readonly>
	    </div>
	  </div>
	  <div class="form-group">
	    <label>📧 Email Address</label>
	    <input type="email" id="email" name="email_address" value="${service.email}" readonly>
	  </div>
	
	  <h2>🚗 Vehicle Information</h2>
	  <div class="form-row">
	    <div class="form-group">
	      <label>🚙 Vehicle Type</label>
	      <input type="text" id="vehicleType" name="vehicle_type" value="${service.vType}" readonly>
	    </div>
	    <div class="form-group">
	      <label>🚘 Vehicle Model</label>
	      <input type="text" id="vehicleModel" name="vehicle_model" value="${service.v_Model}" readonly >
	    </div>
	  </div>
	  <div class="form-group">
	    <label>🔢 Number Plate</label>
	    <input type="text" id="plate" name="number_plate" value="${service.numberPlate}" readonly >
	    <small>Format: ABC-1234</small>
	  </div>
	
	  <h2>🛠️ Booking Service Information</h2>
	  <div class="form-group">
	    <label>🧰 Service Type</label>
	    <input type="text" id="serviceType" name="service_type" value="${service.sType}" readonly>
	  </div>
	  <div class="form-row">
	    <div class="form-group">
	      <label>📅 Last Service Date</label>
	      <input type="date" id="lastService" name="last_service_date" value="${service.lastService}" readonly>
	    </div>
	    <div class="form-group">
	      <label>📅 Service Date</label>
	      <input type="date" id="serviceDate" name="service_date" value="${service.sDate}" readonly>
	    </div>
	    <div class="form-group">
	      <label>⏰ Service Time</label>
	      <input type="time" id="serviceTime" name="service_time" value="${service.sTime}" readonly>
	    </div>
	  </div>
	  <div class="form-group">
	    <label>🚗 Pickup & Drop Required?</label>
	    <input type="text" id="pickupDrop" name="pickup_drop" value="${service.answer}"readonly>
	  </div>
	  <div class="form-group">
	    <label>📝 Describe Issues (if any)</label>
	    <textarea id="issues" name="vehicle_issues" readonly>${service.issues }</textarea>
	  </div>
	  
	  </c:forEach>
	  
	  
	  <div class="submit-btn">
	  <c:url value="updateBookingService.jsp" var="sUpdate">
   		<c:param name="id" value="${id}"/>
   		<c:param name="cusID" value="${customer}"/>
   		<c:param name="uName" value="${name}"/>
   		<c:param name="contact" value="${phonenum}"/>
   		<c:param name="email" value="${mail}"/>
   		<c:param name="vType" value="${type }"/>
   		<c:param name="vModel" value="${model }"/>
   		<c:param name="chassis" value="${numPlate}"/>
   		<c:param name="sType" value="${sType}"/>
   		<c:param name="lastService" value="${lDate}"/>
   		<c:param name="sDate" value="${date}"/>
   		<c:param name="sTime" value="${time}"/>
   		<c:param name="pickupDrop" value="${answer}"/>
   		<c:param name="issue" value="${issues}"/>
   		
   	  </c:url>
   	  <a href="${sUpdate}" style="text-decoration: none;">
		  <button type="button">Update Service</button>
	  </a>

	  </div>
	
	  <div class="submit-btn">
	  <c:url value="deleteServiceBookingServlet?bookingID=${id}" var="sDelete">  		
   	  </c:url> 
   	  <a href="${sDelete}" style="text-decoration: none;">
		  <button type="button">Delete Service</button>
	  </a>

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
