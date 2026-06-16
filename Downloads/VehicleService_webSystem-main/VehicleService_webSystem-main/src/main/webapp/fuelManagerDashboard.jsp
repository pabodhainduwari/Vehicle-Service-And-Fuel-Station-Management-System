<%-- <%@page import="jdk.internal.org.jline.terminal.TerminalBuilder.SystemOutput"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.fuelInventoryModel" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fuel Inventory</title>
    <link rel="stylesheet" href="css/fuelManagerDashboard.css">
    <link rel="stylesheet" href="css/header_footer.css">
<!-- fonts -->
    <link href='https://fonts.googleapis.com/css?family=EB Garamond'rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lato'rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Varela Round' rel='stylesheet'>
</head>
<div class="background"></div>
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
<main>
    <h2 style="text-align: center;">Fuel Inventory</h2>
<form method="post" class="form" id="inventoryTable" >
    <table>
        <thead>
            <tr>
            <th>Fuel Number</th>
            <th>Fuel Name</th>
            <th>Stock Amount</th>
            <th>Price per Unit /l</th>
            <th>Last Updated Date</th>
            <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%  ArrayList<fuelInventoryModel> fuelList = (ArrayList<fuelInventoryModel>) request.getAttribute("fuelList"); 
    	if (fuelList != null) {
    		int count = 1;
        	for (fuelInventoryModel fuel : fuelList) {
		%>
            <tr data-id="<%= count %>">
            <td><%= count %></td> 
            <td><%= fuel.getFuelName() %></td>
            <td><%= fuel.getStockAmount() %></td>
            <td><%= fuel.getPricePerUnit() %></td>
            <td><%= fuel.getLastUpdated() %></td>
            <td>
                <button id="updateButton" type="button" onclick="editRow(this)">Update</button>
                <button id="deleteButton" type="button" onclick="deleteRow(this)">Delete</button>
            </td>
            </tr>
		<%		 count++;
		        }
		    }
    	else{
    		System.out.println("fuel list is sill null");
    	}
		%>
        </tbody>
    </table>
    
</form>

	<button id="addNewFuelButton" onclick="toggleForm()">Add New</button>
    <form action="addNewFuelServlet" method="POST" onsubmit="return validateForm()" id="addNewFuelForm" class="addNewFuelForm">
        <div class="inputContent">
            <div class="fuelTypeCont">
                <div class="labelCont">
                    <label for="fuelName" >Fuel Type</label><br>
                </div> 
                <div class="inputContainer">
                    <input type="text" name="fuelName" id="fuelName"  /><br/>
                </div>
            </div>
            <div class="stockAmountCont">
                <div class="labelCont">
                    <label for="stockAmount">Stock Amount</label><br>
                    <span class="error" id="stockError">*Please enter only numbers</span>
                </div>
                <div class="inputContainer">                    
                    <input type="text" name="stockAmount" id="stockAmount" oninput="validateInput()" /><br/>
                </div>
                
            </div>
            <div class="unitPriceCont">
                <div class="labelCont">
                    <label for="pricePerUnit">Price Per Unit (/l)</label><br>
                    <span class="error" id="priceError">*Please enter only numbers</span>
                </div>
                <div class="inputContainer">
                    
                    <input type="text" name="pricePerUnit" id="pricePerUnit" oninput="validateInput()" /><br/>
                </div>
                
                
            </div>            
        </div>
        
        <div>
            <button type="submit" id="newFuelSave" >Save</button>
        </div> 
    </form>
  

<script src="js/fuelManagerDashboard.js"></script>
<script src="js/header.js"></script>
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
