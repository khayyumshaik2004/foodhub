// ==========================================================================
// Foodie Hub - Interactive Web Application Engine
// ==========================================================================

const RESTAURANTS = [
  {
    id: 1,
    name: "Burger Express",
    cuisine: "Burgers, Fast Food, Snacks",
    address: "12 Main Street, Downtown",
    rating: 4.3,
    image: "image/r1.jpg",
    deliveryTime: "25-30 min",
    priceForTwo: "₹350",
    tags: ["Burgers", "Snacks", "Beverages"]
  },
  {
    id: 2,
    name: "Pizza Palace",
    cuisine: "Pizza, Italian, Desserts",
    address: "88 High Street, Midtown",
    rating: 4.1,
    image: "image/r2.jpg",
    deliveryTime: "30-35 min",
    priceForTwo: "₹500",
    tags: ["Pizza", "Desserts", "Italian"]
  },
  {
    id: 3,
    name: "Crispy Fried Chicken",
    cuisine: "Fried Chicken, Fast Food, Burgers",
    address: "45 Park Avenue, Uptown",
    rating: 4.2,
    image: "image/r3.jpg",
    deliveryTime: "20-25 min",
    priceForTwo: "₹450",
    tags: ["Burgers", "Fast Food", "Snacks"]
  },
  {
    id: 4,
    name: "Subway Delights",
    cuisine: "Sandwiches, Healthy, North Indian",
    address: "59 Metro Plaza, Westside",
    rating: 4.0,
    image: "image/r4.jpg",
    deliveryTime: "25-30 min",
    priceForTwo: "₹400",
    tags: ["Healthy", "Mains", "Breads"]
  },
  {
    id: 5,
    name: "Dominos Express",
    cuisine: "Pizza, Fast Food, South Indian",
    address: "102 Station Road, Eastside",
    rating: 4.4,
    image: "image/r5.jpg",
    deliveryTime: "30 min",
    priceForTwo: "₹450",
    tags: ["Pizza", "Fast Food", "Starters"]
  },
  {
    id: 6,
    name: "Star Cafe",
    cuisine: "Coffee, Desserts, Kebabs",
    address: "33 City Center Mall",
    rating: 4.5,
    image: "image/r6.jpg",
    deliveryTime: "20 min",
    priceForTwo: "₹300",
    tags: ["Beverages", "Desserts", "Starters"]
  },
  {
    id: 7,
    name: "Golden Burger",
    cuisine: "Burgers, Fast Food, Royal Mughlai",
    address: "72 Ring Road, Southside",
    rating: 4.2,
    image: "image/r7.jpg",
    deliveryTime: "25-35 min",
    priceForTwo: "₹400",
    tags: ["Burgers", "Mains", "Desserts"]
  },
  {
    id: 8,
    name: "Ice Cream Haven & Chaat",
    cuisine: "Street Food, Chaat, Desserts",
    address: "15 Sector Road, Northside",
    rating: 4.6,
    image: "image/r8.jpg",
    deliveryTime: "15-20 min",
    priceForTwo: "₹200",
    tags: ["Starters", "Desserts", "Street Food"]
  },
  {
    id: 9,
    name: "Chinese Wok & Thalis",
    cuisine: "Chinese, Asian, Maharaja Thali",
    address: "Food Court, Forum Mall",
    rating: 3.9,
    image: "image/r9.jpg",
    deliveryTime: "35-40 min",
    priceForTwo: "₹550",
    tags: ["Mains", "Beverages", "Desserts"]
  },
  {
    id: 10,
    name: "Taj Biryani House",
    cuisine: "Biryani, Indian, Mughlai Mains",
    address: "99 Grand Trunk Road",
    rating: 4.5,
    image: "image/r10.jpg",
    deliveryTime: "30-40 min",
    priceForTwo: "₹600",
    tags: ["Mains", "Burgers", "Starters"]
  },
  {
    id: 11,
    name: "Beverage Boulevard",
    cuisine: "Beverages, Coffee, Healthy Salads",
    address: "High Street Crossing",
    rating: 3.8,
    image: "image/r11.jpg",
    deliveryTime: "15-25 min",
    priceForTwo: "₹350",
    tags: ["Beverages", "Healthy", "Starters"]
  }
];

