<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Verify OTP | Foodie Hub</title>
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
.logo-section {
    margin-bottom: 32px;
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
    margin-bottom: 24px;
}
.otp-input {
    width: 100%;
    padding: 16px;
    background: var(--bg-primary);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-md);
    color: var(--text-primary);
    font-family: var(--font-body);
    font-size: 24px;
    text-align: center;
    letter-spacing: 8px;
    outline: none;
}
.otp-input:focus {
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
}
.footer {
    margin-top: 28px;
    color: var(--text-secondary);
    font-size: 14px;
}
.footer a {
    color: var(--accent);
    text-decoration: none;
    font-weight: 600;
}
</style>
</head>
<body>
<div class="auth-card">
    <div class="logo-section">
        <div class="logo-icon">
            <i class="fa-solid fa-shield-halved" style="color: white;"></i>
        </div>
    </div>
    <h2 class="welcome-heading">Verify OTP</h2>
    <p class="subtitle">Enter the OTP sent to your registered email</p>
    <form action="verifyOTP" method="post">
        <div class="input-box">
            <input type="text" name="otp" class="otp-input" maxlength="6" placeholder="------" required>
        </div>
        <button type="submit" class="btn-primary">
            <i class="fa-solid fa-check-circle" style="margin-right:8px"></i> Verify OTP
        </button>
    </form>
    <div class="footer">
        Didn't receive OTP? <a href="forgotPassword.jsp">Resend OTP</a>
    </div>
</div>
</body>
</html>