<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Update Employee</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="css/customerDashboard.css">
  <link rel="stylesheet" href="css/header_footer.css">
  <script src="js/header.js"></script>
</head>
<body class="bg-black text-white font-sans">

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

<div class="max-w-3xl mx-auto mt-10 bg-gray-900 p-10 rounded-2xl shadow-xl border border-white">
  <h2 class="text-3xl font-bold text-white mb-8 border-b border-orange-400 pb-3">✏️ Edit Employee</h2>

  <form action="EmployeeUpdateServlet" method="post" class="grid grid-cols-1 md:grid-cols-2 gap-6 text-white">

    <input type="hidden" name="id" value="<%= request.getParameter("id") %>" />

    <div>
      <label class="block mb-1 font-semibold">Name</label>
      <input type="text" name="name" value="<%= request.getParameter("name") %>" required
             class="w-full px-4 py-2 rounded bg-white text-black border border-orange-400" />
    </div>

    <div>
      <label class="block mb-1 font-semibold">Email</label>
      <input type="email" name="email" value="<%= request.getParameter("email") %>" required
             class="w-full px-4 py-2 rounded bg-white text-black border border-orange-400" />
    </div>

    <div>
      <label class="block mb-1 font-semibold">NIC</label>
      <input type="text" name="nic" value="<%= request.getParameter("nic") %>" required
             class="w-full px-4 py-2 rounded bg-white text-black border border-orange-400" />
    </div>

    <div>
      <label class="block mb-1 font-semibold">Mobile</label>
      <input type="text" name="mobile" value="<%= request.getParameter("mobile") %>" required
             class="w-full px-4 py-2 rounded bg-white text-black border border-orange-400" />
    </div>
    
	<div>
      <label class="block mb-1 font-semibold">Address</label>
      <input type="text" name="address" value="<%= request.getParameter("address") %>" required
             class="w-full px-4 py-2 rounded bg-white text-black border border-orange-400" />
    </div>

    <div>
      <label class="block mb-1 font-semibold">Salary</label>
      <input type="text" name="salary" value="<%= request.getParameter("salary") %>" required
             class="w-full px-4 py-2 rounded bg-white text-black border border-orange-400" />
    </div>
    
    <div class="md:col-span-2">
      <label class="block mb-1 font-semibold">Employee Type</label>
      <input type="text" name="empType" value="<%= request.getParameter("empType") %>" required
             class="w-full px-4 py-2 rounded bg-white text-black border border-orange-400" />
    </div>

    <div class="md:col-span-2 mt-6 flex justify-between space-x-4">
      <button type="submit"
              class="flex-1 bg-white text-black font-bold py-3 rounded hover:bg-orange-600 hover:text-white">
        ✅ Save Changes
      </button>
      <a href="adminDashboard.jsp"
         class="flex-1 text-center bg-gray-700 text-white font-bold py-3 rounded hover:bg-white hover:text-black">
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
