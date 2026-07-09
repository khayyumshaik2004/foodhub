<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.food.model.Order" %>
<%@ page import="com.food.model.OrderItem" %>
<%@ page import="com.food.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    
    List<Order> orderList = (List<Order>) request.getAttribute("orderList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Orders | Foodie Hub</title>

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

/* ===== NAVBAR ===== */
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
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 32px;
    list-style: none;
}

.nav-links a {
    font-family: var(--font-body);
    font-size: 14px;
    font-weight: 500;
    color: var(--text-secondary);
    text-decoration: none;
    text-transform: uppercase;
    letter-spacing: 1px;
    transition: color 0.3s;
    position: relative;
    display: flex;
    align-items: center;
    gap: 6px;
}

.nav-links a:hover, .nav-links a.active {
    color: var(--accent);
}

.nav-links a::after {
    content: '';
    position: absolute;
    bottom: -4px;
    left: 0;
    width: 0;
    height: 2px;
    background: var(--accent);
    transition: width 0.3s;
}

.nav-links a:hover::after {
    width: 100%;
}

/* ===== MAIN CONTENT ===== */
.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 48px 20px 60px;
    position: relative;
    z-index: 1;
}

/* Section Header */
.section-header {
    text-align: center;
    margin-bottom: 48px;
}

.section-header h1 {
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

/* ===== ORDER CARDS ===== */
.order-card {
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-lg);
    overflow: hidden;
    margin-bottom: 24px;
    transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    animation: fadeInUp 0.6s ease-out both;
}

.order-card:hover {
    transform: translateY(-6px);
    border-color: var(--border-medium);
    box-shadow: var(--shadow-lg), 0 0 40px rgba(255,107,53,0.04);
}

.order-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 28px;
    border-bottom: 1px solid var(--border-subtle);
}

.order-id {
    font-family: var(--font-display);
    font-size: 16px;
    font-weight: 700;
    color: var(--text-primary);
    text-transform: uppercase;
    letter-spacing: 1px;
    display: flex;
    align-items: center;
    gap: 8px;
}

.order-id i {
    color: var(--accent);
}

.order-date {
    color: var(--text-muted);
    font-size: 13px;
    display: flex;
    align-items: center;
    gap: 6px;
}

.order-date i {
    font-size: 12px;
    color: var(--text-muted);
}

.order-items {
    padding: 16px 28px;
}

.item-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 0;
    font-size: 15px;
    border-bottom: 1px solid var(--border-subtle);
}

.item-row:last-child {
    border-bottom: none;
}

.item-name {
    color: var(--text-secondary);
}

.item-qty {
    color: var(--accent);
    font-weight: 700;
    font-family: var(--font-display);
}

.item-price {
    font-weight: 600;
    color: var(--text-primary);
}

.order-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: var(--surface-2);
    padding: 18px 28px;
    border-top: 1px solid var(--border-subtle);
}

.payment-pill {
    font-size: 12px;
    font-family: var(--font-display);
    font-weight: 600;
    color: var(--accent);
    text-transform: uppercase;
    letter-spacing: 1px;
    background: rgba(255,107,53,0.08);
    border: 1px solid rgba(255,107,53,0.2);
    padding: 6px 16px;
    border-radius: var(--radius-pill);
    display: flex;
    align-items: center;
    gap: 6px;
}

.payment-pill i {
    color: var(--accent-secondary);
    font-size: 12px;
}

.total-amount {
    font-family: var(--font-display);
    font-size: 22px;
    font-weight: 800;
    color: var(--accent-secondary);
}

/* ===== EMPTY STATE ===== */
.empty-state {
    text-align: center;
    padding: 64px 40px;
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-lg);
    animation: fadeInUp 0.6s ease-out;
}

.empty-icon {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    background: var(--surface-3);
    display: inline-flex;
    align-items: center;
    justify-content: center;
    font-size: 36px;
    margin-bottom: 24px;
}

.empty-state h3 {
    font-family: var(--font-display);
    font-size: 22px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: var(--text-primary);
    margin-bottom: 10px;
}