const MENUS = {
  1: [
    { id: 101, name: "Chicken Whopper Burger", price: 189, category: "Burgers", image: "image/chickenwhopper.jpg", rating: 4.5, desc: "Flame-grilled chicken patty with crunchy onions, fresh tomatoes, lettuce and creamy mayo on toasted sesame bun." },
    { id: 102, name: "Crispy Veg Whopper", price: 149, category: "Burgers", image: "image/vegwhopper.jpg", rating: 4.2, desc: "Crispy golden vegetable patty topped with shredded lettuce, pickles, and chef's signature sauce." },
    { id: 103, name: "Golden Chicken Nuggets (9 Pcs)", price: 129, category: "Snacks", image: "image/nuggets.jpg", rating: 4.0, desc: "Crisp and juicy tender chicken bites fried to perfection, served with spicy garlic dip." },
    { id: 104, name: "Salted French Fries (Large)", price: 99, category: "Snacks", image: "image/french.jpg", rating: 4.1, desc: "Classic golden cut potato fries, lightly sprinkled with sea salt." },
    { id: 105, name: "Chilled Coca Cola Can", price: 60, category: "Beverages", image: "image/coke.jpg", rating: 4.5, desc: "330ml ice cold refreshing soda can." }
  ],
  2: [
    { id: 201, name: "Classic Margherita Pizza", price: 249, category: "Pizza", image: "image/margherita.jpg", rating: 4.5, desc: "Fresh mozzarella cheese with San Marzano tomato sauce and fresh fragrant basil leaves." },
    { id: 202, name: "Peppy Paneer Pizza", price: 349, category: "Pizza", image: "image/peppi.jpg", rating: 4.7, desc: "Juicy marinated paneer cubes, crisp capsicum and spicy red paprika on cheese burst crust." },
    { id: 203, name: "Stuffed Garlic Breadsticks", price: 149, category: "Starters", image: "image/garlic.jpg", rating: 4.3, desc: "Fresh oven-baked breadsticks brushed with melted garlic butter, filled with sweet corn and cheese." },
    { id: 204, name: "Choco Lava Cake", price: 99, category: "Desserts", image: "image/lava.jpg", rating: 4.8, desc: "Warm chocolate sponge cake filled with a decadent molten liquid chocolate center." }
  ],
  3: [
    { id: 301, name: "Crispy Chicken Whopper", price: 249, category: "Burgers", image: "image/chickenwhopper.jpg", rating: 4.5, desc: "Extra crispy breaded fried chicken breast fillet with spicy peri-peri mayo." },
    { id: 302, name: "Chicken Royale Meal", price: 229, category: "Burgers", image: "image/vegwhopper.jpg", rating: 4.4, desc: "Crispy seasoned patty with green iceberg lettuce and garlic mayo." },
    { id: 303, name: "Crinkle Cut Fries", price: 119, category: "Snacks", image: "image/french.jpg", rating: 4.6, desc: "Golden crinkled fries dusted with secret smoked paprika seasoning." },
    { id: 304, name: "Thick Chocolate Shake", price: 179, category: "Beverages", image: "image/chocolate.jpg", rating: 4.3, desc: "Rich and creamy Belgian chocolate milkshake crowned with whipped cream." }
  ],
  4: [
    { id: 401, name: "Rich Butter Chicken", price: 299, category: "Mains", image: "image/butter.jpg", rating: 4.8, desc: "Smoky boneless tandoori chicken simmered in creamy butter and tomato gravy." },
    { id: 402, name: "Paneer Tikka Masala", price: 249, category: "Mains", image: "image/masala.jpg", rating: 4.6, desc: "Grilled cottage cheese cubes in spiced onion-tomato curry." },
    { id: 403, name: "Slow Cooked Dal Makhani", price: 199, category: "Mains", image: "image/dal.jpg", rating: 4.7, desc: "Simmered black lentils blended with dairy butter, whole spices and cream." },
    { id: 404, name: "Garlic Butter Naan", price: 49, category: "Breads", image: "image/roti.jpg", rating: 4.5, desc: "Soft leavened tandoor bread brushed with butter and minced garlic." }
  ],
  5: [
    { id: 501, name: "Crispy Masala Dosa", price: 149, category: "Mains", image: "image/masala.jpg", rating: 4.7, desc: "Golden thin fermented crepe with spiced potato filling, coconut chutney and hot sambar." },
    { id: 502, name: "Fluffy Idli Sambar (4 Pcs)", price: 99, category: "Starters", image: "image/dal.jpg", rating: 4.5, desc: "Steamed fluffy rice cakes soaked in aromatic drumstick vegetable sambar." },
    { id: 503, name: "Crispy Medu Vada (2 Pcs)", price: 109, category: "Starters", image: "image/nuggets.jpg", rating: 4.4, desc: "Deep fried lentil savory donuts with crispy exterior and airy center." },
    { id: 504, name: "South Indian Filter Coffee", price: 59, category: "Beverages", image: "image/coke.jpg", rating: 4.9, desc: "Authentic chicory blended decoction frothed with boiled milk." }
  ],
  6: [
    { id: 601, name: "Tandoori Chicken Tikka", price: 289, category: "Starters", image: "image/chicken.jpg", rating: 4.7, desc: "Charcoal grilled boneless chicken marinated in hung curd and red chilies." },
    { id: 602, name: "Kashmiri Mutton Rogan Josh", price: 399, category: "Mains", image: "image/mutton_rogan_josh_1783008774180.png", rating: 4.9, desc: "Tender fall-apart mutton braised in Kashmiri chili, fennel seeds and ginger." },
    { id: 603, name: "Spiced Seekh Kebabs (4 Pcs)", price: 299, category: "Starters", image: "image/nuggets.jpg", rating: 4.6, desc: "Minced lamb infused with coriander and mint, skewered over charcoal." },
    { id: 604, name: "Cardamom Gulab Jamun", price: 120, category: "Desserts", image: "image/lava.jpg", rating: 4.8, desc: "Fried mawa dumplings steeped in warm saffron sugar syrup." }
  ],
  7: [
    { id: 701, name: "Shahi Paneer Korma", price: 249, category: "Mains", image: "image/shahi_paneer_1783008761364.png", rating: 4.6, desc: "Delicate paneer pieces simmered in cashew-nut cream gravy scented with green cardamom." },
    { id: 702, name: "Murgh Makhani Special", price: 349, category: "Mains", image: "image/murgh_makhani_1783008784396.png", rating: 4.7, desc: "Classic Old Delhi butter chicken in satin-smooth tomato puree." },
    { id: 703, name: "Royal Nawabi Biryani", price: 299, category: "Mains", image: "image/nawabi_biryani_1783008794437.png", rating: 4.8, desc: "Long-grain aged basmati rice cooked on dum with tender meat and saffron." },
    { id: 704, name: "Shahi Tukda Rabri", price: 149, category: "Desserts", image: "image/shahi_tukda_1783008815589.png", rating: 4.6, desc: "Crisp ghee-fried bread soaked in cardamom syrup and blanketed in thick rabri." }
  ],
  8: [
    { id: 801, name: "Kolkata Pani Puri (8 Pcs)", price: 49, category: "Starters", image: "image/pani_puri_1783008826694.png", rating: 4.8, desc: "Crispy hollow semolina puris served with chilled mint water and spicy potato filling." },
    { id: 802, name: "Delhi Aloo Tikki Chaat", price: 79, category: "Starters", image: "image/aloo_tikki_chaat_1783008875523.png", rating: 4.5, desc: "Pan-fried crisp potato cakes bathed in sweet tamarind and spicy mint chutneys." },
    { id: 803, name: "Butter Pav Bhaji (2 Pavs)", price: 120, category: "Mains", image: "image/pav_bhaji_1783008886428.png", rating: 4.7, desc: "Mashed spiced seasonal vegetables topped with a slab of butter and toasted buns." },
    { id: 804, name: "Mumbai Vada Pav", price: 30, category: "Starters", image: "image/vada_pav_1783008854804.png", rating: 4.6, desc: "Spiced potato batata vada tucked into soft pav with dry garlic coconut chutney." }
  ],
  9: [
    { id: 901, name: "Royal Maharaja Thali", price: 499, category: "Mains", image: "image/jeera.jpg", rating: 4.9, desc: "Grand feast featuring 3 curries, dal makhani, jeera rice, 2 breads, dessert and papad." },
    { id: 902, name: "Gujarati Kathiyawadi Thali", price: 299, category: "Mains", image: "image/dal.jpg", rating: 4.6, desc: "Sweet-savory seasonal vegetable, sweet dal, phulkas, steamed rice and sweet lassi." },
    { id: 903, name: "Amritsari Chole Bhature", price: 199, category: "Mains", image: "image/masala.jpg", rating: 4.7, desc: "Rich spicy dark chickpea curry paired with giant fluffy fried bhaturas and onions." },
    { id: 904, name: "Punjabi Sweet Lassi", price: 80, category: "Beverages", image: "image/coke.jpg", rating: 4.8, desc: "Thick hand-churned yogurt beverage topped with a dollop of fresh clotted cream." }
  ],
  10: [
    { id: 1001, name: "Classic Cheeseburger", price: 199, category: "Burgers", image: "image/vegwhopper.jpg", rating: 4.5, desc: "Grilled savory patty layered with cheddar cheese, tomato slices and dill pickle." },
    { id: 1002, name: "Spicy Fried Chicken Burger", price: 249, category: "Burgers", image: "image/chickenwhopper.jpg", rating: 4.6, desc: "Tender chicken dipped in hot marinade and fried crunchy, topped with spicy slaw." },
    { id: 1003, name: "Cheese Loaded Fries", price: 149, category: "Starters", image: "image/french.jpg", rating: 4.3, desc: "Crispy french fries drenched in hot cheddar sauce and chopped jalapeños." },
    { id: 1004, name: "Crispy Battered Onion Rings", price: 129, category: "Starters", image: "image/nuggets.jpg", rating: 4.4, desc: "Thick sweet onion rings dipped in tempura batter and fried extra crisp." }
  ],
  11: [
    { id: 1101, name: "Quinoa Superfood Bowl", price: 299, category: "Mains", image: "image/jeera.jpg", rating: 4.8, desc: "Protein-rich white quinoa, avocado slices, roasted chickpeas, cucumber and lemon tahini." },
    { id: 1102, name: "Avocado Sourdough Toast", price: 249, category: "Starters", image: "image/garlic.jpg", rating: 4.6, desc: "Crushed Hass avocado on toasted artisanal sourdough bread with cherry tomatoes." },
    { id: 1103, name: "Fresh Kale Caesar Salad", price: 279, category: "Salads", image: "image/veg.jpg", rating: 4.5, desc: "Crisp Tuscan kale ribbons tossed in creamy dressing with sourdough croutons." },
    { id: 1104, name: "Green Detox Smoothie", price: 199, category: "Beverages", image: "image/coke.jpg", rating: 4.7, desc: "Cold-pressed blend of baby spinach, green apple, cucumber and zesty ginger." }
  ]
};

