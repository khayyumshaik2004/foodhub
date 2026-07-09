<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.food.model.Cart" %>
<%@ page import="com.food.model.CartItem" %>
<%@ page import="com.food.model.User" %>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}

Cart cart = (Cart) session.getAttribute("cart");
double grandTotal = 0;
if(cart != null){
    grandTotal = cart.getGrandTotal();
}
double finalTotal = grandTotal + 50;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
:root {
    --bg-primary: #0f0f1b;
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
    --danger: #ff4757;
    --font-display: 'Montserrat', sans-serif;
    --font-body: 'Inter', sans-serif;
    --radius-md: 12px;
    --radius-lg: 20px;
    --radius-xl: 24px;
    --radius-pill: 50px;
}
* { margin: 0; padding: 0; box-sizing: border-box; }
body {
    background: var(--bg-primary);
    color: var(--text-primary);
    font-family: var(--font-body);
    min-height: 100vh;
}
.navbar {
    position: sticky;
    top: 0;
    z-index: 100;
    background: var(--surface-1);
    border-bottom: 1px solid var(--border-subtle);
    padding: 16px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.logo {
    font-family: var(--font-display);
    font-size: 24px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
    background: var(--gradient-hero);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}
.nav-links {
    display: flex;
    gap: 8px;
}
.nav-links a {
    color: var(--text-secondary);
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
    padding: 10px 20px;
    border-radius: var(--radius-pill);
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 8px;
    text-transform: uppercase;
    letter-spacing: 1px;
}
.nav-links a:hover {
    color: var(--text-primary);
    background: var(--surface-2);
}
.container {
    width: 90%;
    max-width: 1200px;
    margin: 40px auto;
    display: flex;
    gap: 30px;
}
.left { flex: 2; }
.right { flex: 1; }
.card {
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-xl);
    padding: 32px;
    margin-bottom: 24px;
}
.card h2 {
    font-family: var(--font-display);
    font-weight: 800;
    font-size: 20px;
    color: var(--text-primary);
    margin-bottom: 24px;
    text-transform: uppercase;
    letter-spacing: 1px;
    display: flex;
    align-items: center;
    gap: 12px;
}
.card h2 i { color: var(--accent); }
.input-box {
    width: 100%;
    padding: 16px;
    background: var(--surface-2);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-md);
    color: var(--text-primary);
    font-family: var(--font-body);
    font-size: 15px;
    outline: none;
    margin-bottom: 16px;
    transition: all 0.3s ease;
}
.input-box:focus { border-color: var(--accent); }
textarea.input-box { resize: none; }
.payment-option {
    border: 1px solid var(--border-subtle);
    background: var(--surface-2);
    padding: 18px 20px;
    border-radius: var(--radius-md);
    margin-bottom: 12px;
    display: flex;
    align-items: center;
    gap: 16px;
    cursor: pointer;
}
.payment-option:hover {
    border-color: var(--border-medium);
    background: var(--surface-3);
}
.payment-option input[type="radio"] {
    width: 20px;
    height: 20px;
    accent-color: var(--accent);
    cursor: pointer;
}
.payment-option:has(input[type="radio"]:checked) {
    border-color: var(--accent);
    background: rgba(255,107,53,0.05);
}
.payment-option label {
    cursor: pointer;
    font-size: 15px;
    font-weight: 500;
    color: var(--text-primary);
    display: flex;
    align-items: center;
    gap: 12px;
    width: 100%;
}
.payment-option label i {
    font-size: 18px;
    color: var(--accent-secondary);
    width: 24px;
}
.scanner {
    display: none;
    text-align: center;
    margin-top: 20px;
    padding: 24px;
    background: var(--surface-2);
    border-radius: var(--radius-md);
    border: 1px solid var(--border-subtle);
}
.scanner img {
    width: 200px;
    height: 200px;
    border-radius: 12px;
    border: 2px solid var(--accent);
}
.scanner h3 {
    font-family: var(--font-display);
    text-transform: uppercase;
    font-size: 16px;
    color: var(--accent-secondary);
    margin-bottom: 16px;
}
.bill-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 16px;
    font-size: 14px;
    color: var(--text-secondary);
}
.bill-row span:last-child {
    font-weight: 500;
    color: var(--text-primary);
}
.bill-divider {
    border: none;
    border-top: 1px solid var(--border-subtle);
    margin: 20px 0;
}
.total-row {
    display: flex;
    justify-content: space-between;
    padding: 16px 20px;
    background: var(--surface-2);
    border-radius: var(--radius-md);
    border: 1px solid var(--border-medium);
}
.total-row span {
    font-family: var(--font-display);
    font-size: 20px;
    font-weight: 800;
}
.total-row span:last-child { color: var(--accent); }
.place-btn {
    width: 100%;
    background: var(--gradient-accent);
    color: white;
    border: none;
    padding: 16px;
    border-radius: var(--radius-pill);
    font-family: var(--font-display);
    font-size: 15px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    cursor: pointer;
    margin-top: 24px;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
}
.place-btn:hover { transform: translateY(-2px); }
@media (max-width: 992px) {
    .container { flex-direction: column; }
}
</style>
</head>
<body>
<div class="navbar">
    <div class="logo">Foodie Hub</div>
    <div class="nav-links">
        <a href="restaurants"><i class="fa-solid fa-house"></i> <span>Home</span></a>
        <a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i> <span>Cart</span></a>
    </div>
