<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Update Admin Profile - Online Fuel Management System</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-black text-white font-sans">

<!-- Header -->
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

<!-- Update Form -->
<div class="max-w-3xl mx-auto mt-10 bg-gray-900 p-10 rounded-2xl shadow-xl border border-white">
  <h2 class="text-3xl font-bold text-white mb-8 border-b border-orange-400 pb-3">✏️ Edit Profile</h2>

  <form action="UpdateAdminServlet" method="post" class="grid grid-cols-1 md:grid-cols-2 gap-6 text-white">
    
    <input type="hidden" name="id" value="${admin.id}" />

    <div>
      <label class="block mb-1 font-semibold">Name</label>
      <input type="text" name="name" value="${admin.name}" required
             class="w-full px-4 py-2 rounded bg-white text-black border border-orange-400 focus:outline-none focus:ring-2 focus:ring-orange-600" />
    </div>

    <div>
      <label class="block mb-1 font-semibold">Email</label>
      <input type="email" name="email" value="${admin.email}" required
             class="w-full px-4 py-2 rounded bg-white text-black border border-orange-400 focus:outline-none focus:ring-2 focus:ring-orange-600" />
    </div>

    <div>
      <label class="block mb-1 font-semibold">NIC</label>
      <input type="text" name="nic" value="${admin.nic}" required
             class="w-full px-4 py-2 rounded bg-white text-black border border-orange-400 focus:outline-none focus:ring-2 focus:ring-orange-600" />
    </div>

    <div>
      <label class="block mb-1 font-semibold">Phone</label>
      <input type="text" name="phone" value="${admin.phone}" required
             class="w-full px-4 py-2 rounded bg-white text-black border border-orange-400 focus:outline-none focus:ring-2 focus:ring-orange-600" />
    </div>

    <div class="md:col-span-2">
      <label class="block mb-1 font-semibold">Password</label>
      <input type="password" name="password" value="${admin.password}" required
             class="w-full px-4 py-2 rounded bg-white text-black border border-orange-400 focus:outline-none focus:ring-2 focus:ring-orange-600" />
    </div>

    <!-- Buttons -->
    <div class="md:col-span-2 mt-6 flex justify-between space-x-4">
      <button type="submit"
              class="flex-1 bg-white text-black font-bold py-3 rounded hover:bg-orange-600 hover:text-white transition duration-200">
        ✅ Save Changes
      </button>
      <a href="adminDashboard.jsp"
         class="flex-1 text-center bg-gray-700 text-white font-bold py-3 rounded hover:bg-white hover:text-black transition duration-200">
        ❌ Cancel
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
