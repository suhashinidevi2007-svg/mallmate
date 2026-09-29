-- =====================================================================
-- MallMate PostgreSQL Schema for Supabase
-- Run this script in the Supabase Dashboard SQL Editor
-- (Dashboard -> SQL Editor -> New Query -> Paste & Run)
-- =====================================================================

-- 1. Users Table
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(50) NOT NULL,
  email VARCHAR(100),
  phone VARCHAR(20)
);

-- 2. Shops Table
CREATE TABLE IF NOT EXISTS shops (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  floor INT NOT NULL,
  category VARCHAR(50),
  description VARCHAR(255)
);

-- 3. Products Table
CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  shop_id INT NOT NULL REFERENCES shops(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  price DOUBLE PRECISION NOT NULL,
  description VARCHAR(255)
);

-- 4. Orders Table
CREATE TABLE IF NOT EXISTS orders (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  total DOUBLE PRECISION NOT NULL,
  order_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- 5. Insert Sample Shops (with ON CONFLICT to avoid duplicate key errors)
INSERT INTO shops (id, name, floor, category, description) VALUES
(1, 'Trendy Threads', 1, 'Clothing', 'Latest fashion for men and women'),
(2, 'Shoe Palace', 1, 'Footwear', 'Sneakers, formals and sandals'),
(3, 'Gadget World', 2, 'Electronics', 'Phones, laptops and accessories'),
(4, 'Book Nook', 2, 'Books', 'Fiction, non-fiction and stationery'),
(5, 'Food Court Central', 3, 'Food', 'Multi-cuisine food stalls'),
(6, 'Toy Kingdom', 3, 'Toys', 'Toys and games for all ages')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  floor = EXCLUDED.floor,
  category = EXCLUDED.category,
  description = EXCLUDED.description;

-- Synchronize the shops serial sequence
SELECT setval('shops_id_seq', (SELECT COALESCE(MAX(id), 1) FROM shops));

-- 6. Insert Sample Products (only if table is empty)
INSERT INTO products (shop_id, name, price, description)
SELECT 1, 'Denim Jacket', 1499.00, 'Blue slim-fit denim jacket'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Denim Jacket');

INSERT INTO products (shop_id, name, price, description)
SELECT 1, 'Cotton T-Shirt', 499.00, 'Round-neck cotton t-shirt'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Cotton T-Shirt');

INSERT INTO products (shop_id, name, price, description)
SELECT 2, 'Running Shoes', 2199.00, 'Lightweight running shoes'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Running Shoes');

INSERT INTO products (shop_id, name, price, description)
SELECT 3, 'Wireless Earbuds', 1999.00, 'Bluetooth 5.0 earbuds'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Wireless Earbuds');

INSERT INTO products (shop_id, name, price, description)
SELECT 3, 'Smartphone X10', 15999.00, '6GB RAM, 128GB storage'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Smartphone X10');

INSERT INTO products (shop_id, name, price, description)
SELECT 4, 'Mystery Novel', 349.00, 'Bestselling mystery thriller'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Mystery Novel');

INSERT INTO products (shop_id, name, price, description)
SELECT 5, 'Veg Combo Meal', 199.00, 'Rice, curry and dessert'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Veg Combo Meal');

INSERT INTO products (shop_id, name, price, description)
SELECT 6, 'Building Blocks Set', 899.00, '200-piece creative blocks'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Building Blocks Set');

-- Synchronize the products serial sequence
SELECT setval('products_id_seq', (SELECT COALESCE(MAX(id), 1) FROM products));
