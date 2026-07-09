<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String customerName = request.getParameter("customerName");
String address = request.getParameter("address");
String payment = request.getParameter("payment");
String total = request.getParameter("totalAmount");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Placed | Foodie Hub</title>

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
    background: var(--bg-primary);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 24px;
    font-family: var(--font-body);
    color: var(--text-primary);
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

/* Container Card */
.container {
    width: 100%;
    max-width: 560px;
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: 24px;
    padding: 48px 40px;
    text-align: center;
    position: relative;
    z-index: 1;
    animation: fadeInUp 0.6s ease-out;
}

/* Animated Success Checkmark */
.success-wrap {
    display: flex;
    justify-content: center;
    margin-bottom: 28px;
    position: relative;
}

.success-icon {
    width: 88px;
    height: 88px;
    border-radius: 50%;
    background: var(--success);
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 40px;
    color: white;
    position: relative;
    z-index: 2;
    animation: popBounce 0.7s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}

.success-icon::after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 88px;
    height: 88px;
    border-radius: 50%;
    border: 3px solid var(--success);
    transform: translate(-50%, -50%) scale(1);
    animation: pulseRing 2s ease-in-out 0.8s infinite;
    z-index: 1;
}

@keyframes popBounce {
    0% { transform: scale(0); opacity: 0; }
    60% { transform: scale(1.15); opacity: 1; }
    80% { transform: scale(0.95); }
    100% { transform: scale(1); opacity: 1; }
}

@keyframes pulseRing {
    0% { transform: translate(-50%, -50%) scale(1); opacity: 0.6; }
    100% { transform: translate(-50%, -50%) scale(1.6); opacity: 0; }
}

@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(24px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Heading */
h1 {
    font-family: var(--font-display);
    font-size: 26px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
    background: var(--gradient-hero);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 8px;
}

.subtitle {
    color: var(--text-secondary);
    font-size: 15px;
    margin-bottom: 32px;
}

/* Details Card */
.details-card {
    text-align: left;
    background: var(--surface-2);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-lg);
    padding: 24px;
    margin-bottom: 32px;
}

.detail-row {
    display: flex;
    align-items: center;
    padding: 14px 0;
    border-bottom: 1px solid var(--border-subtle);
    font-size: 15px;
}

.detail-row:last-child {
    border-bottom: none;
    padding-bottom: 0;
}

.detail-row .row-icon {
    width: 36px;
    height: 36px;
    border-radius: var(--radius-sm);
    background: var(--surface-3);
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    margin-right: 14px;
}

.detail-row .row-icon i {
    color: var(--accent);
    font-size: 14px;
}

.detail-row .row-label {
    color: var(--text-secondary);
    font-weight: 500;
    min-width: 90px;
}

.detail-row .row-value {
    color: var(--text-primary);
    font-weight: 600;
    margin-left: auto;
    text-align: right;
}

.detail-row .row-value.amount {
    font-family: var(--font-display);
    font-size: 24px;
    font-weight: 800;
    background: var(--gradient-hero);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

/* Button */
.btn-primary {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    width: 100%;
    padding: 16px 32px;
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

/* Responsive */
@media (max-width: 768px) {
    .container {
        padding: 36px 24px;
    }
    h1 {
        font-size: 22px;
        letter-spacing: 1px;
    }
}

@media (max-width: 480px) {
    h1 {
        font-size: 18px;
    }
    .detail-row {
        flex-wrap: wrap;
        gap: 6px;
    }
    .detail-row .row-value {
        margin-left: 50px;
        text-align: left;
    }
    .details-card {
        padding: 18px 16px;
    }
}
</style>

</head>
<body>

<div class="container">

    <!-- Animated Success Checkmark -->
    <div class="success-wrap">
        <div class="success-icon">
            <i class="fas fa-check"></i>
        </div>
    </div>

    <h1>Order Placed Successfully</h1>

    <p class="subtitle">Your food is being prepared with care.</p>

    <!-- Details Card -->
    <div class="details-card">

        <div class="detail-row">
            <div class="row-icon"><i class="fas fa-user"></i></div>
            <span class="row-label">Customer</span>
            <span class="row-value">
                <%= customerName %>
            </span>
        </div>

        <div class="detail-row">
            <div class="row-icon"><i class="fas fa-map-marker-alt"></i></div>
            <span class="row-label">Address</span>
            <span class="row-value">
                <%= address %>
            </span>
        </div>

        <div class="detail-row">
            <div class="row-icon"><i class="fas fa-credit-card"></i></div>
            <span class="row-label">Payment</span>
            <span class="row-value">
                <%= payment %>
            </span>
        </div>

        <div class="detail-row">
            <div class="row-icon"><i class="fas fa-coins"></i></div>
            <span class="row-label">Amount</span>
            <span class="row-value amount">
                ₹<%= total %>
            </span>
        </div>

    </div>

    <a href="restaurants" class="btn-primary">
        <i class="fas fa-home"></i> Continue Shopping
    </a>

</div>

</body>
</html>