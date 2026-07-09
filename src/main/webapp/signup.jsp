<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Foodie Hub - Sign Up</title>

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

@keyframes scaleIn {
    from { opacity: 0; transform: scale(0.9); }
    to { opacity: 1; transform: scale(1); }
}

/* AUTH CARD */
.auth-card {
    width: 100%;
    max-width: 520px;
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
    margin-bottom: 28px;
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
.page-heading {
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
    margin-bottom: 8px;
    font-weight: 400;
}

/* MESSAGE */
#msg {
    text-align: center;
    color: var(--danger);
    font-weight: 600;
    font-size: 13px;
    margin-bottom: 12px;
    padding: 10px 16px;
    min-height: 18px;
    background: transparent;
    border-radius: var(--radius-md);
    transition: all 0.3s ease;
}

#msg:not(:empty) {
    background: var(--danger-bg);
    border: 1px solid rgba(255,71,87,0.15);
}

/* INPUT */
.input-box {
    margin-bottom: 16px;
}

.input-box > label {
    display: block;
    font-family: var(--font-body);
    font-size: 13px;
    font-weight: 500;
    color: var(--text-secondary);
    margin-bottom: 6px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.input-box > label i {
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

/* PASSWORD TOGGLE */
.password-box {
    position: relative;
}

.password-box .input-field {
    padding-right: 48px;
}

.password-box .toggle-eye {
    position: absolute;
    right: 16px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: var(--text-muted);
    font-size: 15px;
    transition: color 0.3s ease;
    background: none;
    border: none;
    padding: 0;
}

.password-box .toggle-eye:hover {
    color: var(--accent);
}

/* GENDER SEGMENTED CONTROL */
.gender-label {
    display: block;
    font-family: var(--font-body);
    font-size: 13px;
    font-weight: 500;
    color: var(--text-secondary);
    margin-bottom: 8px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.gender-label i {
    margin-right: 6px;
    color: var(--accent);
    font-size: 12px;
}

.gender-box {
    display: flex;
    gap: 10px;
}

.gender-box label {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    padding: 12px 14px;
    background: var(--surface-2);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-md);
    cursor: pointer;
    color: var(--text-secondary);
    font-family: var(--font-body);
    font-size: 13px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.gender-box label:hover {
    background: var(--surface-3);
    border-color: var(--border-medium);
}

.gender-box input[type="radio"] {
    display: none;
}

.gender-box label:has(input:checked) {
    background: var(--surface-3);
    border-color: var(--accent);
    color: var(--accent);
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
    margin-top: 20px;
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-accent);
}

.btn-primary:active {
    transform: translateY(0);
}

/* LOGIN LINK */
.login-link {
    text-align: center;
    margin-top: 24px;
    color: var(--text-secondary);
    font-size: 14px;
}

.login-link a {
    text-decoration: none;
    color: var(--accent);
    font-weight: 600;
    transition: color 0.3s ease;
}

.login-link a:hover {
    color: var(--accent-hover);
    text-decoration: underline;
}

/* FOOTER */
.footer {
    margin-top: 24px;
    text-align: center;
    color: var(--text-muted);
    font-family: var(--font-display);
    font-size: 12px;
    letter-spacing: 0.5px;
}

/* RESPONSIVE */
@media (max-width: 768px) {
    body {
        padding: 24px 16px;
    }

    .auth-card {
        padding: 36px 28px;
    }

    .page-heading {
        font-size: 24px;
    }

    .gender-box {
        flex-wrap: wrap;
    }

    .gender-box label {
        flex: 1 1 calc(33% - 8px);
        min-width: 80px;
    }
}

@media (max-width: 480px) {
    .auth-card {
        padding: 28px 20px;
        border-radius: var(--radius-lg);
    }

    .logo-section h1 {
        font-size: 20px;
    }

    .page-heading {
        font-size: 22px;
        letter-spacing: 1px;
    }

    .logo-icon {
        width: 52px;
        height: 52px;
        font-size: 22px;
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
            <i class="fa-solid fa-utensils"></i>
        </div>
        <h1>Foodie Hub</h1>
    </div>

    <h2 class="page-heading">Create Account</h2>

    <p class="subtitle">
        Sign up to start your food journey
    </p>

    <p id="msg"></p>

    <form action="signup" method="post"
          onsubmit="return validateForm()">

        <div class="input-box">
            <label><i class="fa-solid fa-user"></i>Full Name</label>

            <input type="text"
                   id="name"
                   name="name"
                   class="input-field"
                   placeholder="Enter Full Name"
                   required>
        </div>

        <div class="input-box">
            <label><i class="fa-solid fa-envelope"></i>Email</label>

            <input type="email"
                   name="email"
                   class="input-field"
                   placeholder="Enter Email"
                   required>
        </div>

        <div class="input-box">
            <label><i class="fa-solid fa-phone"></i>Mobile Number</label>

            <input type="text"
                   id="phone"
                   name="phone"
                   class="input-field"
                   placeholder="Enter Mobile Number"
                   required>
        </div>

        <div class="input-box">
            <label><i class="fa-solid fa-lock"></i>Password</label>

            <div class="password-box">

                <input type="password"
                       id="password"
                       name="password"
                       class="input-field"
                       placeholder="Enter Password"
                       required>

                <i class="fa-solid fa-eye toggle-eye"
                   onclick="togglePassword('password')"></i>

            </div>
        </div>

        <div class="input-box">
            <label><i class="fa-solid fa-lock"></i>Confirm Password</label>

            <div class="password-box">

                <input type="password"
                       id="confirm"
                       class="input-field"
                       placeholder="Confirm Password"
                       required>

                <i class="fa-solid fa-eye toggle-eye"
                   onclick="togglePassword('confirm')"></i>

            </div>
        </div>

        <div class="input-box">

            <span class="gender-label"><i class="fa-solid fa-venus-mars"></i>Gender</span>

            <div class="gender-box">

                <label>
                    <input type="radio"
                           name="gender"
                           value="Male"
                           required><span>Male</span>
                </label>

                <label>
                    <input type="radio"
                           name="gender"
                           value="Female"><span>Female</span>
                </label>

                <label>
                    <input type="radio"
                           name="gender"
                           value="Other"><span>Other</span>
                </label>

            </div>

        </div>

        <button type="submit"
                class="btn-primary">
            <i class="fa-solid fa-user-plus"></i>Create Account
        </button>

    </form>

    <div class="login-link">
        Already have an account?
        <a href="login.jsp">Login</a>
    </div>

    <div class="footer">
        &copy; 2026 Foodie Hub
    </div>

</div>

<script>

function validateForm(){

    let name =
    document.getElementById("name").value.trim();

    let phone =
    document.getElementById("phone").value.trim();

    let password =
    document.getElementById("password").value;

    let confirm =
    document.getElementById("confirm").value;

    let msg =
    document.getElementById("msg");

    msg.innerHTML = "";

    if(!/^[A-Za-z ]+$/.test(name)){
        msg.innerHTML =
        "Name should contain only letters";
        return false;
    }

    if(!/^[0-9]{10}$/.test(phone)){
        msg.innerHTML =
        "Mobile number must contain exactly 10 digits";
        return false;
    }

    if(password !== confirm){
        msg.innerHTML =
        "Password and Confirm Password must match";
        return false;
    }

    return true;
}

function togglePassword(id){

    let field =
    document.getElementById(id);

    field.type =
    field.type === "password"
    ? "text"
    : "password";
}

</script>

</body>
</html>