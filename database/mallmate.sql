CREATE DATABASE IF NOT EXISTS mallmate;
USE mallmate;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(50) NOT NULL,
  email VARCHAR(100),
  phone VARCHAR(20)
);

CREATE TABLE shops (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  floor INT NOT NULL,
  category VARCHAR(50),
  description VARCHAR(255)
);

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  shop_id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  price DOUBLE NOT NULL,
  description VARCHAR(255),
  FOREIGN KEY (shop_id) REFERENCES shops(id)
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  total DOUBLE NOT NULL,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO shops (name, floor, category, description) VALUES
('Trendy Threads', 1, 'Clothing', 'Latest fashion for men and women'),
('Shoe Palace', 1, 'Footwear', 'Sneakers, formals and sandals'),
('Gadget World', 2, 'Electronics', 'Phones, laptops and accessories'),
('Book Nook', 2, 'Books', 'Fiction, non-fiction and stationery'),
('Food Court Central', 3, 'Food', 'Multi-cuisine food stalls'),
('Toy Kingdom', 3, 'Toys', 'Toys and games for all ages');

INSERT INTO products (shop_id, name, price, description) VALUES
(1, 'Denim Jacket', 1499.00, 'Blue slim-fit denim jacket'),
(1, 'Cotton T-Shirt', 499.00, 'Round-neck cotton t-shirt'),
(2, 'Running Shoes', 2199.00, 'Lightweight running shoes'),
(3, 'Wireless Earbuds', 1999.00, 'Bluetooth 5.0 earbuds'),
(3, 'Smartphone X10', 15999.00, '6GB RAM, 128GB storage'),
(4, 'Mystery Novel', 349.00, 'Bestselling mystery thriller'),
(5, 'Veg Combo Meal', 199.00, 'Rice, curry and dessert'),
(6, 'Building Blocks Set', 899.00, '200-piece creative blocks');