// ==========================================================================
// Application State
// ==========================================================================
let currentRestaurant = null;
let activeCategoryFilter = "All";
let searchQuery = "";
let cart = JSON.parse(localStorage.getItem("foodiehub_cart") || "[]");
let selectedPaymentMethod = "UPI";

// DOM Elements
const restaurantGridEl = document.getElementById("restaurantGrid");
const menuModalEl = document.getElementById("menuViewModal");
const menuItemsGridEl = document.getElementById("menuItemsGrid");
const menuTabsBarEl = document.getElementById("menuTabsBar");
const cartDrawerEl = document.getElementById("cartDrawer");
const cartOverlayEl = document.getElementById("cartDrawerOverlay");
const cartItemsContainerEl = document.getElementById("cartItemsContainer");
const cartBadgeCountEl = document.getElementById("cartBadgeCount");
const cartBadgeTotalEl = document.getElementById("cartBadgeTotal");
const checkoutModalEl = document.getElementById("checkoutModal");
const orderSuccessModalEl = document.getElementById("orderSuccessModal");
const toastContainerEl = document.getElementById("toastContainer");

// ==========================================================================
// Initialization
// ==========================================================================
document.addEventListener("DOMContentLoaded", () => {
  renderRestaurants();
  updateCartBadge();
  setupEventListeners();
});

