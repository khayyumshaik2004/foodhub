<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Foodie Hub | Forgot Password</title>

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
    text-align: center;
    animation: fadeInUp 0.6s ease-out;
}

/* LOGO ICON */
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
    margin-bottom: 24px;
    box-shadow: var(--shadow-accent);
}

/* HEADING */
.page-heading {
    font-family: var(--font-display);
    font-size: 28px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
    color: var(--text-primary);
    margin-bottom: 12px;
}

.subtitle {
    color: var(--text-secondary);
    font-family: var(--font-body);
    font-size: 15px;
    line-height: 1.7;
    margin-bottom: 32px;
    max-width: 380px;
    margin-left: auto;
    margin-right: auto;
}

/* INPUT */
.input-box {
    margin-bottom: 24px;
    text-align: left;
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
    font-size: 12px;
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

/* BUTTON */
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
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-accent);
}

.btn-primary:active {
    transform: translateY(0);
}

/* BACK LINK */
.back-link {
    margin-top: 28px;
}

.back-link a {
    color: var(--text-secondary);
    text-decoration: none;
    font-size: 14px;
    font-weight: 500;
    transition: color 0.3s ease;
}

.back-link a:hover {
    color: var(--accent);
}

.back-link a i {
    margin-right: 6px;
}

/* FOOTER */
.footer {
    margin-top: 28px;
    color: var(--text-muted);
    font-family: var(--font-display);
    font-size: 12px;
    letter-spacing: 0.5px;
}

/* RESPONSIVE */
@media (max-width: 768px) {
    .auth-card {
        padding: 40px 28px;
    }

    .page-heading {
        font-size: 24px;
    }
}

@media (max-width: 480px) {
    .auth-card {
        padding: 32px 22px;
        border-radius: var(--radius-lg);
    }

    .page-heading {
        font-size: 22px;
        letter-spacing: 1px;
    }

    .logo-icon {
        width: 56px;
        height: 56px;
        font-size: 24px;
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

    <div class="logo-icon">
        <i class="fa-solid fa-lock"></i>
    </div>

    <h2 class="page-heading">Forgot Password</h2>

    <p class="subtitle">
        Enter your registered email address.
        We'll send an OTP to verify your identity
        and reset your password securely.
    </p>

    <form action="sendOTP" method="post">

        <div class="input-box">

            <label><i class="fa-solid fa-envelope"></i>Email Address</label>

            <input type="email"
                   name="email"
                   class="input-field"
                   placeholder="Enter Registered Email"
                   required>

        </div>

        <button type="submit"
                class="btn-primary">
            <i class="fa-solid fa-paper-plane"></i>Send OTP
        </button>

    </form>

    <div class="back-link">
        <a href="login.jsp">
            <i class="fa-solid fa-arrow-left"></i>&larr; Back to Login
        </a>
    </div>

    <div class="footer">
        &copy; 2026 Foodie Hub
    </div>

</div>

</body>
</html>