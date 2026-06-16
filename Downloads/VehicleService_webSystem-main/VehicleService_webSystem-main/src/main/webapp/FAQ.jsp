<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>MechFuel - FAQ</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header_footer.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Spectral|Rubik">
<link href='https://fonts.googleapis.com/css?family=EB Garamond'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Lato'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Varela Round' rel='stylesheet'>

<script src="js/header.js"></script>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #121212;
      color: #f1f1f1;
    }

    .faq-container {
      max-width: 900px;
      margin: 40px auto;
      padding: 20px;
    }

    h1 {
      text-align: center;
      color: #FFA500;
      margin-bottom: 40px;
    }

    .faq-item {
      background: #1f1f1f;
      border: 1px solid #333;
      border-radius: 12px;
      margin-bottom: 20px;
      overflow: hidden;
      box-shadow: 0 4px 12px rgba(255, 165, 0, 0.1);
    }

    .faq-question {
      cursor: pointer;
      padding: 20px;
      font-size: 1.2em;
      background: #1f1f1f;
      color: #FFA500;
      position: relative;
    }

    .faq-question::after {
      content: '+';
      position: absolute;
      right: 20px;
      font-size: 1.4em;
      color: #FFA500;
      transition: transform 0.3s ease;
    }

    .faq-item.active .faq-question::after {
      content: '-';
      transform: rotate(180deg);
    }

    .faq-answer {
      max-height: 0;
      overflow: hidden;
      transition: max-height 0.4s ease;
      background: #2b2b2b;
      padding: 0 20px;
      color: #ccc;
    }

    .faq-item.active .faq-answer {
      padding: 20px;
      max-height: 300px;
    }

    .faq-image {
      display: block;
      max-width: 100%;
      margin: 20px auto;
      border-radius: 8px;
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
  <div class="faq-container">
    <h1>MechFuel - Frequently Asked Questions</h1>

    <div class="faq-item">
      <div class="faq-question">What services do you offer at MechFuel?</div>
      <div class="faq-answer">
        We provide vehicle servicing, oil changes, engine diagnostics, tire replacement, and fuel refilling. <br>
        
      </div>
    </div>

    <div class="faq-item">
      <div class="faq-question">What are your operating hours?</div>
      <div class="faq-answer">
        We are open 7 days a week from 7:00 AM to 10:00 PM, including most public holidays.
        <br>
        
      </div>
    </div>

    <div class="faq-item">
      <div class="faq-question">Do you offer emergency services?</div>
      <div class="faq-answer">
        Yes, MechFuel offers 24/7 roadside assistance for engine breakdowns, tire bursts, and emergency fueling.
        <br>
        
      </div>
    </div>

    <div class="faq-item">
      <div class="faq-question">Can I book a service online?</div>
      <div class="faq-answer">
        Yes, we support online service booking through our website. No login required—just a few clicks and you're set!
        <br>
        
      </div>
    </div>

    <div class="faq-item">
      <div class="faq-question">Do you accept card and digital payments?</div>
      <div class="faq-answer">
        Absolutely! We accept credit/debit cards, UPI, and mobile wallet payments at both service and fuel stations.
        <br>
        
      </div>
    </div>

  </div>

  <script>
    const faqs = document.querySelectorAll('.faq-item');

    faqs.forEach(item => {
      item.querySelector('.faq-question').addEventListener('click', () => {
        item.classList.toggle('active');

        faqs.forEach(other => {
          if (other !== item) other.classList.remove('active');
        });
      });
    });
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
