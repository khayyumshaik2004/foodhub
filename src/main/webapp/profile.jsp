<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.food.model.User" %>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Profile | Foodie Hub</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
:root {
    --bg-primary: #0f0f1b;
    --surface-1: #161625;
    --surface-2: #1c1c30;
    --border-subtle: rgba(255,255,255,0.06);
    --border-medium: rgba(255,255,255,0.12);
    --accent: #ff6b35;
    --accent-hover: #ff8c5a;
    --gradient-accent: linear-gradient(135deg, #ff6b35, #ff8c5a);
    --text-primary: #f0f0f0;
    --text-secondary: #a0a0b0;
    --font-display: 'Montserrat', sans-serif;
    --font-body: 'Inter', sans-serif;
    --radius-xl: 24px;
    --radius-pill: 50px;
}
* { margin: 0; padding: 0; box-sizing: border-box; }
body {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: var(--bg-primary);
    font-family: var(--font-body);
    padding: 20px;
}
.profile-card {
    width: 480px;
    max-width: 100%;
    padding: 48px;
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-xl);
    text-align: center;
}
.avatar-wrapper {
    width: 100px;
    height: 100px;
    margin: 0 auto 24px;
}
.avatar {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    background: var(--gradient-accent);
    color: white;
    font-family: var(--font-display);
    font-size: 40px;
    font-weight: 800;
    display: flex;
    justify-content: center;
    align-items: center;
}
h2 {
    font-family: var(--font-display);
    color: var(--text-primary);
    font-size: 28px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
    margin-bottom: 8px;
}
.subtitle {
    color: var(--text-secondary);
    margin-bottom: 32px;
    font-size: 14px;
}
.info-section {
    background: var(--surface-2);
    border-radius: 16px;
    border: 1px solid var(--border-subtle);
    overflow: hidden;
    margin-bottom: 32px;
}
.info-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 16px 20px;
    border-bottom: 1px solid var(--border-subtle);
}
.info-row:last-child {
    border-bottom: none;
}
.label {
    font-weight: 600;
    color: var(--text-secondary);
    font-size: 13px;
    text-transform: uppercase;
    letter-spacing: 1px;
    display: flex;
    align-items: center;
    gap: 10px;
}
.label i {
    color: var(--accent);
    width: 16px;
    text-align: center;
}
.value {
    color: var(--text-primary);
    font-weight: 500;
    font-size: 15px;
}
.btn-box {
    display: flex;
    gap: 12px;
    justify-content: center;
    flex-wrap: wrap;
}
.btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 12px 24px;
    text-decoration: none;
    border-radius: var(--radius-pill);
    font-family: var(--font-display);
    font-size: 13px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
    transition: all 0.3s ease;
}
.home-btn {
    background: var(--gradient-accent);
    color: white;
}
.orders-btn {
    background: #00c853;
    color: white;
}
.logout-btn {
    border: 1px solid var(--border-medium);
    color: var(--text-primary);
    background: var(--surface-2);
}
.logout-btn:hover {
    background: var(--surface-3);
}
</style>
</head>
<body>
<div class="profile-card">
    <div class="avatar-wrapper">
        <div class="avatar">
            <%= user.getName().substring(0,1).toUpperCase() %>
        </div>
    </div>
    <h2><%= user.getName() %></h2>
    <p class="subtitle">Your account details</p>
    <div class="info-section">
        <div class="info-row">
            <span class="label"><i class="fa-solid fa-envelope"></i> Email</span>
            <span class="value"><%= user.getEmail() %></span>
        </div>
        <div class="info-row">
            <span class="label"><i class="fa-solid fa-phone"></i> Phone</span>
            <span class="value"><%= user.getPhone() %></span>
        </div>
        <div class="info-row">
            <span class="label"><i class="fa-solid fa-venus-mars"></i> Gender</span>
            <span class="value"><%= user.getGender() %></span>
        </div>
    </div>
    <div class="btn-box">
        <a href="<%= request.getContextPath() %>/restaurants" class="btn home-btn"><i class="fa-solid fa-house"></i> Home</a>
        <a href="<%= request.getContextPath() %>/orders" class="btn orders-btn"><i class="fa-solid fa-box"></i> Orders</a>
        <a href="<%= request.getContextPath() %>/logout" class="btn logout-btn"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>
</div>
</body>
</html>