</div>
<form action="placeOrder" method="post">
<div class="container">
    <div class="left">
        <div class="card">
            <h2><i class="fa-solid fa-location-dot"></i> Delivery Details</h2>
            <input type="text" name="customerName" class="input-box" placeholder="Enter Full Name" required>
            <input type="text" name="mobile" class="input-box" placeholder="Enter Mobile Number" required>
            <textarea rows="4" name="address" class="input-box" placeholder="Enter Delivery Address" required></textarea>
        </div>
        <div class="card">
            <h2><i class="fa-solid fa-credit-card"></i> Payment Method</h2>
            <div class="payment-option">
                <input type="radio" name="payment" value="COD" id="pay-cod" required>
                <label for="pay-cod"><i class="fa-solid fa-money-bill-wave"></i> Cash On Delivery</label>
            </div>
            <div class="payment-option">
                <input type="radio" name="payment" value="UPI" id="pay-upi">
                <label for="pay-upi"><i class="fa-solid fa-mobile-screen-button"></i> UPI Scanner Payment</label>
            </div>
            <div class="payment-option">
                <input type="radio" name="payment" value="CARD" id="pay-card">
                <label for="pay-card"><i class="fa-solid fa-credit-card"></i> Credit / Debit Card</label>
            </div>
            <div class="scanner" id="scanner">
                <h3><i class="fa-solid fa-qrcode"></i> Scan & Pay</h3>
                <img src="image/paymentOR.png">
                <p style="margin-top: 16px; color: var(--text-secondary); font-size: 13px;">Scan using Google Pay, PhonePe or Paytm</p>
            </div>
        </div>
    </div>
    <div class="right">
        <div class="card">
            <h2><i class="fa-solid fa-receipt"></i> Bill Details</h2>
            <%
            if(cart != null){
                for(CartItem item : cart.getItems().values()){
            %>
            <div class="bill-row">
                <span><%= item.getItemName() %> x <%= item.getQuantity() %></span>
                <span>₹<%= item.getPrice() * item.getQuantity() %></span>
            </div>
            <%
                }
            }
            %>
            <hr class="bill-divider">
            <div class="bill-row">
                <span>Item Total</span>
                <span>₹<%= grandTotal %></span>
            </div>
            <div class="bill-row">
                <span>Delivery Fee</span>
                <span>₹40</span>
            </div>
            <div class="bill-row">
                <span>Platform Fee</span>
                <span>₹10</span>
            </div>
            <hr class="bill-divider">
            <div class="total-row">
                <span>To Pay</span>
                <span>₹<%= finalTotal %></span>
            </div>
            <input type="hidden" name="totalAmount" value="<%= finalTotal %>">
            <button type="submit" class="place-btn">
                <i class="fa-solid fa-bag-shopping"></i> Place Order
            </button>
        </div>
    </div>
</div>
</form>
<script>
const paymentOptions = document.getElementsByName("payment");
const scanner = document.getElementById("scanner");
paymentOptions.forEach(function(option){
    option.addEventListener("change", function(){
        if(this.value === "UPI"){
            scanner.style.display = "block";
        } else {
            scanner.style.display = "none";
        }
    });
});
</script>
</body>
</html>