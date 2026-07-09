<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.food.model.Menu" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Restaurant Menu</title>

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
}

.cart-pill {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 10px 24px;
    background: transparent;
    color: var(--accent);
    border: 2px solid rgba(255,107,53,0.4);
    border-radius: var(--radius-pill);
    font-family: var(--font-display);
    font-size: 13px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
    cursor: pointer;
    transition: all 0.3s ease;
    text-decoration: none;
}

.cart-pill:hover {
    background: rgba(255,107,53,0.1);
    border-color: var(--accent);
    transform: translateY(-2px);
}

.cart-pill i {
    font-size: 15px;
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

/* FOOD GRID */
.food-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 28px;
    padding: 0 48px 60px;
    max-width: 1400px;
    margin: 0 auto;
    position: relative;
    z-index: 1;
}

/* CARD */
.card {
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-lg);
    overflow: hidden;
    transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    opacity: 0;
    animation: fadeInUp 0.6s ease-out forwards;
    display: flex;
    flex-direction: column;
}

.card:hover {
    transform: translateY(-6px);
    border-color: var(--border-medium);
    box-shadow: var(--shadow-lg), 0 0 40px rgba(255,107,53,0.04);
}

/* Staggered */
.card:nth-child(1) { animation-delay: 0.05s; }
.card:nth-child(2) { animation-delay: 0.10s; }
.card:nth-child(3) { animation-delay: 0.15s; }
.card:nth-child(4) { animation-delay: 0.20s; }
.card:nth-child(5) { animation-delay: 0.25s; }
.card:nth-child(6) { animation-delay: 0.30s; }
.card:nth-child(7) { animation-delay: 0.35s; }
.card:nth-child(8) { animation-delay: 0.40s; }
.card:nth-child(9) { animation-delay: 0.45s; }
.card:nth-child(10) { animation-delay: 0.50s; }
.card:nth-child(11) { animation-delay: 0.55s; }
.card:nth-child(12) { animation-delay: 0.60s; }

.card-img-wrap {
    overflow: hidden;
    position: relative;
}

.card-img-wrap img {
    width: 100%;
    aspect-ratio: 4/3;
    object-fit: cover;
    display: block;
    transition: transform 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.card:hover .card-img-wrap img {
    transform: scale(1.08);
}

.card-content {
    padding: 20px 22px 24px;
    flex: 1;
    display: flex;
    flex-direction: column;
}

.item-name {
    font-family: var(--font-display);
    font-size: 17px;
    font-weight: 700;
    color: var(--text-primary);
    margin-bottom: 8px;
}

.category-badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 4px 12px;
    background: rgba(255,107,53,0.1);
    border: 1px solid rgba(255,107,53,0.2);
    border-radius: var(--radius-pill);
    font-size: 11px;
    font-weight: 600;
    color: var(--accent);
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin-bottom: 12px;
    width: fit-content;
}

.category-badge i {
    font-size: 10px;
}

.item-price {
    font-family: var(--font-display);
    font-size: 22px;
    font-weight: 800;
    color: var(--accent-secondary);
    margin-bottom: 6px;
}

.item-rating {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 14px;
    color: var(--accent-secondary);
    margin-bottom: 8px;
}

.item-rating i {
    font-size: 13px;
}

.item-description {
    font-size: 13px;
    color: var(--text-muted);
    line-height: 1.6;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    margin-bottom: 16px;
    flex: 1;
}

.btn-add-cart {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    width: 100%;
    padding: 12px 24px;
    background: var(--gradient-accent);
    color: white;
    border: none;
    border-radius: var(--radius-pill);
    font-family: var(--font-display);
    font-size: 13px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: auto;
}

.btn-add-cart:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-accent);
}

/* EMPTY STATE */
.empty-state {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 60vh;
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
    font-weight: 700;
    font-size: 22px;
    text-transform: uppercase;
    color: var(--text-primary);
    margin-bottom: 8px;
}

.empty-card p {
    font-size: 14px;
    color: var(--text-muted);
}

/* RESPONSIVE */
@media (max-width: 992px) {
    .food-grid {
        grid-template-columns: repeat(2, 1fr);
        padding: 0 32px 60px;
    }
}

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
    .food-grid {
        grid-template-columns: 1fr;
        padding: 0 20px 40px;
        gap: 20px;
    }
    .section-header {
        margin: 36px auto 28px;
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
    .cart-pill {
        padding: 8px 16px;
        font-size: 11px;
    }
    .cart-pill span {
        display: none;
    }
    .section-header h2 {
        font-size: 20px;
    }
}

</style>

</head>

<body>

<nav class="navbar">
    <a href="restaurants" class="nav-brand">
        <i class="fa-solid fa-utensils"></i> Foodie Hub
    </a>
    <div class="nav-center-title">Restaurant Menu</div>
    <a class="cart-pill" href="cart.jsp">
        <i class="fa-solid fa-cart-shopping"></i>
        <span>Cart</span>
    </a>
</nav>

<%
List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
%>

<%
if(menuList == null || menuList.isEmpty()){
%>

<div class="empty-state">
    <div class="empty-card">
        <div class="empty-icon"><i class="fa-solid fa-utensils"></i></div>
        <h3>No Menu Items Found</h3>
        <p>This restaurant hasn't added any items yet.</p>
    </div>
</div>

<%
} else {
%>

<div class="section-header">
    <h2>Our Menu</h2>
    <p>Discover delicious dishes crafted with care</p>
</div>

<div class="food-grid">

<%
    for(Menu m : menuList){
%>
  <div class="card">

    <div class="card-img-wrap">
        <img src="image/<%= m.getImage() %>" alt="<%= m.getItemName() %>">
    </div>

    <div class="card-content">
  
     <div class="item-name">
            <%= m.getItemName() %>
        </div>

        <div class="category-badge">
            <i class="fa-solid fa-utensils"></i> <%= m.getCategory() %>
        </div>

        <div class="item-price">
            &#8377; <%= m.getPrice() %>
        </div>

        <div class="item-rating">
            <i class="fa-solid fa-star"></i> <%= m.getRating() %>
        </div>

        <div class="item-description">
            <%= m.getDescription() %>
        </div>

        <form action="cart" method="post">

    <input type="hidden"
           name="action"
           value="add">

    <input type="hidden"
           name="menuId"
           value="<%=m.getId()%>">

    <input type="hidden"
           name="restaurantId"
           value="<%=m.getRestaurantId()%>">

    <input type="hidden"
           name="itemName"
           value="<%=m.getItemName()%>">

    <input type="hidden"
           name="price"
           value="<%=m.getPrice()%>">

    <button type="submit" class="btn-add-cart">
        <i class="fa-solid fa-cart-plus"></i> Add to Cart
    </button>

</form>

        
        </div>

</div>


<%
    }
}
%>

</div>

</body>
</html>