.empty-state p {
    color: var(--text-secondary);
    font-size: 15px;
    margin-bottom: 32px;
}

.btn-primary {
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

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-accent);
}

/* ===== ANIMATIONS ===== */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(24px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Staggered animation */
.order-card:nth-child(1) { animation-delay: 0.05s; }
.order-card:nth-child(2) { animation-delay: 0.1s; }
.order-card:nth-child(3) { animation-delay: 0.15s; }
.order-card:nth-child(4) { animation-delay: 0.2s; }
.order-card:nth-child(5) { animation-delay: 0.25s; }
.order-card:nth-child(6) { animation-delay: 0.3s; }
.order-card:nth-child(7) { animation-delay: 0.35s; }
.order-card:nth-child(8) { animation-delay: 0.4s; }

/* ===== RESPONSIVE ===== */
@media (max-width: 768px) {
    .navbar {
        padding: 0 20px;
        height: 64px;
    }
    .nav-brand {
        font-size: 16px;
        letter-spacing: 1px;
    }
    .nav-links {
        gap: 18px;
    }
    .nav-links a {
        font-size: 12px;
    }
    .container {
        padding: 32px 16px 48px;
    }
    .section-header h1 {
        font-size: 24px;
    }
    .order-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 8px;
        padding: 16px 20px;
    }
    .order-items {
        padding: 12px 20px;
    }
    .order-footer {
        flex-direction: column;
        gap: 12px;
        padding: 14px 20px;
        align-items: flex-start;
    }
}

@media (max-width: 480px) {
    .section-header h1 {
        font-size: 20px;
    }
    .total-amount {
        font-size: 18px;
    }
    .nav-links a span {
        display: none;
    }
}
</style>
</head>
<body>

    <!-- NAVBAR -->
    <div class="navbar">
        <a href="<%= request.getContextPath() %>/restaurants" class="nav-brand">
            <i class="fas fa-fire"></i> Foodie Hub
        </a>
        <div class="nav-links">
            <a href="<%= request.getContextPath() %>/restaurants"><i class="fas fa-home"></i> <span>Home</span></a>
            <a href="<%= request.getContextPath() %>/profile.jsp"><i class="fas fa-user"></i> <span>Profile</span></a>
            <a href="<%= request.getContextPath() %>/logout"><i class="fas fa-right-from-bracket"></i> <span>Logout</span></a>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <div class="container">

        <div class="section-header">
            <h1>My Past Orders</h1>
            <p>Track your delicious order history</p>
        </div>

        <% if (orderList == null || orderList.isEmpty()) { %>
            <div class="empty-state">
                <div class="empty-icon">📦</div>
                <h3>No orders yet</h3>
                <p>Hungry? Let's fix that! Explore our restaurants and place your first order.</p>
                <a href="<%= request.getContextPath() %>/restaurants" class="btn-primary"><i class="fas fa-utensils"></i> Explore Restaurants</a>
            </div>
        <% } else { %>
            
            <% for (Order order : orderList) { %>
                <div class="order-card">
                    <div class="order-header">
                        <div class="order-id"><i class="fas fa-receipt"></i> Order #<%= order.getId() %></div>
                        <div class="order-date"><i class="fas fa-calendar-alt"></i> <%= order.getOrderDate() %></div>
                    </div>
                    
                    <div class="order-items">
                        <% for (OrderItem item : order.getItems()) { %>
                            <div class="item-row">
                                <div class="item-name">
                                    <span class="item-qty"><%= item.getQuantity() %>x</span> <%= item.getItemName() %>
                                </div>
                                <div class="item-price">₹<%= String.format("%.2f", item.getPrice() * item.getQuantity()) %></div>
                            </div>
                        <% } %>
                    </div>
                    
                    <div class="order-footer">
                        <div class="payment-pill"><i class="fas fa-credit-card"></i> <%= order.getPaymentType() %></div>
                        <div class="total-amount">Total: ₹<%= String.format("%.2f", order.getTotalAmount()) %></div>
                    </div>
                </div>
            <% } %>
            
        <% } %>
    </div>

</body>
</html>
