-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS foodiehub;
USE foodiehub;

-- 1. Create USERS table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    gender VARCHAR(10),
    phone VARCHAR(15) NOT NULL
);

-- 2. Create RESTAURANT table
CREATE TABLE IF NOT EXISTS restaurant (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    rating DOUBLE DEFAULT 0.0,
    active BOOLEAN DEFAULT TRUE,
    image VARCHAR(100)
);

-- 3. Create MENU table
CREATE TABLE IF NOT EXISTS menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    price DOUBLE NOT NULL,
    category VARCHAR(50),
    image VARCHAR(100),
    rating DOUBLE DEFAULT 0.0,
    isAvailable BOOLEAN DEFAULT TRUE,
    description TEXT,
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id) ON DELETE CASCADE
);

-- 4. Create ORDERS table
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    mobile VARCHAR(15) NOT NULL,
    address TEXT NOT NULL,
    payment_type VARCHAR(20) NOT NULL,
    total_amount DOUBLE NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Create ORDER_ITEMS table
CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    menu_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (menu_id) REFERENCES menu(id) ON DELETE CASCADE
);

-- =========================================================
-- POPULATE RESTAURANTS (matching r1.jpg to r11.jpg)
-- =========================================================
INSERT INTO restaurant (id, name, cuisine, address, rating, active, image) VALUES
(1, 'Burger Express', 'Burgers, Fast Food', '12 Main Street, Downtown', 4.3, 1, 'r1.jpg'),
(2, 'Pizza Palace', 'Pizza, Italian', '88 High Street, Midtown', 4.1, 1, 'r2.jpg'),
(3, 'Crispy Fried Chicken', 'Fried Chicken, Fast Food', '45 Park Avenue, Uptown', 4.2, 1, 'r3.jpg'),
(4, 'Subway Delights', 'Sandwiches, Healthy', '59 Metro Plaza, Westside', 4.0, 1, 'r4.jpg'),
(5, 'Dominos Express', 'Pizza, Fast Food', '102 Station Road, Eastside', 4.4, 1, 'r5.jpg'),
(6, 'Star Cafe', 'Coffee, Desserts, Snacks', '33 City Center Mall', 4.5, 1, 'r6.jpg'),
(7, 'Golden Burger', 'Burgers, Fast Food', '72 Ring Road, Southside', 4.2, 1, 'r7.jpg'),
(8, 'Ice Cream Haven', 'Ice Cream, Desserts', '15 Sector Road, Northside', 4.6, 1, 'r8.jpg'),
(9, 'Chinese Wok', 'Chinese, Asian', 'Food Court, Forum Mall', 3.9, 1, 'r9.jpg'),
(10, 'Taj Biryani House', 'Biryani, Indian, Mains', '99 Grand Trunk Road', 4.5, 1, 'r10.jpg'),
(11, 'Beverage Boulevard', 'Beverages, Coffee', 'High Street Crossing', 3.8, 1, 'r11.jpg');

-- =========================================================
-- POPULATE MENUS (using specific image assets in project)
-- =========================================================

-- Menu Items for Burger Express (Restaurant ID: 1)
INSERT INTO menu (restaurant_id, item_name, price, category, image, rating, isAvailable, description) VALUES
(1, 'Chicken Whopper Burger', 189.00, 'Burgers', 'chickenwhopper.jpg', 4.5, 1, 'Juicy flame-grilled chicken patty topped with onions, tomatoes, fresh lettuce, and creamy mayo on toasted sesame seeds buns.'),
(1, 'Crispy Veg Whopper Burger', 149.00, 'Burgers', 'vegwhopper.jpg', 4.2, 1, 'Crispy golden veg patty topped with fresh lettuce, pickles, and classic sweet-mustard sauce.'),
(1, 'Golden Chicken Nuggets (9 Pcs)', 129.00, 'Snacks', 'nuggets.jpg', 4.0, 1, 'Bite-sized, crispy golden-fried chicken nuggets served with hot garlic dip.'),
(1, 'Salted French Fries (M)', 99.00, 'Snacks', 'french.jpg', 4.1, 1, 'Perfectly cut premium potatoes, golden-fried and lightly salted.'),
(1, 'Chilled Coca Cola Can', 60.00, 'Beverages', 'coke.jpg', 4.5, 1, 'Refreshing chilled 330ml soda can to wash down your meal.');

-- Menu Items for Pizza Palace (Restaurant ID: 2)
INSERT INTO menu (restaurant_id, item_name, price, category, image, rating, isAvailable, description) VALUES
(2, 'Classic Margherita Pizza', 249.00, 'Pizza', 'margherita.jpg', 4.4, 1, 'Classic cheese burst pizza loaded with 100% real mozzarella cheese on rich Italian marinara sauce.'),
(2, 'Peppy Paneer Pizza', 399.00, 'Pizza', 'peppi.jpg', 4.5, 1, 'Spiced paneer cubes, crunchy capsicum, and red paprika on a melting cheese base.'),
(2, 'Stuffed Garlic Bread', 149.00, 'Sides', 'garlic.jpg', 4.3, 1, 'Freshly baked garlic breadsticks filled with melted cheese, corn, and jalapeños.'),
(2, 'Gooey Choco Lava Cake', 99.00, 'Desserts', 'lava.jpg', 4.8, 1, 'Freshly baked chocolate cake with a warm, gooey, molten chocolate center.');

-- Menu Items for Taj Biryani House (Restaurant ID: 10)
INSERT INTO menu (restaurant_id, item_name, price, category, image, rating, isAvailable, description) VALUES
(10, 'Rich Butter Chicken (Full)', 299.00, 'Mains', 'butter.jpg', 4.6, 1, 'Tender tandoori chicken pieces cooked in a rich, velvety, mildly sweet tomato-cashew gravy with butter.'),
(10, 'Slow Cooked Dal Makhani', 199.00, 'Mains', 'dal.jpg', 4.3, 1, 'Slow-cooked black lentils and red kidney beans simmered overnight with traditional spices, butter, and fresh cream.'),
(10, 'Jeera Basmati Rice', 129.00, 'Sides', 'jeera.jpg', 4.0, 1, 'Fragrant, long-grain Basmati rice tempered with aromatic cumin seeds and pure ghee.'),
(10, 'Butter Tandoori Roti', 30.00, 'Breads', 'roti.jpg', 4.2, 1, 'Clay-oven baked whole wheat flatbread brushed with fresh butter.');
