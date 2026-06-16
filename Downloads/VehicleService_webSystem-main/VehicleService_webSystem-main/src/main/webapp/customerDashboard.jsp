<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Vehicle Profile Dashboard</title>
  <link rel="stylesheet" href="css/customerDashboard.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Spectral|Rubik">
  <link rel="stylesheet" href="css/header_footer.css">
  <script src="js/header.js"></script>
	<style> 	
    	.title{
          font-size: 30px;
          color: white;
          margin-bottom: 40px;
          text-align: center;
          font-family:'Times New Roman', Times, serif;
      }
    	h2{
    		text-align:center
    	}
        /* Core layout */
body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(to right, #1f1f1f, #616161);
    color: #333;
}

/* Background blur */
body::before {
    content: "";
    position: fixed;
    top: 0;
    left: 0;
    width: 110%;
    height: 110%;
    
    background-size: cover;
    background-position: center;
    filter: blur(10px);
    z-index: -1;
}

/* Main form container */
.profile-form {
    background-color: rgba(255, 255, 255, 0.9);
    max-width: 850px;
    margin: 80px auto;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
}

/* Section title */
.topic {
    font-size: 36px;
    font-weight: bold;
    color: #1e3c72;
    text-align: center;
    margin-bottom: 30px;
}

/* Heading */
h2 {
    text-align: center;
    color: #444;
    font-size: 30px;
    margin-bottom: 20px;
}

/* Labels */
label {
    font-weight: bold;
    margin-top: 15px;
    display: block;
    color: #222;
}

/* Paragraphs as value display */
form p {
    background-color: #f1f1f1;
    padding: 10px;
    border-radius: 6px;
    margin-top: 5px;
    font-size: 15px;
    color: #444;
}

/* Buttons */
input[type="button"],
.btn {
    display: inline-block;
    margin-top: 20px;
    background-color: #ffd700;
    color: #000;
    padding: 12px 25px;
    border: none;
    font-size: 16px;
    font-weight: bold;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    margin-right: 15px;
}

input[type="button"]:hover,
.btn:hover {
    background-color: #e6be00;
}

/* Remove underline from link buttons */
a {
    text-decoration: none;
}

/* Hidden form */
#vehicleProfileForm {
    display: none;
    flex-direction: column;
}