// ==========================================================================
// Render Restaurants
// ==========================================================================
function renderRestaurants() {
  const filtered = RESTAURANTS.filter(r => {
    const matchesCategory = activeCategoryFilter === "All" || r.tags.includes(activeCategoryFilter) || r.cuisine.toLowerCase().includes(activeCategoryFilter.toLowerCase());
    const matchesSearch = !searchQuery || r.name.toLowerCase().includes(searchQuery.toLowerCase()) || r.cuisine.toLowerCase().includes(searchQuery.toLowerCase());
    return matchesCategory && matchesSearch;
  });

  document.getElementById("restaurantCount").innerText = `${filtered.length} restaurants available`;

  if (filtered.length === 0) {
    restaurantGridEl.innerHTML = `
      <div style="grid-column: 1/-1; text-align: center; padding: 60px 20px;">
        <i class="fa-solid fa-utensils" style="font-size: 40px; color: var(--accent); margin-bottom: 16px;"></i>
        <h3 style="font-size: 20px; margin-bottom: 8px;">No restaurants match your search</h3>
        <p style="color: var(--text-muted); font-size: 14px;">Try searching for something else or clearing filters.</p>
      </div>
    `;
    return;
  }

  restaurantGridEl.innerHTML = filtered.map(r => `
    <div class="restaurant-card" onclick="openRestaurantMenu(${r.id})">
      <div class="card-thumb-wrap">
        <img src="${r.image}" alt="${r.name}" loading="lazy" onerror="this.src='image/r1.jpg'">
        <span class="badge-delivery-time"><i class="fa-solid fa-clock"></i> ${r.deliveryTime}</span>
      </div>
      <div class="card-content">
        <div class="card-top">
          <h4 class="card-title">${r.name}</h4>
          <span class="rating-chip"><i class="fa-solid fa-star"></i> ${r.rating}</span>
        </div>
        <div class="card-cuisine"><i class="fa-solid fa-bowl-food"></i> ${r.cuisine}</div>
        <div class="card-address"><i class="fa-solid fa-location-dot"></i> ${r.address}</div>
        <div class="card-action-bar">
          <span class="price-for-two">${r.priceForTwo} for two</span>
          <span class="btn-view-menu"><i class="fa-solid fa-book-open"></i> View Menu</span>
        </div>
      </div>
    </div>
  `).join("");
}

