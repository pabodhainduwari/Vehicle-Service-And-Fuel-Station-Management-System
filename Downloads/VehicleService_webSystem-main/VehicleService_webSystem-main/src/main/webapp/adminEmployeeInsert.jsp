<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Add Employee - Admin Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="css/customerDashboard.css">
  <link rel="stylesheet" href="css/header_footer.css">
  <script src="js/header.js"></script>
</head>
<body class="bg-black text-white font-sans min-h-screen">

<!-- Top Navbar -->
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

<!-- Layout -->
<div class="flex min-h-screen">

  

  <!-- Main Content -->
  <main class="flex-1 p-10 bg-black">

    <!-- Form Card -->
    <div class="bg-gray-900 p-10 rounded-lg shadow-lg w-full max-w-xl mx-auto border border-orange-600">
      <h2 class="text-2xl font-bold text-orange-400 mb-6 text-center">Add New Employee</h2>
      <form action="EmployeeInsertServlet" method="post" class="space-y-4">

        <input type="text" name="name" placeholder="Full Name" required class="w-full px-4 py-2 rounded bg-white text-black" />
        
		<input type="text" name="empType" placeholder="Employee Type" required class="w-full px-4 py-2 rounded bg-white text-black" />	
		
        <input type="text" name="nic" placeholder="NIC" required class="w-full px-4 py-2 rounded bg-white text-black" />

        <input type="text" name="mobile" placeholder="Mobile" required class="w-full px-4 py-2 rounded bg-white text-black" />

        <input type="email" name="email" placeholder="Email" required class="w-full px-4 py-2 rounded bg-white text-black" />
        
		<input type="text" name="address" placeholder="Address" required class="w-full px-4 py-2 rounded bg-white text-black" />
		
		<input type="text" name="salary" placeholder="Salary" required class="w-full px-4 py-2 rounded bg-white text-black" />
		
        

        <div class="flex justify-between">
          <button type="submit" class="bg-orange-600 hover:bg-orange-700 text-white px-4 py-2 rounded">Add</button>
          <a href="adminDashboardServlet" class="bg-white text-black hover:bg-orange-200 px-4 py-2 rounded">Cancel</a>
        </div>

      </form>
    </div>

  </main>
</div>

<!-- Logout Confirmation -->
<script>
  function confirmLogout() {
    return confirm("Are you sure you want to log out?");
  }
</script>
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
