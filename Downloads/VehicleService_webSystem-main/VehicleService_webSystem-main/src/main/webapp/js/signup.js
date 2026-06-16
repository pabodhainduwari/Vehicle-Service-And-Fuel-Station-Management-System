function validateSignupForm(){
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("passWord").value.trim();
    const confirmPassword = document.getElementById("confirm_passWord").value.trim();
    
    
    if(email === ""){
        document.getElementById("invalid_email").style.display = 'none';
    }
    else if (!email.includes("@") || !email.includes(".")){
        document.getElementById("invalid_email").style.display = 'flex';

    }
    else{
        document.getElementById("invalid_email").style.display = 'none';
    }    

    if(password === ""){
        document.getElementById("invalid_password").style.display = 'none';
    }
    else if(password.length < 8){
        document.getElementById("invalid_password").style.display = 'flex';
        
    }
    else{
        document.getElementById("invalid_password").style.display = 'none';
    }
        
    if (confirmPassword === "") {
        document.getElementById("mismatch_password").style.display = 'none';
    }
    else if (password !== confirmPassword && confirmPassword !== "") {
          document.getElementById("mismatch_password").style.display = 'flex';
    }
    else{
          document.getElementById("mismatch_password").style.display = 'none';
    }

}

function alreadyRegistered(){
    document.getElementById("email_taken").style.display = 'flex'; 
}

function usernameTaken(){
    document.getElementById("used_userName").style.display = 'flex'; 
}