// ==========================================================================
// Open Restaurant Menu View
// ==========================================================================
function openRestaurantMenu(id) {
  const rest = RESTAURANTS.find(r => r.id === id);
  if (!rest) return;
  currentRestaurant = rest;

  document.getElementById("bannerName").innerText = rest.name;
  document.getElementById("bannerCuisine").innerText = rest.cuisine;
  document.getElementById("bannerAddress").innerText = rest.address;
  document.getElementById("bannerRating").innerText = rest.rating;
  document.getElementById("bannerTime").innerText = rest.deliveryTime;
  document.getElementById("bannerPrice").innerText = rest.priceForTwo;
  document.getElementById("bannerThumbImg").src = rest.image;

  // Categories
  const items = MENUS[id] || [];
  const categories = ["All", ...new Set(items.map(i => i.category))];

  menuTabsBarEl.innerHTML = categories.map((cat, idx) => `
    <button class="menu-tab-btn ${idx === 0 ? 'active' : ''}" onclick="filterMenuItems('${cat}', this)">${cat}</button>
  `).join("");

  renderMenuItems(items);

  menuModalEl.classList.add("active");
  document.body.style.overflow = "hidden";
}

function closeRestaurantMenu() {
  menuModalEl.classList.remove("active");
  document.body.style.overflow = "";
}

