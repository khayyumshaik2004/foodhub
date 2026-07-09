<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Foodie Hub Login</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

:root {
    --bg-primary: #0f0f1b;
    --bg-secondary: #1a1a2e;
    --surface-1: #161625;
    --surface-2: #1c1c30;
    --surface-3: #22223a;
    --border-subtle: rgba(255,255,255,0.06);
    --border-medium: rgba(255,255,255,0.12);
    --accent: #ff6b35;
    --accent-hover: #ff8c5a;
    --accent-secondary: #ffc947;
    --gradient-accent: linear-gradient(135deg, #ff6b35, #ff8c5a);
    --gradient-hero: linear-gradient(135deg, #ff6b35 0%, #ffc947 100%);
    --text-primary: #f0f0f0;
    --text-secondary: #a0a0b0;
    --text-muted: #6b6b80;
    --success: #00c853;
    --success-bg: rgba(0,200,83,0.08);
    --danger: #ff4757;
    --danger-bg: rgba(255,71,87,0.08);
    --font-display: 'Montserrat', sans-serif;
    --font-body: 'Inter', sans-serif;
    --radius-sm: 8px;
    --radius-md: 12px;
    --radius-lg: 20px;
    --radius-xl: 24px;
    --radius-pill: 50px;
    --shadow-sm: 0 2px 8px rgba(0,0,0,0.2);
    --shadow-md: 0 8px 24px rgba(0,0,0,0.3);
    --shadow-lg: 0 16px 48px rgba(0,0,0,0.4);
    --shadow-accent: 0 8px 30px rgba(255,107,53,0.25);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    width: 100%;
    min-height: 100vh;
    background: var(--bg-primary);
    color: var(--text-primary);
    font-family: var(--font-body);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 20px;
    position: relative;
    overflow-x: hidden;
}

body::before {
    content: '';
    position: fixed;
    top: -30%;
    right: -20%;
    width: 600px;
    height: 600px;
    background: radial-gradient(circle, rgba(255,107,53,0.07) 0%, transparent 70%);
    pointer-events: none;
    z-index: 0;
}

@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(24px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes scaleIn {
    from { opacity: 0; transform: scale(0.9); }
    to { opacity: 1; transform: scale(1); }
}

/* AUTH CARD */
.auth-card {
    width: 100%;
    max-width: 480px;
    padding: 48px 40px;
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-xl);
    position: relative;
    z-index: 1;
    animation: fadeInUp 0.6s ease-out;
}

/* LOGO */
.logo-section {
    text-align: center;
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
    color: white;
    margin-bottom: 16px;
    box-shadow: var(--shadow-accent);
}

.logo-section h1 {
    font-family: var(--font-display);
    font-size: 24px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 3px;
    background: var(--gradient-hero);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 4px;
}

/* HEADING */
.welcome-heading {
    font-family: var(--font-display);
    font-size: 28px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
    color: var(--text-primary);
    text-align: center;
    margin-bottom: 8px;
}

.subtitle {
    text-align: center;
    color: var(--text-secondary);
    font-family: var(--font-body);
    font-size: 15px;
    margin-bottom: 28px;
    font-weight: 400;
}

/* MESSAGE */
#message {
    text-align: center;
    color: var(--danger);
    font-weight: 600;
    font-size: 14px;
    margin-bottom: 16px;
    padding: 10px 16px;
    background: transparent;
    border-radius: var(--radius-md);
    transition: all 0.3s ease;
}

#message:not(:empty) {
    background: var(--danger-bg);
    border: 1px solid rgba(255,71,87,0.15);
}

/* INPUT */
.input-box {
    margin-bottom: 20px;
}

.input-box label {
    display: block;
    font-family: var(--font-body);
    font-size: 13px;
    font-weight: 500;
    color: var(--text-secondary);
    margin-bottom: 8px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.input-box label i {
    margin-right: 6px;
    color: var(--accent);
    font-size: 13px;
}

.input-field {
    width: 100%;
    padding: 14px 18px;
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-md);
    color: var(--text-primary);
    font-family: var(--font-body);
    font-size: 15px;
    outline: none;
    transition: all 0.3s ease;
}

