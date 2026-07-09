<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Foodie Hub | Reset Password</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
:root {
    --bg-primary: #0f0f1b;
    --surface-1: #161625;
    --border-subtle: rgba(255,255,255,0.06);
    --accent: #ff6b35;
    --accent-hover: #ff8c5a;
    --gradient-accent: linear-gradient(135deg, #ff6b35, #ff8c5a);
    --text-primary: #f0f0f0;
    --text-secondary: #a0a0b0;
    --danger: #ff4757;
    --font-display: 'Montserrat', sans-serif;
    --font-body: 'Inter', sans-serif;
    --radius-xl: 24px;
    --radius-pill: 50px;
    --radius-md: 12px;
}
* { margin: 0; padding: 0; box-sizing: border-box; }
body {
    min-height: 100vh;
    background: var(--bg-primary);
    color: var(--text-primary);
    font-family: var(--font-body);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}
.auth-card {
    width: 100%;
    max-width: 480px;
    padding: 48px 40px;
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-xl);
    text-align: center;
}
.logo-icon {
    width: 64px;
    height: 64px;
    background: var(--gradient-accent);
    border-radius: 50%;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    font-size: 28px;
    margin: 0 auto 16px auto;
}
.welcome-heading {
    font-family: var(--font-display);
    font-size: 28px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
    margin-bottom: 8px;
}
.subtitle {
    color: var(--text-secondary);
    font-size: 15px;
    margin-bottom: 28px;
}
.input-box {
    margin-bottom: 16px;
    text-align: left;
}
.input-box label {
    display: block;
    font-size: 13px;
    font-weight: 500;
    color: var(--text-secondary);
    margin-bottom: 8px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}
.input-box label i {
    color: var(--accent);
    margin-right: 6px;
}
.input-field {
    width: 100%;
    padding: 14px 18px;
    background: var(--bg-primary);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-md);
    color: var(--text-primary);
    font-family: var(--font-body);
    font-size: 15px;
    outline: none;
}
.input-field:focus {
    border-color: var(--accent);
}
.btn-primary {
    width: 100%;
    padding: 14px 32px;
    background: var(--gradient-accent);
    color: white;
    border: none;
    border-radius: var(--radius-pill);
    font-family: var(--font-display);
    font-size: 14px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    cursor: pointer;
    margin-top: 12px;
}
.footer {
    margin-top: 24px;
}
.footer a {
    color: var(--text-secondary);
    text-decoration: none;
    font-size: 14px;
}
</style>
</head>
<body>
<div class="auth-card">
    <div class="logo-icon">
        <i class="fa-solid fa-key" style="color: white;"></i>
    </div>
    <h2 class="welcome-heading">Reset Password</h2>
    <p class="subtitle">Create a new password for your account.</p>
    <p id="error" style="color: var(--danger); font-size: 13px; font-weight: 500; margin-bottom: 16px;"></p>
    <form action="resetPassword" method="post" onsubmit="return validateForm()">
        <div class="input-box">
            <label><i class="fa-solid fa-lock"></i> New Password</label>
            <input type="password" id="password" name="password" class="input-field" placeholder="Enter new password" required>
        </div>
        <div class="input-box">
            <label><i class="fa-solid fa-lock"></i> Confirm Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" class="input-field" placeholder="Confirm new password" required>
        </div>
        <button type="submit" class="btn-primary">
            <i class="fa-solid fa-lock" style="margin-right:8px"></i> Update Password
        </button>
    </form>
    <div class="footer">
        <a href="login.jsp"><i class="fa-solid fa-arrow-left"></i> Back to Login</a>
    </div>
</div>
<script>
function validateForm(){
    let password = document.getElementById("password").value;
    let confirm = document.getElementById("confirmPassword").value;
    let error = document.getElementById("error");
    error.innerHTML="";
    let regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[@#$%^&+=!]).{8,}$/;
    if(!regex.test(password)){
        error.innerHTML = "Password must contain Uppercase, Lowercase, Number, Special Character and minimum 8 characters.";
        return false;
    }
    if(password !== confirm){
        error.innerHTML = "Password and Confirm Password do not match.";
        return false;
    }
    return true;
}
</script>
</body>
</html>