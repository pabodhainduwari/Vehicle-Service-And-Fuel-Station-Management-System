<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Manage Sellers - Admin | Online Fuel Management System</title>
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
<!-- Layout -->
<div class="flex min-h-screen">

  <!-- Sidebar -->
  

  <!-- Main Content -->
  <main class="flex-1 p-10 bg-black space-y-10">

    <!-- Page Title & Add Button -->
    <div class="flex justify-between items-center">
      <h2 class="text-2xl font-bold text-white">🧾 All Employees</h2>
      <a href="adminEmployeeInsert.jsp" class="bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded text-sm transition duration-200">+ Add Employees</a>
    </div>

    <!-- Sellers Table -->
    <div class="overflow-x-auto rounded-lg shadow-lg border border-orange-500">
      <table class="min-w-full bg-white text-black text-sm">
        <thead>
          <tr class="bg-orange-500 text-white text-left">
            <th class="px-4 py-2">ID</th>
            <th class="px-4 py-2">Name</th>
            <th class="px-4 py-2">NIC</th>	
            <th class="px-4 py-2">Mobile</th>
            <th class="px-4 py-2">Email</th>
            <th class="px-4 py-2">Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="em" items="${em}">
            <tr class="border-b hover:bg-orange-50">
              <td class="px-4 py-2">${em.id}</td>
              <td class="px-4 py-2">${em.name}</td>
              <td class="px-4 py-2">${em.nic}</td>
              <td class="px-4 py-2">${em.mobile}</td>
              <td class="px-4 py-2">${em.email}</td>
              <td class="px-4 py-2">
                <div class="flex space-x-2">
                  <!-- Edit Button -->
                  <a href="adminEmployeeUpdate.jsp?id=${em.id}&name=${em.name}&nic=${em.nic}&mobile=${em.mobile}&email=${em.email}&password=${em.password}"
                     class="bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-700 text-xs">
                    ✏️ Edit
                  </a>
                  <!-- Delete Button -->
                  <a href="EmployeeDeleteServlet?id=${em.id}" 
				   onclick="return confirm('Are you sure you want to delete your account? This action cannot be undone.');"
				   class="bg-red-600 text-white px-3 py-1 rounded hover:bg-red-700 text-xs">
				   🗑️ Delete
				</a>
		                
                </div>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

  </main>
</div>

<!-- Footer -->
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
<!-- JS -->
<script>
  function confirmLogout() {
    return confirm("Are you sure you want to log out?");
  }
</script>

</body>
</html>