function filterMenuItems(category, tabBtn) {
  document.querySelectorAll(".menu-tab-btn").forEach(btn => btn.classList.remove("active"));
  if (tabBtn) tabBtn.classList.add("active");

  const items = MENUS[currentRestaurant.id] || [];
  const filtered = category === "All" ? items : items.filter(i => i.category === category);
  renderMenuItems(filtered);
}

function renderMenuItems(items) {
  if (items.length === 0) {
    menuItemsGridEl.innerHTML = `<p style="grid-column:1/-1; text-align:center; padding:30px; color:var(--text-muted);">No items in this category.</p>`;
    return;
  }

  menuItemsGridEl.innerHTML = items.map(item => {
    const inCart = cart.find(c => c.id === item.id);
    const cartQty = inCart ? inCart.quantity : 0;

    return `
      <div class="menu-item-card">
        <div class="item-thumb-box">
          <img src="${item.image}" alt="${item.name}" loading="lazy" onerror="this.src='image/margherita.jpg'">
        </div>
        <div class="item-details">
          <h5 class="item-name">${item.name}</h5>
          <p class="item-desc">${item.desc}</p>
          <div class="item-footer-row">
            <span class="item-price">₹${item.price}</span>
            <div id="itemAction-${item.id}">
              ${cartQty > 0 ? `
                <div class="qty-control-inline">
                  <button class="btn-qty-step" onclick="changeQuantity(${item.id}, -1)">-</button>
                  <span class="qty-number">${cartQty}</span>
                  <button class="btn-qty-step" onclick="changeQuantity(${item.id}, 1)">+</button>
                </div>
              ` : `
                <button class="btn-add-item" onclick="addItemToCart(${item.id})">
                  <i class="fa-solid fa-plus"></i> ADD
                </button>
              `}
            </div>
          </div>
        </div>
      </div>
    `;
  }).join("");
}

// ==========================================================================
// Cart Management
// ==========================================================================
function findItem(itemId) {
  for (const rId in MENUS) {
    const found = MENUS[rId].find(i => i.id === itemId);
    if (found) return { ...found, restaurantId: Number(rId) };
  }
  return null;
}

function addItemToCart(itemId) {
  const item = findItem(itemId);
  if (!item) return;

  const existing = cart.find(c => c.id === itemId);
  if (existing) {
    existing.quantity += 1;
  } else {
    cart.push({
      id: item.id,
      name: item.name,
      price: item.price,
      image: item.image,
      quantity: 1
    });
  }

  saveCart();
  updateCartBadge();
  updateItemButtonInMenu(itemId);
  showToast(`Added "${item.name}" to cart!`);
}

