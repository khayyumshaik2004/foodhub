<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.food.model.Restaurant" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Foodie Hub</title>

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

.nav-cta {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 10px 24px;
    background: transparent;
    color: var(--danger);
    border: 2px solid rgba(255,71,87,0.4);
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

.nav-cta:hover {
    background: rgba(255,71,87,0.1);
    border-color: var(--danger);
    transform: translateY(-2px);
}

/* SECTION HEADER */
.section-header {
    text-align: center;
    margin: 56px auto 48px;
    position: relative;
    z-index: 1;
    animation: fadeInUp 0.6s ease-out;
}

.section-header h2 {
    font-family: var(--font-display);
    font-size: 36px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 3px;
    color: var(--text-primary);
    margin-bottom: 12px;
}

.section-header h2 span {
    background: var(--gradient-hero);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
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

/* GRID */
.restaurant-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
    gap: 30px;
    padding: 0 48px 60px;
    max-width: 1400px;
    margin: 0 auto;
    position: relative;
    z-index: 1;
}

/* CARD */
.card-link {
    text-decoration: none;
    color: inherit;
    display: block;
}

.card {
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-lg);
    overflow: hidden;
    transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    opacity: 0;
    animation: fadeInUp 0.6s ease-out forwards;
}

.card:hover {
    transform: translateY(-6px);
    border-color: var(--border-medium);
    box-shadow: var(--shadow-lg), 0 0 40px rgba(255,107,53,0.04);
}

/* Staggered animation */
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

.card-img-wrapper {
    overflow: hidden;
    position: relative;
}

.card-img-wrapper img {
    width: 100%;
    aspect-ratio: 3/2;
    object-fit: cover;
    transition: transform 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    display: block;
}

.card:hover .card-img-wrapper img {
    transform: scale(1.08);
}

.card-body {
    padding: 22px 24px 24px;
}

.restaurant-name {
    font-family: var(--font-display);
    font-size: 18px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    color: var(--text-primary);
    margin-bottom: 10px;
}

.cuisine-badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 5px 14px;
    background: rgba(255,107,53,0.1);
    border: 1px solid rgba(255,107,53,0.2);
    border-radius: var(--radius-pill);
    font-size: 12px;
    font-weight: 600;
    color: var(--accent);
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin-bottom: 14px;
}

.cuisine-badge i {
    font-size: 11px;
}

.card-meta {
    display: flex;
    flex-direction: column;
    gap: 8px;
    margin-bottom: 16px;
}

.meta-item {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 13px;
    color: var(--text-secondary);
}

.meta-item i {
    width: 16px;
    text-align: center;
    font-size: 12px;
}

.meta-item.rating i {
    color: var(--accent-secondary);
}

.meta-item.eta i {
    color: var(--accent);
}

.meta-item.address i {
    color: var(--text-muted);
}

.meta-item.address {
    color: var(--text-muted);
    font-size: 12px;
    line-height: 1.5;
}

.rating-value {
    font-weight: 600;
    color: var(--accent-secondary);
}

.view-menu-btn {
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
    text-decoration: none;
    margin-top: 4px;
}

.view-menu-btn:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-accent);
}

/* EMPTY STATE */
.empty-state {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 50vh;
    position: relative;
    z-index: 1;
    padding: 40px;
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
    font-size: 22px;
    font-weight: 700;
    text-transform: uppercase;
    color: var(--text-primary);
    margin-bottom: 8px;
}

.empty-card p {
    color: var(--text-muted);
    font-size: 14px;
}

/* FOOTER */
.footer {
    background: var(--surface-1);
    border-top: 1px solid var(--border-subtle);
    color: var(--text-muted);
    text-align: center;
    padding: 24px;
    font-size: 14px;
    position: relative;
    z-index: 1;
}

.footer span {
    background: var(--gradient-hero);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    font-weight: 700;
}

/* RESPONSIVE */
@media (max-width: 1200px) {
    .restaurant-grid {
        padding: 0 32px 60px;
    }
    .navbar {
        padding: 0 32px;
    }
}

@media (max-width: 992px) {
    .restaurant-grid {
        grid-template-columns: repeat(2, 1fr);
        gap: 24px;
    }
    .section-header h2 {
        font-size: 28px;
    }
}

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
    .restaurant-grid {
        grid-template-columns: 1fr;
        padding: 0 20px 40px;
        gap: 20px;
    }
    .section-header {
        margin: 40px auto 32px;
    }
    .section-header h2 {
        font-size: 24px;
        letter-spacing: 2px;
    }
    .section-header p {
        font-size: 14px;
        padding: 0 20px;
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
    .nav-brand i {
        font-size: 18px;
    }
    .nav-links {
        gap: 12px;
    }
    .nav-links a {
        font-size: 11px;
        letter-spacing: 0.5px;
    }
    .nav-cta {
        padding: 8px 16px;
        font-size: 11px;
    }
    .section-header h2 {
        font-size: 20px;
    }
}

</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar">

    <a href="<%= request.getContextPath() %>/restaurants" class="nav-brand">
        <i class="fa-solid fa-utensils"></i> Foodie Hub
    </a>

    <div class="nav-links">
        <a href="<%= request.getContextPath() %>/restaurants" class="active"><i class="fa-solid fa-home"></i> Home</a>
        <a href="<%= request.getContextPath() %>/profile.jsp"><i class="fa-solid fa-user"></i> Profile</a>
    </div>

    <a href="<%= request.getContextPath() %>/logout" class="nav-cta">
        <i class="fa-solid fa-right-from-bracket"></i> Logout
    </a>

</nav>

<!-- SECTION HEADER -->
<div class="section-header">
    <h2>Choose & <span>Enjoy</span></h2>
    <p>Inspired by the best restaurants — discover your next favorite meal</p>
</div>

<%
List<Restaurant> list=(List<Restaurant>)request.getAttribute("restaurantList");

if(list == null || list.isEmpty()){
%>

<div class="empty-state">
    <div class="empty-card">
        <div class="empty-icon"><i class="fa-solid fa-store"></i></div>
        <h3>No Restaurants Found</h3>
        <p>We couldn't find any restaurants right now. Please check back later.</p>
    </div>
</div>

<%
} else {
%>

<div class="restaurant-grid">

<%
for(Restaurant r:list){
%>
<a href="menu?id=<%= r.getId() %>" class="card-link">
<div class="card">

    <div class="card-img-wrapper">
        <img src="image/<%=r.getImage()%>" alt="<%= r.getName() %>">
    </div>

    <div class="card-body">

        <div class="restaurant-name">
            <%=r.getName()%>
        </div>

        <div class="cuisine-badge">
            <i class="fa-solid fa-utensils"></i> <%=r.getCuisine()%>
        </div>

        <div class="card-meta">
            <div class="meta-item rating">
                <i class="fa-solid fa-star"></i>
                <span class="rating-value"><%=r.getRating()%></span>
            </div>
            <div class="meta-item address">
                <i class="fa-solid fa-map-pin"></i>
                <span><%=r.getAddress()%></span>
            </div>
        </div>

        <div class="view-menu-btn">
            <i class="fa-solid fa-utensils"></i> View Menu
        </div>

    </div>
</div>
</a>
<% } %>

</div>

<% } %>

<!-- FOOTER -->
<div class="footer">
    &copy; 2026 <span>Foodie Hub</span>. All rights reserved. Made with &#10084;&#65039;
</div>

</body>
</html>