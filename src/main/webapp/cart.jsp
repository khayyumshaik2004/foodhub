<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.model.Cart"%>
<%@ page import="com.food.model.CartItem"%>

<%
Cart cart=(Cart)session.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Foodie Hub Cart</title>

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
    color: var(--text-primary);
    font-family: var(--font-body);
    min-height: 100vh;
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

/* ANIMATIONS */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(24px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes scaleIn {
    from { opacity: 0; transform: scale(0.9); }
    to { opacity: 1; transform: scale(1); }
}

/* NAVBAR */
.navbar {
    position: sticky;
    top: 0;
    z-index: 100;
    background: rgba(15,15,27,0.95);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    border-bottom: 1px solid var(--border-subtle);
    padding: 0 48px;
    height: 72px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.nav-brand {
    font-family: var(--font-display);
    font-size: 20px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
    color: var(--text-primary);
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 10px;
}

.nav-brand i {
    color: var(--accent);
    font-size: 22px;
}

.nav-center-title {
    font-family: var(--font-display);
    font-size: 16px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 2px;
    color: var(--text-secondary);
    display: flex;
    align-items: center;
    gap: 10px;
}

.nav-center-title i {
    color: var(--accent-secondary);
}

/* SECTION HEADER */
.section-header {
    text-align: center;
    margin: 48px auto 40px;
    position: relative;
    z-index: 1;
    animation: fadeInUp 0.6s ease-out;
}

.section-header h2 {
    font-family: var(--font-display);
    font-size: 32px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
    color: var(--text-primary);
    margin-bottom: 12px;
}

.section-header p {
    color: var(--text-secondary);
    font-size: 16px;
    max-width: 500px;
    margin: 0 auto;
}

.section-header::after {
    content: '';
    display: block;
    width: 60px;
    height: 3px;
    background: var(--gradient-accent);
    margin: 16px auto 0;
    border-radius: 2px;
}

/* CART CONTAINER */
.cart-wrapper {
    max-width: 900px;
    margin: 0 auto 40px;
    padding: 0 48px;
    position: relative;
    z-index: 1;
}

.cart-container {
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-lg);
    overflow: hidden;
    animation: fadeInUp 0.6s ease-out;
}

/* CART ROW */
.cart-row {
    display: flex;
    align-items: center;
    padding: 20px 28px;
    border-bottom: 1px solid var(--border-subtle);
    transition: background 0.3s ease;
    gap: 20px;
    flex-wrap: wrap;
}

.cart-row:last-child {
    border-bottom: none;
}

.cart-row:hover {
    background: rgba(255,255,255,0.02);
}

.row-name {
    font-family: var(--font-display);
    font-size: 16px;
    font-weight: 600;
    color: var(--text-primary);
    flex: 1;
    min-width: 120px;
}

.row-price {
    font-size: 14px;
    color: var(--text-secondary);
    min-width: 80px;
}

/* QTY CONTROLS */
.qty-controls {
    display: flex;
    align-items: center;
    gap: 12px;
}

.qty-btn {
    width: 38px;
    height: 38px;
    border: 1px solid var(--border-subtle);
    border-radius: 50%;
    background: var(--surface-2);
    color: var(--accent);
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: var(--font-body);
}

.qty-btn:hover {
    background: var(--accent);
    color: white;
    border-color: var(--accent);
    transform: scale(1.1);
    box-shadow: 0 4px 15px rgba(255,107,53,0.3);
}

.qty-value {
    font-family: var(--font-display);
    font-size: 18px;
    font-weight: 700;
    color: var(--text-primary);
    min-width: 28px;
    text-align: center;
}

/* LINE TOTAL */
.row-total {
    font-family: var(--font-display);
    font-size: 16px;
    font-weight: 700;
    color: var(--accent-secondary);
    min-width: 90px;
    text-align: right;
}

/* REMOVE BTN */
.remove-pill {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 8px 16px;
    border: 1px solid rgba(255,71,87,0.4);
    border-radius: var(--radius-pill);
    background: transparent;
    color: var(--danger);
    font-size: 12px;
    font-weight: 600;
    font-family: var(--font-display);
    text-transform: uppercase;
    letter-spacing: 0.5px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.remove-pill:hover {
    background: rgba(255,71,87,0.1);
    border-color: var(--danger);
    transform: translateY(-1px);
}

.remove-pill i {
    font-size: 11px;
}

/* BOTTOM BAR */
.bottom-bar {
    background: var(--surface-2);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-lg);
    padding: 24px 32px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 24px;
    animation: fadeInUp 0.6s ease-out 0.2s both;
}

.btn-continue {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    padding: 14px 32px;
    background: transparent;
    color: var(--accent);
    border: 2px solid rgba(255,107,53,0.4);
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

.btn-continue:hover {
    background: rgba(255,107,53,0.1);
    border-color: var(--accent);
    transform: translateY(-2px);
}

.btn-checkout {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
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

.btn-checkout:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-accent);
}

/* EMPTY CART */
.empty-state {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 70vh;
    position: relative;
    z-index: 1;
}

.empty-card {
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-lg);
    padding: 60px 50px;
    text-align: center;
    animation: fadeInUp 0.6s ease-out;
    max-width: 480px;
}