function changeQuantity(itemId, delta) {
  const itemIndex = cart.findIndex(c => c.id === itemId);
  if (itemIndex > -1) {
    cart[itemIndex].quantity += delta;
    if (cart[itemIndex].quantity <= 0) {
      cart.splice(itemIndex, 1);
    }
  }

  saveCart();
  updateCartBadge();
  updateItemButtonInMenu(itemId);
  renderCartDrawer();
}

function updateItemButtonInMenu(itemId) {
  const actionContainer = document.getElementById(`itemAction-${itemId}`);
  if (!actionContainer) return;

  const inCart = cart.find(c => c.id === itemId);
  const cartQty = inCart ? inCart.quantity : 0;

  if (cartQty > 0) {
    actionContainer.innerHTML = `
      <div class="qty-control-inline">
        <button class="btn-qty-step" onclick="changeQuantity(${itemId}, -1)">-</button>
        <span class="qty-number">${cartQty}</span>
        <button class="btn-qty-step" onclick="changeQuantity(${itemId}, 1)">+</button>
      </div>
    `;
  } else {
    actionContainer.innerHTML = `
      <button class="btn-add-item" onclick="addItemToCart(${itemId})">
        <i class="fa-solid fa-plus"></i> ADD
      </button>
    `;
  }
}

function saveCart() {
  localStorage.setItem("foodiehub_cart", JSON.stringify(cart));
}

function updateCartBadge() {
  const totalCount = cart.reduce((sum, item) => sum + item.quantity, 0);
  cartBadgeCountEl.innerText = totalCount;
  if (cartBadgeTotalEl) cartBadgeTotalEl.innerText = totalCount;
  cartBadgeCountEl.style.display = totalCount > 0 ? "flex" : "none";
}

function toggleCartDrawer(open) {
  if (open) {
    renderCartDrawer();
    cartDrawerEl.classList.add("active");
    cartOverlayEl.classList.add("active");
  } else {
    cartDrawerEl.classList.remove("active");
    cartOverlayEl.classList.remove("active");
  }
}

function renderCartDrawer() {
  if (cart.length === 0) {
    cartItemsContainerEl.innerHTML = `
      <div class="cart-empty-state">
        <div class="cart-empty-icon"><i class="fa-solid fa-basket-shopping"></i></div>
        <h4>Your cart is empty</h4>
        <p>Explore our restaurants and add delicious meals to your cart.</p>
      </div>
    `;
    document.getElementById("cartSubtotal").innerText = "₹0";
    document.getElementById("cartTax").innerText = "₹0";
    document.getElementById("cartDelivery").innerText = "₹0";
    document.getElementById("cartTotal").innerText = "₹0";
    document.getElementById("btnProceedCheckout").disabled = true;
    document.getElementById("btnProceedCheckout").style.opacity = "0.5";
    return;
  }

  document.getElementById("btnProceedCheckout").disabled = false;
  document.getElementById("btnProceedCheckout").style.opacity = "1";

  cartItemsContainerEl.innerHTML = cart.map(item => `
    <div class="cart-item-row">
      <img src="${item.image}" alt="${item.name}" class="cart-item-img" onerror="this.src='image/margherita.jpg'">
      <div class="cart-item-info">
        <h5 class="cart-item-name">${item.name}</h5>
        <span class="cart-item-price">₹${item.price} each</span>
      </div>
      <div class="qty-control-inline">
        <button class="btn-qty-step" onclick="changeQuantity(${item.id}, -1)">-</button>
        <span class="qty-number">${item.quantity}</span>
        <button class="btn-qty-step" onclick="changeQuantity(${item.id}, 1)">+</button>
      </div>
    </div>
  `).join("");

  const subtotal = cart.reduce((sum, i) => sum + (i.price * i.quantity), 0);
  const delivery = subtotal > 500 ? 0 : 40;
  const tax = Math.round(subtotal * 0.05);
  const total = subtotal + delivery + tax;

  document.getElementById("cartSubtotal").innerText = `₹${subtotal}`;
  document.getElementById("cartDelivery").innerText = delivery === 0 ? "FREE" : `₹${delivery}`;
  document.getElementById("cartTax").innerText = `₹${tax}`;
  document.getElementById("cartTotal").innerText = `₹${total}`;
}

