<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>About & Contact - MechFuel</title>
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
      background-color: #111;
      color: #eee;
    }

    .section {
      padding: 80px 20px;
      text-align: center;
    }

    .about-section {
      background: url('asset/about_bg.jpg') no-repeat center center/cover;
      color: #fff;
      position: relative;
    }

    .about-section::before {
      content: "";
      position: absolute;
      top: 0; left: 0; right: 0; bottom: 0;
      background-color: rgba(0, 0, 0, 0.6);
    }

    .about-content {
      position: relative;
      max-width: 900px;
      margin: 0 auto;
      z-index: 1;
    }

    .about-content h2 {
      font-size: 2.8em;
      color: #FFA500;
      margin-bottom: 20px;
    }

    .about-content p {
      font-size: 1.2em;
      line-height: 1.7em;
      color: #ddd;
    }

    .contact-section {
      background-color: #1b1b1b;
    }

    .contact-section h2 {
      font-size: 2.5em;
      color: #FFA500;
      margin-bottom: 10px;
    }

    .contact-info {
      margin-top: 30px;
      font-size: 1.1em;
      line-height: 2em;
      color: #ccc;
    }

    .contact-form {
      margin-top: 40px;
      max-width: 600px;
      margin-left: auto;
      margin-right: auto;
      background-color: #2a2a2a;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(255, 165, 0, 0.2);
    }

    .contact-form input,
    .contact-form textarea {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      background-color: #111;
      border: 1px solid #444;
      color: #fff;
      border-radius: 5px;
      font-size: 1em;
    }

    .contact-form button {
      background-color: #FFA500;
      border: none;
      padding: 12px 20px;
      font-size: 1em;
      color: #111;
      border-radius: 5px;
      cursor: pointer;
      transition: background 0.3s;
    }

    .contact-form button:hover {
      background-color: #e69500;
    }

    @media (max-width: 768px) {
      .about-content h2, .contact-section h2 {
        font-size: 2em;
      }
      .about-content p {
        font-size: 1em;
      }
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
  <!-- About Us Section -->
  <section class="section about-section">
    <div class="about-content">
      <h2>About MechFuel</h2>
      <p>
        At MechFuel, we combine modern mechanics with trusted fueling services. Founded with a passion for performance and reliability, we are your one-stop destination for comprehensive vehicle care and refueling.
        <br><br>
        Whether it’s a quick oil change, a full service check, or a top-up on fuel, our expert team ensures quality and speed — all with a customer-first mindset. We operate with transparency, integrity, and a love for machines.
      </p>
    </div>
  </section>

  <!-- Contact Us Section -->
  <section class="section contact-section" id = "contact-section">
    <h2>Contact Us</h2>
    <div class="contact-info">
      📍 Address: 123 Auto Lane, MechCity, MF 45678<br>
      ☎️ Phone: +1 800-123-MECH<br>
      ✉️ Email: support@mechfuel.com
    </div>

    <form class="contact-form" >
      <input type="text" placeholder="Your Name" required />
      <input type="email" placeholder="Your Email" required />
      <textarea rows="5" placeholder="Your Message" required></textarea>
      <button type="button">Send Message</button>
    </form>
  </section>
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
