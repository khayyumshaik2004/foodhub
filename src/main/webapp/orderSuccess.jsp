<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Success | Foodie Hub</title>

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

/* Success Container */
.success-container {
    width: 100%;
    max-width: 680px;
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: 24px;
    padding: 48px 40px;
    position: relative;
    z-index: 1;
    animation: fadeInUp 0.6s ease-out;
}

/* Animated Success Checkmark */
.success-icon-wrap {
    display: flex;
    justify-content: center;
    margin-bottom: 28px;
    position: relative;
}

.success-icon {
    width: 96px;
    height: 96px;
    border-radius: 50%;
    background: var(--success);
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 44px;
    color: white;
    position: relative;
    z-index: 2;
    animation: popBounce 0.7s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
    box-shadow: 0 0 0 0 rgba(0,200,83,0.4);
}

.success-icon::after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 96px;
    height: 96px;
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
    text-align: center;
    font-family: var(--font-display);
    font-size: 30px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
    background: var(--gradient-hero);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 10px;
}

.subtitle {
    text-align: center;
    font-size: 16px;
    color: var(--text-secondary);
    line-height: 1.6;
    margin-bottom: 20px;
}

/* Delivery Badge */
.delivery-badge {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    width: fit-content;
    margin: 0 auto 32px;
    padding: 12px 28px;
    background: rgba(255,107,53,0.08);
    border: 1px solid rgba(255,107,53,0.2);
    border-radius: var(--radius-pill);
    color: var(--accent);
    font-family: var(--font-display);
    font-size: 14px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.delivery-badge i {
    font-size: 16px;
}

/* Details Card */
.details-card {
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-lg);
    padding: 28px;
    margin-bottom: 20px;
}

.details-heading {
    font-family: var(--font-display);
    font-size: 16px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    color: var(--text-primary);
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 20px;
    padding-bottom: 16px;
    border-bottom: 1px solid var(--border-subtle);
}

.details-heading i {
    color: var(--accent);
    font-size: 18px;
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
    min-width: 100px;
    margin-right: 16px;
}

.detail-row .row-value {
    color: var(--text-primary);
    font-weight: 600;
    margin-left: auto;
    text-align: right;
}

/* Amount Box */
.amount-box {
    background: var(--surface-2);
    border-left: 3px solid var(--accent);
    border-radius: var(--radius-md);
    padding: 22px 24px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.amount-label {
    color: var(--text-secondary);
    font-size: 16px;
    font-weight: 600;
    display: flex;
    align-items: center;
    gap: 10px;
}

.amount-label i {
    color: var(--accent-secondary);
    font-size: 18px;
}

.amount-price {
    font-family: var(--font-display);
    font-size: 32px;
    font-weight: 800;
    color: var(--accent-secondary);
}

/* Thank You Box */
.thank-box {
    background: var(--success-bg);
    border-left: 3px solid var(--success);
    border-radius: var(--radius-md);
    padding: 22px 24px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 32px;
}

.thank-content .thank-title {
    font-family: var(--font-display);
    font-size: 18px;
    font-weight: 700;
    color: var(--success);
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin-bottom: 4px;
}

.thank-content .thank-msg {
    font-size: 14px;
    color: var(--text-secondary);
}

.thank-emoji {
    font-size: 40px;
    line-height: 1;
}

/* Buttons */
.btn-box {
    display: flex;
    gap: 16px;
}

.btn-primary {
    flex: 1;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
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

.btn-success-outline {
    flex: 1;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    padding: 16px 32px;
    background: transparent;
    color: var(--success);
    border: 2px solid rgba(0,200,83,0.4);
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

.btn-success-outline:hover {
    background: var(--success-bg);
    border-color: var(--success);
    transform: translateY(-2px);
}

/* Footer */
.footer {
    text-align: center;
    margin-top: 28px;
    font-size: 14px;
    color: var(--text-muted);
}

.footer span {
    background: var(--gradient-hero);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    font-family: var(--font-display);
    font-weight: 700;
}

/* Responsive */
@media (max-width: 768px) {
    .success-container {
        padding: 36px 24px;
    }
    h1 {
        font-size: 24px;
        letter-spacing: 1px;
    }
    .btn-box {
        flex-direction: column;
    }
    .amount-box {
        flex-direction: column;
        gap: 12px;
        text-align: center;
    }
    .thank-box {
        flex-direction: column;
        text-align: center;
        gap: 16px;
    }
}

@media (max-width: 480px) {
    h1 {
        font-size: 20px;
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
        padding: 20px 16px;
    }
    .amount-price {
        font-size: 26px;
    }
}
</style>
</head>
<body>

<div class="success-container">

    <!-- Animated Success Icon -->
    <div class="success-icon-wrap">
        <div class="success-icon">
            <i class="fas fa-check"></i>
        </div>
    </div>

    <h1>Order Placed Successfully</h1>

    <p class="subtitle">Your delicious food is being prepared.<br>Sit back and relax!</p>

    <!-- Delivery Estimate Badge -->
    <div class="delivery-badge">
        <i class="fas fa-motorcycle"></i> Estimated Delivery: 30–40 mins
    </div>

    <!-- Order Details Card -->
    <div class="details-card">

        <div class="details-heading">
            <i class="fas fa-clipboard-list"></i> Order Details
        </div>

        <div class="detail-row">
            <div class="row-icon"><i class="fas fa-user"></i></div>
            <span class="row-label">Customer</span>
            <span class="row-value">${customerName}</span>
        </div>

        <div class="detail-row">
            <div class="row-icon"><i class="fas fa-phone"></i></div>
            <span class="row-label">Mobile</span>
            <span class="row-value">${mobile}</span>
        </div>

        <div class="detail-row">
            <div class="row-icon"><i class="fas fa-map-marker-alt"></i></div>
            <span class="row-label">Address</span>
            <span class="row-value">${address}</span>
        </div>

        <div class="detail-row">
            <div class="row-icon"><i class="fas fa-credit-card"></i></div>
            <span class="row-label">Payment</span>
            <span class="row-value">${payment}</span>
        </div>

    </div>

    <!-- Amount Box -->
    <div class="amount-box">
        <span class="amount-label">
            <i class="fas fa-coins"></i> Amount Paid
        </span>
        <span class="amount-price">₹${total}</span>
    </div>

    <!-- Thank You Box -->
    <div class="thank-box">
        <div class="thank-content">
            <div class="thank-title">Thank you for choosing Foodie Hub!</div>
            <div class="thank-msg">We appreciate your order and promise great taste.</div>
        </div>
        <div class="thank-emoji">🍔🥤</div>
    </div>

    <!-- Action Buttons -->
    <div class="btn-box">
        <a href="restaurants" class="btn-primary">
            <i class="fas fa-home"></i> Continue Shopping
        </a>
        <a href="orders" class="btn-success-outline">
            <i class="fas fa-box"></i> View My Orders
        </a>
    </div>

    <!-- Footer -->
    <div class="footer">
        <i class="fas fa-heart" style="color: var(--danger);"></i> Made with love by <span>Foodie Hub</span>
    </div>

</div>

</body>
</html>