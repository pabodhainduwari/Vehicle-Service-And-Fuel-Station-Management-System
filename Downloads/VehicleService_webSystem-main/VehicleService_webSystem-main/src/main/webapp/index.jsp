<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header_footer.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fuelManagerDashboard.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Spectral|Rubik">
<link href='https://fonts.googleapis.com/css?family=EB Garamond'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Lato'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Varela Round' rel='stylesheet'>

<script src="js/header.js"></script>
<title>Vehicle Service</title>
<style>
body{
	font-size:29px;
	font-family:Arial, sans-serif;
	background-color:#ffffff;
	margin:0;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
	
}
main{
    width: 80%;
    background-color: #2b2b2b;
    min-height: 100vh;
}
@media (max-width: 1200px) {
    main{
    width: 100%;
}
}

.service-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}
.service-card{
	background-color: #fff;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
    padding: 20px;
    margin: 20px auto;
    width: 500px;
    display: flex;
    flex-direction: column;
    align-items: center;
    transition: transform 0.3s ease;
    font-size:22px;
    font-family: Spectral, serif;
}
@media (max-width:1400px) {
    .service-card{
        width: 400px;
    }
    
}
@media(max-width:1200px){
        .service-card{
        width: 300px;
    }
    }
.service-card:hover{
	transform:scale(1.02);
}
.service-image {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 10px;
    margin-right: 20px;
    border-bottom: 1px solid #ddd;
}
.service-card-details{
    width: 100%;
    padding: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.service-card h3 {
    margin: 0;
    color: #2c3e50;
}

.service-card p {
    margin: 5px 0;
    font-size: 15px;
    color: #555;
    font-family: Rubik, sans-serif;
}
.book-btn {
    text-align: center;
    padding: 5px;
    background-color:#ff5c33;
    color: white;
    text-decoration: none;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    max-width: 25px;
    min-width: 20px;
    transition: background-color 0.3s ease;
}
.book-btn:hover {
    background-color: #ff5c33;
}
.headTagline{
	color:rgb(255, 255, 255);
	text-align:center;
    font-family: "Lucida Handwriting", cursive;
}
.subTagline{
    color:rgb(255, 255, 255);
	text-align:center;
    font-size: 40px;
    
}
.discountLine{
	text-align: center;
    font-size: 35px;
    font-family: 'Times New Roman', Times, serif;
    font-weight: bold;
    color: white;
    white-space: nowrap;
    
}
.discount{
    font-size: 40px;
    color: #ffa52e;
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
<main >
    <h2 class="headTagline" >Everything Your Vehicle Needs, All in One Place</h2>
        <p class="subTagline" >Our Services</p>
        
        
        <div class="service-container">

                <c:forEach var="service" items="${allServices}">
                    <div class="service-card">
                        <img class="service-image" 
                            src="${pageContext.request.contextPath}/asset/services/${fn:toLowerCase(fn:replace(service.serviceName, ' ', '_'))}.jpg" />
                        <div class="service-card-details">
                            <div>
                                <h3>${service.serviceName}</h3>
                                <p><strong>Type:</strong> ${service.serviceType}</p>
                                <p>${service.description}</p>
                                <p><strong>Price:</strong> LKR ${service.price}</p>
                            </div>
                            
                            <div>
                                <a href="BookingForm.jsp?serviceName=${service.serviceName}" class="book-btn">Book Now</a>
                            </div>
                        </div>			    
                            
                    </div>
                </c:forEach>
        </div>
        <div class="fuel_container" id="fuel_container">
        <p class="subTagline" >Fuel Prices</p>
        
			<c:if test="${not empty user2}">
			    <div><p class="discountLine" id="discountLine"> 
			        Congratulations!!! As a <span class="userType">${user2.userType}</span>, 
			        you will get <span class="discount">${user2.discount}%</span> discount.
			    </p></div>
			</c:if>
            <div class="fuelDetailsTable">
                
                <table style="width: 80%; margin-bottom: 50px;" >
			        <thead>
			            <tr>
				            <th>Fuel Number</th>
				            <th>Fuel Name</th>
				            <th>Price per Unit /l</th>
				            <th>Last Updated Date</th>
				            
			            </tr>
			        </thead>
			        
			        <tbody>
			        <c:forEach var="fuelDetails" items="${allFuelDetails}">				        
				    
				            <tr>
				            <td>${fuelDetails.fuelNumber}</td> 
				            <td>${fuelDetails.fuelName}</td>
				            <td>${fuelDetails.pricePerUnit}</td>
				            <td>${fuelDetails.lastUpdated}</td>
				            </tr>
						
			        </c:forEach>
			        
			        </tbody>
    			</table>
            </div>
            
        </div>
        
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