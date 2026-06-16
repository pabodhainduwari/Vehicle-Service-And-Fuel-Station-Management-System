<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="model.userModel" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Customer Profile</title>
  <link rel="Stylesheet" href="css/header_footer.css">
  <script src="js/header.js"></script>
  <style>
    body {
      margin: 0;
      padding: 40px;
      font-family: 'Segoe UI', sans-serif;
      background-image: url("https://4kwallpapers.com/images/wallpapers/windows-11-dark-mode-abstract-background-black-background-3840x2400-8710.jpg");
    }

    .container {
      display: flex;
      max-width: 900px;
      margin: auto;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      overflow: hidden;
      margin-top:100px;
      margin-bottom:20px;
    }

    .sidebar {
      width: 280px;
      background-color: #007bff;
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 40px 20px;
    }

    .sidebar img {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 20px;
      border: 3px solid #fff;
    }

    .sidebar h2 {
      margin: 10px 0 5px;
      font-size: 20px;
    }

    .sidebar p {
      font-size: 14px;
      color: #d4e6ff;
    }

    .profile-details {
      flex-grow: 1;
      padding: 40px;
    }

    .detail-row {
      display: flex;
      margin-bottom: 20px;
    }

    .detail-label {
      width: 150px;
      font-weight: bold;
      color: #333;
    }

    .detail-value {
      color: #555;
    }

    .edit-button {
      margin-top: 30px;
      padding: 10px 20px;
      background: #007bff;
      color: #fff;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }

    .edit-button:hover {
      background: #0056b3;
    }

    @media (max-width: 768px) {
      .container {
        flex-direction: column;
      }

      .sidebar {
        width: 100%;
        flex-direction: row;
        justify-content: center;
        gap: 20px;
      }

      .profile-details {
        padding: 20px;
      }

      .detail-row {
        flex-direction: column;
      }

      .detail-label {
        width: auto;
      }
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
<hr>
<div class="container">
	<div class="sidebar">
	  <img src="https://cdn-icons-png.freepik.com/256/3135/3135823.png" alt="Profile Image">
	  <div>
	    <h2>${userDetails.name}</h2>
	    <p>${userDetails.royaltyType}</p>
	  </div>
	</div>
	
	<div class="profile-details">
	  <div class="detail-row">
	    <div class="detail-label">User ID:</div>
	    <div class="detail-value">${userDetails.userID}</div>
	  </div>
	  <div class="detail-row">
	    <div class="detail-label">Email:</div>
	    <div class="detail-value">${userDetails.email}</div>
	  </div>
	  <div class="detail-row">
	    <div class="detail-label">UserName:</div>
	    <div class="detail-value">${userDetails.userName}</div>
	  </div>
	  <div class="detail-row">
	    <div class="detail-label">Password:</div>
	    <div class="detail-value">${userDetails.password}</div>
	  </div>
	
	  <form action="EditUserServlet" method="get">
	    <input type="hidden" name="userID" value="${userDetails.userID}">
	    <button type="submit" class="edit-button">Edit Profile</button>
	  </form>
	</div>

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
