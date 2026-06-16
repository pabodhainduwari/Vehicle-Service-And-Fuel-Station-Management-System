<!DOCTYPE html>
<%-- <%@page import="jdk.internal.org.jline.terminal.TerminalBuilder.SystemOutput"%> --%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- css -->
<link rel="stylesheet" href="css/login_signup.css">



<link href='https://fonts.googleapis.com/css?family=EB Garamond'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Lato'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Varela Round' rel='stylesheet'>

<title>Sign Up</title>
</head>
<body>
	<header>
		<nav>
			<a href="indexServlet">Home</a>
            <a href="faq.jsp">FAQ</a>
            <a class="header_signup_button" href="login.jsp">Log In</a>

		</nav>
	</header>
	<div class="main">
		<div class="signup_box">
			<!-- printif boolean value equals true -->
			
			<form class="signup_form" method="POST" action="signupServlet"
				onsubmit="">
				<label class="signup_header" for="">SIGN UP</label>

				<div class="email_box">
					<label for="email">Email</label> <span class="error" id="invalid_email">*Invalid Email Format</span> 
					<span class="error" id="email_taken">*This Email is Already Registered</span> <input type="email" name="email" id="email" placeholder="Email" onblur="validateSignupForm()">

				</div>

				<div class="userName_box">
					<label for="userName">User Name</label> <span class="error"
						id="used_userName">*User Name already Used</span> <input
						type="text" name="userName" id="userName" placeholder="Username">

				</div>
				<div class="name_box">
					<label for="name">Full Name</label> <input type="text" name="name"
						id="name" placeholder="Full Name">

				</div>
				<div class="NIC_box">
					<label for="NIC">NIC</label> <span class="error"
						id="invalid_password">*Enter 8 digit password</span> <input
						type="text" name="NIC" id="NIC"
						placeholder="NIC">


				</div>
				<div class="password_box">
					<label for="passWord">Password</label> <span class="error"
						id="invalid_password">*Enter 8 digit password</span> <input
						type="password" name="passWord" id="passWord"
						placeholder="Password" onkeyup="validateSignupForm()">
				</div>
				

				<div class="confirm_password_box">
					<label for="confirm_passWord">Confirm Password</label> <span
						class="error" id="mismatch_password">*Password does not
						match</span> <input type="password" name="confirm_passWord"
						id="confirm_passWord" placeholder="Re enter the password"
						onkeyup="validateSignupForm()">

				</div>
				
				<button class="signup_button" id="signup_button" type="submit"
					value="signup">SIGN UP</button>

				<div class="register_box">
					<div>
						<label class="login_label" for="login">Already have an
							Account</label>
					</div>
					<div>
						<a href="login.jsp" id="register">Log in</a>
					</div>

				</div>
			</form>
		</div>
	</div>
	<footer> </footer>
	<!-- java -->
	<script src="js/signup.js"></script>
	<%
			if (Boolean.TRUE.equals(request.getAttribute("emailTaken"))) {
				
			%>
			<script>
				alreadyRegistered();
			</script>
			<%
			}
			if (Boolean.TRUE.equals(request.getAttribute("usernameTaken"))) {
				
			%>
			<script>
				usernameTaken();
			</script>
			<%
			}
			%>
</body>
</html>