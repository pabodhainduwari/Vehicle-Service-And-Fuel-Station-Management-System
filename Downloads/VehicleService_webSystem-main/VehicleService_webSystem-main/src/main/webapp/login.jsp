 <%
    // If a session already exists, invalidate it
    if (session != null) {
        session.invalidate();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- css -->
    <link rel="stylesheet" href="css/login_signup.css">

    
    <!-- fonts -->
    <link href='https://fonts.googleapis.com/css?family=EB Garamond' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Varela Round' rel='stylesheet'>



    <title>Login</title>
</head>
<body>
    <header>
        <nav>
            <a href="indexServlet">Home</a>
            <a href="faq.jsp">FAQ</a>
            <a class="header_signup_button" href="signup.jsp">Sign Up</a>

        </nav>
    </header>
    <div class="main">
        <div class="login_box">
            <form class="login_form" method="POST" action="loginServlet" onsubmit="">
                <label class="login_header" for="">LOG IN</label>
				
                <div  class="userName_box">
                    <label for="userName">Email</label>
                    
                    <input type="text" name="email" id="email" placeholder="Email">                    
                    
                </div>

                <div class="password_box" >
                    <label for="passWord">Password</label>
                    
                    <input type="password" name="passWord" id="passWord" placeholder="Password">
                    <span class="error" id="invalidCredentials">*Invalid Email or Password</span>
                    
                </div>
                <div class="remember_me_forgot_password" id="remember_me_forgot_password">
                    <div class="remember_me_box" id="remember_me_box">
                        <label for="remember_me_checkbox">Remember Me</label>
                        <input class="remember_me_checkbox" type="checkbox" id="remember_me_checkbox">
                    </div>
                    <div class="forgot_password_box" id="forgot_password_box">
                        <a href="">Forgot Password?</a>
                    </div>
                </div>
                              
                
                <button class="login_button" id="login_button" type="submit">LOGIN</button>

                <div class="register_box">
                    <div>
                        <label class="register_label" for="register">Don't have an account?</label>
                    </div>
                    <div>
                        <a href="signup.jsp" id="register">Register</a>
                    </div>
                                      
                </div>
            </form>
        </div>
    </div>
    <footer>

    </footer>
    <!-- java -->
    <script src="js/login.js" ></script>
    <% if (Boolean.TRUE.equals(request.getAttribute("invalid_Credentials"))) {
    	 System.out.println("no email or password 2");%>
			<script>
				loginValidation();
			</script>
	<% } %>
</body>
</html>