/* Responsive */
@media screen and (max-width: 768px) {
    .profile-form {
        padding: 25px;
    }

    input[type="button"] {
        width: 100%;
        margin-right: 0;
        margin-left: 0;
    }
    
}
	.sidebar h2 {
	  margin-bottom: 40px;
	  font-size: 25px;
		font-family: Rubik, sans-serif;
	  border-bottom: 1px solid #000000;
	  padding-bottom: 20px;
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

<div class="container">
  <aside class="sidebar">
    <h2 style="color: white; font-size: 40px; font-family: Spectral, serif;">Welcome,<br ><p style="color: white; font-size: 30px;"><%= session.getAttribute("name") %>!</p></h2>
    
    <div class="menu">
      <a href="userDetailsServlet" class="menu-link">👤 User Profile</a>
      <a href="CheckVehicleServlet" class="menu-link">🚗 Vehicle Profile</a>
      <a href="cusBookingRecordServlet" class="menu-link">📋 Vehicle Service Booking Records</a>
  	  <img src="https://static.vecteezy.com/system/resources/thumbnails/013/923/543/small/blue-car-logo-png.png"  alt="vehicle">
    </div>
  </aside>

  <main class="main">
    <div class="title"><h1>Vehicle Service & Fuel Center</h1></div>

    <section class="cards">
      <div class="card">
        <a href="BookingForm.jsp">
          <img src="https://media.istockphoto.com/id/1407846366/photo/car-care-maintenance-and-servicing-close-up-hand-technician-auto-mechanic-using-the-wrench-to.jpg?s=612x612&w=0&k=20&c=yuSKGJfjI8CztFPuoXPs2PyfBezIROPz3iAenls6ly4=" alt="Service Booking">
        <h3>Service Booking</h3>
        <p>Manage your upcoming service bookings efficiently.</p>
      </a>
        
      </div>

      <div class="card">
        <a href="indexServlet#fuel_container">
          <img src="https://adaderanaenglish.s3.amazonaws.com/1706716737-fuel-6.jpg" alt="Fuel Service">
          <h3>Fuel Prices</h3>
          <p>Stay updated with the latest fuel rates</p>
        </a>
      </div>
    </section>
    
    <script>
		  document.addEventListener("DOMContentLoaded", function () {
		    <% Boolean hasVehicleProfile = (Boolean) request.getAttribute("hasVehicleProfile"); %>
		    <% if (Boolean.TRUE.equals(hasVehicleProfile)) { %>
		        document.getElementById("noVehicleProfile").style.display = 'none';
		        document.getElementById("vehicleProfileForm").style.display = 'flex';
		        document.getElementById("createProfileBtn").style.display = 'none';
		        
		    <% } %>
		  });
	</script>
    <div class="profile-form">
    <h2 class="topic" id="topic">Vehicle Profile</h2>
    <span id="noVehicleProfile">No Vehicle Profile</span>
    <a class="btn" href="CheckVehicleServlet" id="createProfileBtn">Create Profile</a>
    
    <form id="vehicleProfileForm">
    
    <c:forEach var="vehicle" items="${vehicleDetails}">
    
    <c:set var="id" value="${vehicle.id}"/>
    <c:set var="name" value="${vehicle.owner}"/>
    <c:set var="type" value="${vehicle.vType}"/>
    <c:set var="rNum" value="${vehicle.reg_Num}"/>
    <c:set var="cNum" value="${vehicle.chassis}"/>
    <c:set var="eNum" value="${vehicle.engine }"/>
    <c:set var="fType" value="${vehicle.fuel }"/>
    <c:set var="mYear" value="${vehicle.year }"/>
    <c:set var="make" value="${vehicle.vMake }"/>
    <c:set var="model" value="${vehicle.vModel}"/>
     <c:set var="customer" value="${vehicle.cusID}"/>
        
        <label>Vehicle ID:</label>
        <p>${vehicle.id }</p>
        
        <label>Owner's Name:</label>
        <p>${vehicle.owner }</p>

        <label>Vehicle Type:</label>
        <p>${vehicle.vType }</p>

        <label>Registration Number:</label>
        <p>${vehicle.reg_Num }</p>

        <label>Chassis Number:</label>
        <p>${vehicle.chassis }</p>

        <label>Engine Number:</label>
        <p>${vehicle.engine }</p>

        <label>Fuel Type:</label>
        <p>${vehicle.fuel }</p>

        <label>Manufacturing Year:</label>
        <p>${vehicle.year }</p>

        <label>Vehicle Make:</label>
        <p>${vehicle.vMake }</p>

        <label>Vehicle Model:</label>
        <p>${vehicle.vModel}</p>
        
        <label>Customer ID:</label>
        <p>${vehicle.cusID }</p>
   </c:forEach> 
   
   <c:url value="UpdateVehicleProfile.jsp" var="vUpdate">
   		<c:param name="id" value="${id}"/>
   		<c:param name="owner" value="${name}"/>
   		<c:param name="vType" value="${type}"/>
   		<c:param name="regNum" value="${rNum }"/>
   		<c:param name="chassis" value="${cNum}"/>
   		<c:param name="engine" value="${eNum }"/>
   		<c:param name="fuel" value="${fType }"/>
   		<c:param name="year" value="${mYear }"/>
   		<c:param name="vMake" value="${make}"/>
   		<c:param name="vModel" value="${model}"/>
   		<c:param name="cusID" value="${customer}"/>
   </c:url>
   
   <a href="${vUpdate}">
   <input type="button" id="update" name="update" value="Update Data">
   </a>
   
   <c:url value="DeleteVehicle.jsp" var="vDelete">
   		
   </c:url>
   <a href="deleteVehicleProfileServlet?vid=${id}">
   
   <input type="button" id="delete" name="delete" value="Delete Data">
   
   </a>
   </form>
   
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