// ==========================================================================
// Checkout & Order Placement
// ==========================================================================
function openCheckoutModal() {
  if (cart.length === 0) {
    showToast("Your cart is empty!");
    return;
  }
  toggleCartDrawer(false);

  const subtotal = cart.reduce((sum, i) => sum + (i.price * i.quantity), 0);
  const delivery = subtotal > 500 ? 0 : 40;
  const tax = Math.round(subtotal * 0.05);
  const total = subtotal + delivery + tax;

  document.getElementById("checkoutTotalSummary").innerText = `Total Payable: ₹${total}`;
  checkoutModalEl.classList.add("active");
}

function closeCheckoutModal() {
  checkoutModalEl.classList.remove("active");
}

function selectPaymentMethod(method, el) {
  selectedPaymentMethod = method;
  document.querySelectorAll(".payment-method-box").forEach(b => b.classList.remove("selected"));
  if (el) el.classList.add("selected");
}

function handlePlaceOrder(e) {
  e.preventDefault();

  const name = document.getElementById("orderName").value.trim();
  const phone = document.getElementById("orderPhone").value.trim();
  const address = document.getElementById("orderAddress").value.trim();

  if (!name || !phone || !address) {
    showToast("Please fill in all delivery details");
    return;
  }

  const subtotal = cart.reduce((sum, i) => sum + (i.price * i.quantity), 0);
  const delivery = subtotal > 500 ? 0 : 40;
  const tax = Math.round(subtotal * 0.05);
  const total = subtotal + delivery + tax;
  const orderId = "FH-" + Math.floor(100000 + Math.random() * 900000);

  // Fill success receipt
  document.getElementById("receiptOrderId").innerText = `#${orderId}`;
  document.getElementById("receiptCustomer").innerText = name;
  document.getElementById("receiptPayment").innerText = selectedPaymentMethod;
  document.getElementById("receiptTotal").innerText = `₹${total}`;
  document.getElementById("receiptCount").innerText = `${cart.length} item(s)`;

  // Clear cart
  cart = [];
  saveCart();
  updateCartBadge();

  closeCheckoutModal();
  closeRestaurantMenu();
  orderSuccessModalEl.classList.add("active");
}

function closeOrderSuccessModal() {
  orderSuccessModalEl.classList.remove("active");
}

// ==========================================================================
// Toast Notification
// ==========================================================================
function showToast(message) {
  const toast = document.createElement("div");
  toast.className = "toast toast-success";
  toast.innerHTML = `<i class="fa-solid fa-circle-check"></i> ${message}`;
  toastContainerEl.appendChild(toast);

  setTimeout(() => {
    toast.style.opacity = "0";
    toast.style.transform = "translateY(10px)";
    toast.style.transition = "all 0.3s ease";
    setTimeout(() => toast.remove(), 300);
  }, 2500);
}

// ==========================================================================
// Event Listeners
// ==========================================================================
function setupEventListeners() {
  // Category filter pills
  document.querySelectorAll(".filter-pill").forEach(pill => {
    pill.addEventListener("click", () => {
      document.querySelectorAll(".filter-pill").forEach(p => p.classList.remove("active"));
      pill.classList.add("active");
      activeCategoryFilter = pill.dataset.filter;
      renderRestaurants();
    });
  });

  // Search input
  const searchInput = document.getElementById("searchInput");
  if (searchInput) {
    searchInput.addEventListener("input", (e) => {
      searchQuery = e.target.value.trim();
      renderRestaurants();
    });
  }

  // Close modals on escape key
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") {
      closeRestaurantMenu();
      toggleCartDrawer(false);
      closeCheckoutModal();
      closeOrderSuccessModal();
    }
  });
}