.empty-icon {
    width: 80px;
    height: 80px;
    background: var(--gradient-accent);
    border-radius: 50%;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    font-size: 36px;
    color: white;
    box-shadow: var(--shadow-accent);
    margin-bottom: 24px;
}

.empty-card h3 {
    font-family: var(--font-display);
    font-size: 24px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: var(--text-primary);
    margin-bottom: 24px;
}

.btn-browse {
    display: inline-flex;
    align-items: center;
    gap: 8px;
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

.btn-browse:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-accent);
}

/* RESPONSIVE */
@media (max-width: 768px) {
    .navbar {
        padding: 0 20px;
        height: 64px;
    }
    .nav-brand {
        font-size: 16px;
    }
    .nav-center-title {
        display: none;
    }
    .cart-wrapper {
        padding: 0 20px;
    }
    .cart-row {
        padding: 18px 20px;
        gap: 14px;
    }
    .row-name {
        min-width: 100%;
        font-size: 15px;
    }
    .row-price {
        min-width: auto;
    }
    .row-total {
        min-width: auto;
    }
    .bottom-bar {
        flex-direction: column;
        gap: 14px;
        padding: 20px;
    }
    .btn-continue, .btn-checkout {
        width: 100%;
        justify-content: center;
    }
    .section-header h2 {
        font-size: 24px;
    }
}

@media (max-width: 480px) {
    .navbar {
        padding: 0 16px;
        height: 60px;
    }
    .nav-brand {
        font-size: 14px;
        gap: 6px;
    }
    .cart-row {
        padding: 16px;
    }
    .qty-btn {
        width: 34px;
        height: 34px;
        font-size: 16px;
    }
    .qty-value {
        font-size: 16px;
    }
}

</style>
</head>

<body>

<nav class="navbar">

    <a href="restaurants" class="nav-brand">
        <i class="fa-solid fa-utensils"></i> Foodie Hub
    </a>

    <div class="nav-center-title">
        <i class="fa-solid fa-cart-shopping"></i> Your Cart
    </div>

    <div></div>

</nav>

<%
if(cart==null || cart.getItems().isEmpty()){
%>

<div class="empty-state">

    <div class="empty-card">
        <div class="empty-icon"><i class="fa-solid fa-bag-shopping"></i></div>
        <h3>Your Cart is Empty</h3>

        <a href="restaurants"
           class="btn-browse">

           <i class="fa-solid fa-store"></i> Browse Restaurants

        </a>
    </div>

</div>

<%
}
else{
%>

<div class="section-header">
    <h2>Your Cart</h2>
    <p>Review your items before checkout</p>
</div>

<div class="cart-wrapper">

<div class="cart-container">

<%
for(CartItem item : cart.getItems().values()){
%>

<div class="cart-row">

    <div class="row-name">
        <%=item.getItemName()%>
    </div>

    <div class="row-price">
        &#8377; <%=item.getPrice()%>
    </div>

    <div class="qty-controls">

        <form action="cart" method="post">

            <input type="hidden"
                   name="action"
                   value="minus">

            <input type="hidden"
                   name="menuId"
                   value="<%=item.getMenuId()%>">

            <button type="submit"
                    class="qty-btn">-</button>

        </form>

        <div class="qty-value">
            <%=item.getQuantity()%>
        </div>

        <form action="cart" method="post">

            <input type="hidden"
                   name="action"
                   value="plus">

            <input type="hidden"
                   name="menuId"
                   value="<%=item.getMenuId()%>">

            <button type="submit"
                    class="qty-btn">+</button>

        </form>

    </div>

    <div class="row-total">
        &#8377; <%=item.getTotalPrice()%>
    </div>

    <div>

        <form action="cart" method="post">

            <input type="hidden"
                   name="action"
                   value="delete">

            <input type="hidden"
                   name="menuId"
                   value="<%=item.getMenuId()%>">

            <button type="submit"
                    class="remove-pill">

                <i class="fa-solid fa-trash"></i> Remove
            </button>

        </form>

    </div>

</div>

<%
}
%>

</div>

<div class="bottom-bar">

    <a href="restaurants"
       class="btn-continue">

       <i class="fa-solid fa-arrow-left"></i> Continue Shopping

    </a>

    <a href="Checkout.jsp"
       class="btn-checkout">

       Proceed to Checkout <i class="fa-solid fa-arrow-right"></i>

    </a>

</div>

</div>

<%
}
%>

</body>
</html>