.input-field::placeholder {
    color: var(--text-muted);
}

.input-field:focus {
    border-color: var(--accent);
    box-shadow: 0 4px 12px rgba(255,107,53,0.12);
}

/* FORGOT LINK */
.forgot-link {
    text-align: right;
    margin: -8px 0 4px 0;
}

.forgot-link a {
    color: var(--accent);
    text-decoration: none;
    font-weight: 500;
    font-size: 13px;
    transition: color 0.3s ease;
}

.forgot-link a:hover {
    color: var(--accent-hover);
}

/* LOGIN BUTTON */
.btn-primary {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
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
    transition: all 0.3s ease;
    text-decoration: none;
    margin-top: 8px;
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-accent);
}

.btn-primary:active {
    transform: translateY(0);
}

/* DIVIDER */
.divider {
    display: flex;
    align-items: center;
    margin: 28px 0;
}

.divider::before,
.divider::after {
    content: '';
    flex: 1;
    height: 1px;
    background: var(--border-subtle);
}

.divider span {
    padding: 0 16px;
    color: var(--text-muted);
    font-size: 13px;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 1px;
}

/* SIGNUP LINK */
.signup-link {
    text-align: center;
    color: var(--text-secondary);
    font-size: 14px;
}

.signup-link a {
    color: var(--accent);
    text-decoration: none;
    font-weight: 600;
    transition: color 0.3s ease;
}

.signup-link a:hover {
    color: var(--accent-hover);
    text-decoration: underline;
}

/* FOOTER */
.footer {
    margin-top: 28px;
    text-align: center;
    color: var(--text-muted);
    font-family: var(--font-display);
    font-size: 12px;
    letter-spacing: 0.5px;
}

/* RESPONSIVE */
@media (max-width: 768px) {
    body {
        padding: 20px;
    }

    .auth-card {
        padding: 36px 28px;
        max-width: 100%;
    }

    .welcome-heading {
        font-size: 24px;
    }

    .logo-icon {
        width: 56px;
        height: 56px;
        font-size: 24px;
    }
}

@media (max-width: 480px) {
    .auth-card {
        padding: 28px 20px;
        border-radius: var(--radius-lg);
    }

    .welcome-heading {
        font-size: 22px;
        letter-spacing: 1px;
    }

    .logo-section h1 {
        font-size: 20px;
    }

    .input-field {
        padding: 12px 14px;
        font-size: 14px;
    }

    .btn-primary {
        padding: 12px 24px;
        font-size: 13px;
    }
}

</style>

</head>

<body>

<div class="auth-card">

    <div class="logo-section">
        <div class="logo-icon">
            <i class="fa-solid fa-utensils" style="color: white;"></i>
        </div>
        <h1>Foodie Hub</h1>
    </div>

    <h2 class="welcome-heading">Welcome Back</h2>

    <p class="subtitle">
        Login to continue your food journey
    </p>

    <p id="message"></p>

    <form action="login" method="post">

        <div class="input-box">

            <label><i class="fa-solid fa-envelope"></i>Email</label>

            <input type="email"
                   name="email"
                   class="input-field"
                   placeholder="Enter your email address"
                   required>

        </div>

        <div class="input-box">

            <label><i class="fa-solid fa-lock"></i>Password</label>

            <input type="password"
                   name="password"
                   class="input-field"
                   placeholder="Enter your password"
                   required>

        </div>

        <div class="forgot-link">
            <a href="forgotPassword.jsp">
                Forgot Password?
            </a>
        </div>

        <button type="submit"
                class="btn-primary">
            <i class="fa-solid fa-right-to-bracket"></i>Login
        </button>

    </form>

    <div class="divider"><span>or</span></div>

    <div class="signup-link">

        Don't have an account?

        <a href="signup.jsp">
            Sign Up
        </a>

    </div>

    <div class="footer">
        &copy; 2026 Foodie Hub
    </div>

</div>

<script>

const params =
new URLSearchParams(window.location.search);

const msg = params.get("msg");

if(msg){

document.getElementById("message").innerHTML=msg;

}

</script>

</body>
</html>