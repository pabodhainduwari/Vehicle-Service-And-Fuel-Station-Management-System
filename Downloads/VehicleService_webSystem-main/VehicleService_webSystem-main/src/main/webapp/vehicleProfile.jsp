<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Profile</title>
    <link rel="Stylesheet" href="css/header_footer.css">
    <link rel="Stylesheet" href="css/Vehicle.css">
    
  	<script src="js/header.js"></script>
    <style>
    
    	body {
      margin: 0;
      padding: 40px;
      font-family: 'Segoe UI', sans-serif;
      background-image: url("https://4kwallpapers.com/images/wallpapers/windows-11-dark-mode-abstract-background-black-background-3840x2400-8710.jpg");
    }
    	
    	h2{
    		text-align:center
    	}
        .profile-form {
    max-width: 800px;
    margin: 30px auto;
    padding: 25px 30px;
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.1);
    font-family: Arial, sans-serif;
}

.topic {
    font-size: 36px;
    color: #222222;
    text-align: center;
    margin-bottom: 25px;
}

.vehicle-info-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 15px 40px;
}

.vehicle-info-grid div {
    display: flex;
    flex-direction: column;
}

.vehicle-info-grid label {
    font-weight: bold;
    font-size: 14px;
    color: #555555;
    margin-bottom: 5px;
}

.vehicle-info-grid p {
    margin: 0;
    padding: 10px 12px;
    background-color: #f7f7f7;
    border-radius: 6px;
    border: 1px solid #ddd;
    font-size: 14px;
    color: #333333;
}

.form-buttons {
    display: flex;
    justify-content: center;
    margin-top: 25px;
    gap: 20px;
}

.form-buttons input[type="button"] {
    background-color: #ffd600;
    color: #222;
    font-weight: bold;
    padding: 12px 25px;
    border-radius: 6px;
    border: none;
    cursor: pointer;
    font-size: 15px;
    transition: background 0.3s, transform 0.2s;
}

.form-buttons input[type="button"]:hover {
    background-color: #e6c200;
    transform: scale(1.05);
}

@media screen and (max-width: 700px) {
    .vehicle-info-grid {
        grid-template-columns: 1fr;
    }
}
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin: 6px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #e9e9e9;
        }
        input[readonly] {
            background-color: #f0f0f0;
        }
        input[type="button"] {
	      margin-top: 20px;
	      background-color: #ffe600;
	      color: rgb(0, 0, 0);
	      padding: 10px;
	      border: none;
	      font-size: 16px;
	      border-radius: 6px;
	      cursor: pointer;
	      width: 200px;
	      margin-right:30px;
	      margin-left:15px;
          transition: 0.3s;
	    }

	    input[type="button"]:hover {
	      background-color: #bd8b00;
	    }
	    a {
		  text-decoration: none;
		}

	    .topic{
            color: black;
            font-size: 50px;
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
<hr>
<div class="profile-form">
    <h2 class="topic">Vehicle Profile</h2>
    <form>
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

            <div class="vehicle-info-grid">
                <div>
                    <label>Vehicle ID:</label>
                    <p>${vehicle.id}</p>
                </div>
                <div>
                    <label>Owner's Name:</label>
                    <p>${vehicle.owner}</p>
                </div>
                <div>
                    <label>Vehicle Type:</label>
                    <p>${vehicle.vType}</p>
                </div>
                <div>
                    <label>Registration Number:</label>
                    <p>${vehicle.reg_Num}</p>
                </div>
                <div>
                    <label>Chassis Number:</label>
                    <p>${vehicle.chassis}</p>
                </div>
                <div>
                    <label>Engine Number:</label>
                    <p>${vehicle.engine}</p>
                </div>
                <div>
                    <label>Fuel Type:</label>
                    <p>${vehicle.fuel}</p>
                </div>
                <div>
                    <label>Manufacturing Year:</label>
                    <p>${vehicle.year}</p>
                </div>
                <div>
                    <label>Vehicle Make:</label>
                    <p>${vehicle.vMake}</p>
                </div>
                <div>
                    <label>Vehicle Model:</label>
                    <p>${vehicle.vModel}</p>
                </div>
                <div>
                    <label>Customer ID:</label>
                    <p>${vehicle.cusID}</p>
                </div>
            </div>
        </c:forEach>

        <div class="form-buttons">
            <c:url value="UpdateVehicleProfile.jsp" var="vUpdate">
                <c:param name="id" value="${id}"/>
                <c:param name="owner" value="${name}"/>
                <c:param name="vType" value="${type}"/>
                <c:param name="regNum" value="${rNum}"/>
                <c:param name="chassis" value="${cNum}"/>
                <c:param name="engine" value="${eNum}"/>
                <c:param name="fuel" value="${fType}"/>
                <c:param name="year" value="${mYear}"/>
                <c:param name="vMake" value="${make}"/>
                <c:param name="vModel" value="${model}"/>
                <c:param name="cusID" value="${customer}"/>
            </c:url>
            <c:url value="DeleteVehicle.jsp" var="vDelete">
                <c:param name="id" value="${id}"/>
            </c:url>

            <a href="${vUpdate}">
                <input type="button" value="Update Data">
            </a>
            <c:url value="DeleteVehicle.jsp" var="vDelete">
   		
   </c:url>
   <a href="deleteVehicleProfileServlet?vid=${id}">
   
   <input type="button" id="delete" name="delete" value="Delete Data">
   
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