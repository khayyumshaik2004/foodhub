<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Password Reset Successful</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
:root {
    --bg-primary: #0f0f1b;
    --surface-1: #161625;
    --border-subtle: rgba(255,255,255,0.06);
    --gradient-accent: linear-gradient(135deg, #ff6b35, #ff8c5a);
    --text-primary: #f0f0f0;
    --text-secondary: #a0a0b0;
    --success: #00c853;
    --success-bg: rgba(0,200,83,0.1);
    --font-display: 'Montserrat', sans-serif;
    --font-body: 'Inter', sans-serif;
    --radius-xl: 24px;
    --radius-pill: 50px;
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
.checkmark-circle {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    background: var(--success-bg);
    border: 3px solid var(--success);
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 24px;
}
.checkmark-circle i {
    font-size: 32px;
    color: var(--success);
}
.welcome-heading {
    font-family: var(--font-display);
    font-size: 26px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
    margin-bottom: 12px;
}
.subtitle {
    color: var(--text-secondary);
    font-size: 15px;
    margin-bottom: 32px;
    line-height: 1.5;
}
.btn-primary {
    display: inline-block;
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
    text-decoration: none;
}
</style>
</head>
<body>
<div class="auth-card">
    <div class="checkmark-circle">
        <i class="fa-solid fa-check"></i>
    </div>
    <h2 class="welcome-heading">Reset Successful</h2>
    <p class="subtitle">Your password has been updated successfully. You can now login.</p>
    <a href="login.jsp" class="btn-primary">
        <i class="fa-solid fa-arrow-right-to-bracket" style="margin-right:8px"></i> Go To Login
    </a>
</div>
</body>
</html>