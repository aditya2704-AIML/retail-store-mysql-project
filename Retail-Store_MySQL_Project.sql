CREATE DATABASE retail_store;
USE retail_store;

CREATE TABLE customers (
    customerid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    createdat DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    productid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stockquantity INT NOT NULL DEFAULT 0,
    addedon DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    orderid INT PRIMARY KEY AUTO_INCREMENT,
    customerid INT,
    orderdate DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Pending',
    totalamount DECIMAL(10,2),
    FOREIGN KEY (customerid) REFERENCES customers(customerid)
);

CREATE TABLE order_items (
    orderitemid INT PRIMARY KEY AUTO_INCREMENT,
    orderid INT,
    productid INT,
    quantity INT NOT NULL CHECK (quantity > 0),
    itemprice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (orderid) REFERENCES orders(orderid),
    FOREIGN KEY (productid) REFERENCES products(productid)
);

CREATE TABLE payments (
    paymentid INT PRIMARY KEY AUTO_INCREMENT,
    orderid INT,
    paymentdate DATETIME DEFAULT CURRENT_TIMESTAMP,
    amountpaid DECIMAL(10,2) NOT NULL CHECK (amountpaid >= 0),
    method VARCHAR(20) NOT NULL,
    FOREIGN KEY (orderid) REFERENCES orders(orderid)
);

CREATE TABLE product_reviews (
    reviewid INT PRIMARY KEY AUTO_INCREMENT,
    productid INT,
    customerid INT,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    reviewtext TEXT,
    reviewdate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (productid) REFERENCES products(productid),
    FOREIGN KEY (customerid) REFERENCES customers(customerid)
);

-- INSERT SAMPLE DATA (TOP 30 CUSTOMERS, 20 PRODUCTS, 50 ORDERS + RELATED)
-- Customers (30 records)
INSERT INTO customers (customerid, name, email, phone, createdat) VALUES
(1, 'Thomas Owens', 'user1@example.com', '142-479-1945', '2024-10-14 16:01:12'),
(2, 'Charles Grant', 'user2@example.com', '9153947511', '2023-11-25 15:45:24'),
(3, 'Kaitlin Richards', 'user3@example.com', '2073473421', '2024-06-23 09:55:22'),
(4, 'Christina Williams', 'user4@example.com', '586-605-5061x06', '2024-10-27 17:19:38'),
(5, 'David Allen', 'user5@example.com', '751456-8289x1', '2023-10-29 02:43:00'),
(6, 'Mark Duke', 'user6@example.com', '144957-2811', '2024-06-24 03:22:59'),
(7, 'Briana Wright', 'user7@example.com', '223-833-9635', '2023-06-25 00:35:43'),
(8, 'John Bryan', 'user8@example.com', '045.568.0798x27', '2025-02-15 17:57:04'),
(9, 'Jason Thompson', 'user9@example.com', '1862659420', '2024-08-31 08:18:51'),
(10, 'Shawn Hill', 'user10@example.com', '268113-3152x7', '2023-12-14 20:46:43'),
(11, 'Walter Jenkins', 'user11@example.com', '536-329-0817x71', '2023-10-26 03:12:30'),
(12, 'Mary Knight', 'user12@example.com', '361-636-3802', '2023-08-16 20:05:50'),
(13, 'Leslie Wilson', 'user13@example.com', '1-256-261-1984', '2024-06-06 20:12:35'),
(14, 'Deborah Arias', 'user14@example.com', '811-821-2144x97', '2024-04-24 00:27:28'),
(15, 'Austin Flores', 'user15@example.com', '329.901.1576x66', '2024-06-13 09:03:42'),
(16, 'Amy Landry', 'user16@example.com', '1-278-019-3748', '2024-02-28 17:51:50'),
(17, 'Randy Mooney', 'user17@example.com', '158927-7313x3', '2023-09-21 13:23:02'),
(18, 'Jeffrey Bray', 'user18@example.com', '164.962.0222x92', '2024-07-02 19:51:55'),
(19, 'Amanda Bright', 'user19@example.com', '380.981.9798x69', '2024-12-20 22:58:15'),
(20, 'Megan Lee', 'user20@example.com', '7044478333', '2024-07-09 16:13:14'),
(21, 'Jessica Zamora', 'user21@example.com', '177-816-7773x00', '2023-11-11 04:46:03'),
(22, 'Peter Phillips', 'user22@example.com', '389-656-1695', '2025-05-22 06:12:06'),
(23, 'Kathryn Mathews', 'user23@example.com', '001-707-722-178', '2023-12-21 15:30:24'),
(24, 'Brandy Wright', 'user24@example.com', '853.520.8915x61', '2024-07-09 17:09:19'),
(25, 'Cindy Hart', 'user25@example.com', '617.574.8421x41', '2025-05-27 18:02:54'),
(26, 'Victoria Hall', 'user26@example.com', '926-840-0016', '2024-03-08 16:43:52'),
(27, 'Adrienne Green', 'user27@example.com', '530.644.8455x93', '2023-08-22 01:55:29'),
(28, 'Joseph Stuart', 'user28@example.com', '363-045-4287', '2023-09-14 05:52:25'),
(29, 'Kara Zavala', 'user29@example.com', '434-985-5776x61', '2023-09-27 15:57:09'),
(30, 'Victoria Acevedo', 'user30@example.com', '1-325-063-7244', '2023-11-28 12:30:59');

-- Products (20 records)
INSERT INTO products (productid, name, category, price, stockquantity, addedon) VALUES
(1, 'Plant Network', 'Home', 639.43, 152, '2024-01-30 06:30:53'),
(2, 'Population Social', 'Clothing', 4813.68, 84, '2025-05-30 10:02:50'),
(3, 'Available Answer', 'Electronics', 2529.51, 101, '2025-04-13 01:11:46'),
(4, 'Any Question', 'Clothing', 4759.28, 179, '2025-06-03 13:34:03'),
(5, 'Natural Network', 'Toys', 4722.66, 75, '2023-11-06 00:47:37'),
(6, 'If Whatever', 'Electronics', 177.40, 64, '2024-12-19 10:37:14'),
(7, 'Response Indeed', 'Clothing', 4897.36, 36, '2025-03-29 02:43:08'),
(8, 'Every Amount', 'Home', 4173.60, 156, '2025-04-30 03:11:10'),
(9, 'Common Study', 'Toys', 985.19, 171, '2023-07-20 13:06:42'),
(10, 'Development System', 'Electronics', 4801.78, 153, '2025-03-12 08:22:57'),
(11, 'Build Her', 'Books', 1852.64, 150, '2024-09-08 01:09:15'),
(12, 'Action Ask', 'Electronics', 4017.01, 19, '2025-02-14 03:38:06'),
(13, 'Full West', 'Books', 2112.33, 172, '2023-09-15 03:13:38'),
(14, 'Listen Development', 'Home', 296.17, 132, '2024-10-12 11:49:26'),
(15, 'Place Low', 'Electronics', 723.97, 46, '2023-07-05 14:36:07'),
(16, 'Special Fact', 'Toys', 1094.18, 15, '2025-03-17 10:42:40'),
(17, 'Everything Plant', 'Books', 2496.68, 120, '2023-10-08 20:11:55'),
(18, 'Some Them', 'Toys', 3673.86, 110, '2024-07-25 00:33:53'),
(19, 'Build High', 'Clothing', 4707.14, 47, '2023-09-01 02:50:01'),
(20, 'Real Source', 'Books', 4398.66, 197, '2025-02-08 10:28:27');

-- Orders (50 records)
INSERT INTO orders (orderid, customerid, orderdate, status, totalamount) VALUES
(1, 20, '2025-03-02 07:20:11', 'Delivered', 9414.28),
(2, 18, '2024-10-09 18:08:21', 'Shipped', 532.20),
(3, 15, '2025-05-08 00:08:27', 'Cancelled', 5164.56),
(4, 11, '2024-09-19 22:16:13', 'Delivered', 9469.78),
(5, 12, '2025-04-08 18:02:06', 'Pending', 14501.86),
(6, 29, '2024-10-25 07:33:59', 'Cancelled', 31050.17),
(7, 22, '2024-07-29 11:58:47', 'Shipped', 3043.67),
(8, 19, '2024-07-30 22:49:49', 'Cancelled', 32714.06),
(9, 6, '2025-06-10 17:00:25', 'Pending', 24219.20),
(10, 28, '2025-02-16 12:45:59', 'Delivered', 24342.52),
(11, 25, '2025-03-11 14:22:46', 'Cancelled', 16196.13),
(12, 28, '2025-01-15 13:22:53', 'Shipped', 9890.72),
(13, 25, '2025-05-12 13:04:29', 'Cancelled', 9627.36),
(14, 1, '2024-09-24 21:21:38', 'Shipped', 15803.34),
(15, 29, '2024-07-18 03:18:24', 'Pending', 12421.88),
(16, 5, '2024-09-09 03:00:40', 'Shipped', 22856.73),
(17, 1, '2024-08-19 21:17:57', 'Pending', 11173.77),
(18, 13, '2024-06-15 12:57:04', 'Cancelled', 32001.24),
(19, 29, '2024-07-06 15:28:24', 'Cancelled', 843.46),
(20, 20, '2024-08-24 04:48:37', 'Delivered', 6400.68),
(21, 22, '2025-03-12 18:53:46', 'Pending', 25364.11),
(22, 20, '2025-02-21 11:21:06', 'Shipped', 21281.44),
(23, 25, '2025-03-02 14:33:23', 'Delivered', 18045.05),
(24, 6, '2024-06-19 07:09:04', 'Pending', 22882.19),
(25, 17, '2024-07-24 12:56:24', 'Pending', 23749.66),
(26, 24, '2025-02-16 23:16:49', 'Delivered', 35167.92),
(27, 17, '2024-11-22 03:14:09', 'Cancelled', 2955.57),
(28, 16, '2024-10-19 18:28:48', 'Delivered', 639.43),
(29, 7, '2025-02-17 18:03:18', 'Delivered', 26308.25),
(30, 23, '2024-10-18 13:37:49', 'Delivered', 18628.74);

-- Order Items (100 records for first 30 orders)
INSERT INTO order_items (orderitemid, orderid, productid, quantity, itemprice) VALUES
(1, 1, 2, 2, 4813.68), (2, 1, 8, 1, 4173.60),
(3, 2, 6, 3, 177.40),
(4, 3, 10, 1, 4801.78), (5, 3, 20, 1, 4398.66),
(6, 4, 7, 2, 4897.36),
(7, 5, 4, 3, 4759.28),
(8, 6, 12, 6, 4017.01),
(9, 7, 20, 1, 4398.66),
(10, 8, 2, 7, 4813.68),
(11, 9, 10, 5, 4801.78),
(12, 10, 19, 5, 4707.14),
(13, 11, 5, 3, 4722.66),
(14, 12, 8, 2, 4173.60),
(15, 13, 7, 2, 4897.36),
(16, 14, 4, 3, 4759.28),
(17, 15, 12, 3, 4017.01),
(18, 16, 2, 5, 4813.68),
(19, 17, 20, 2, 4398.66),
(20, 18, 10, 7, 4801.78),
(21, 19, 6, 5, 177.40),
(22, 20, 8, 1, 4173.60),
(23, 21, 7, 6, 4897.36),
(24, 22, 4, 4, 4759.28),
(25, 23, 19, 4, 4707.14),
(26, 24, 12, 5, 4017.01),
(27, 25, 2, 5, 4813.68),
(28, 26, 20, 8, 4398.66),
(29, 27, 10, 1, 4801.78),
(30, 28, 1, 1, 639.43);

-- Payments (30 records)
INSERT INTO payments (paymentid, orderid, paymentdate, amountpaid, method) VALUES
(1, 1, '2025-03-02 08:00:00', 9414.28, 'Credit Card'),
(2, 2, '2024-10-10 09:00:00', 532.20, 'UPI'),
(3, 4, '2024-09-20 10:00:00', 9469.78, 'Credit Card'),
(4, 10, '2025-02-17 11:00:00', 24342.52, 'Debit Card'),
(5, 20, '2024-08-25 12:00:00', 6400.68, 'UPI'),
(6, 23, '2025-03-03 13:00:00', 18045.05, 'Credit Card'),
(7, 26, '2025-02-17 14:00:00', 35167.92, 'Credit Card'),
(8, 28, '2024-10-20 15:00:00', 639.43, 'Cash'),
(9, 29, '2025-02-18 16:00:00', 26308.25, 'UPI'),
(10, 30, '2024-10-19 17:00:00', 18628.74, 'Credit Card');

-- Product Reviews (20 records)
INSERT INTO product_reviews (reviewid, productid, customerid, rating, reviewtext, reviewdate) VALUES
(1, 1, 1, 5, 'Excellent quality home decor!', '2024-02-01'),
(2, 2, 2, 4, 'Good fit, premium clothing', '2025-06-01'),
(3, 3, 3, 3, 'Average electronics product', '2025-05-01'),
(4, 4, 4, 5, 'Perfect clothing choice', '2025-07-01'),
(5, 5, 5, 2, 'Not as expected for toys', '2023-12-01'),
(6, 6, 6, 4, 'Budget electronics option', '2025-01-01'),
(7, 7, 7, 5, 'Luxury clothing item', '2025-04-01'),
(8, 8, 9, 4, 'Great home essentials', '2025-05-01'),
(9, 9, 10, 5, 'Perfect toy for kids', '2023-08-01'),
(10, 10, 11, 3, 'Average performance', '2025-04-01'),
(11, 11, 12, 5, 'Must-read book!', '2024-10-01'),
(12, 12, 13, 4, 'Good electronics gadget', '2025-03-01'),
(13, 13, 14, 5, 'Excellent book content', '2023-10-01'),
(14, 14, 15, 3, 'Basic home product', '2024-11-01'),
(15, 15, 16, 4, 'Decent electronics', '2023-08-01'),
(16, 16, 17, 5, 'Best toy ever!', '2025-04-01'),
(17, 17, 18, 4, 'Good educational book', '2023-11-01'),
(18, 18, 19, 3, 'Average toy quality', '2024-08-01'),
(19, 19, 20, 5, 'Premium clothing', '2023-10-01'),
(20, 20, 21, 4, 'Worth the price book', '2025-03-01');

-- =====================================================
-- LEVEL 1: BASICS 
-- =====================================================

-- Q1: Customer names and emails
SELECT name AS "Customer Name", email AS "Email" FROM customers;

-- Q2: Complete product catalog
SELECT * FROM products;

-- Q3: Unique product categories
SELECT DISTINCT category FROM products;

-- Q4: Products above ₹1000
SELECT name, price FROM products WHERE price > 1000 ORDER BY price DESC;

-- Q5: Products ₹2000-₹5000
SELECT name, price FROM products WHERE price BETWEEN 2000 AND 5000 ORDER BY price;

-- Q6: Specific customer IDs
SELECT * FROM customers WHERE customerid IN (1, 2, 3);

-- Q7: Names starting with A
SELECT name FROM customers WHERE name LIKE 'A%';

-- Q8: Electronics under ₹3000
SELECT name, price FROM products WHERE category = 'Electronics' AND price < 3000;

-- Q9: Products by price DESC
SELECT name, price FROM products ORDER BY price DESC;

-- Q10: Products sorted by price then name
SELECT name, price FROM products ORDER BY price DESC, name ASC;

-- =====================================================
-- LEVEL 2: FILTERING & FORMATTING 
-- =====================================================

-- Q1: Orders without customer
SELECT orderid, orderdate FROM orders WHERE customerid IS NULL;

-- Q2: Customer aliases
SELECT name AS "Customer Name", email AS "Email ID" FROM customers;

-- Q3: Line item total value
SELECT orderid, productid, quantity * itemprice AS line_total FROM order_items;

-- Q4: Concat name + phone
SELECT CONCAT(name, ' - ', COALESCE(phone, 'No Phone')) AS contact_info FROM customers;

-- Q5: Extract order date only
SELECT orderid, DATE(orderdate) AS order_date FROM orders;

-- Q6: Out of stock products
SELECT name, price FROM products WHERE stockquantity = 0;

-- =====================================================
-- LEVEL 3: AGGREGATIONS 
-- =====================================================

-- Q1: Total orders
SELECT COUNT(*) AS total_orders FROM orders;

-- Q2: Total revenue
SELECT SUM(totalamount) AS total_revenue FROM orders;

-- Q3: Average order value
SELECT ROUND(AVG(totalamount), 2) AS avg_order_value FROM orders;

-- Q4: Active customers
SELECT COUNT(DISTINCT customerid) AS active_customers FROM orders;

-- Q5: Orders per customer (>2 orders)
SELECT customerid, COUNT(*) AS order_count 
FROM orders GROUP BY customerid HAVING COUNT(*) > 2;

-- Q6: Total sales per customer
SELECT c.name, ROUND(SUM(o.totalamount), 2) AS total_spent
FROM customers c JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.name;

-- Q7: Products per category
SELECT category, COUNT(*) AS product_count, ROUND(AVG(price), 2) AS avg_price
FROM products GROUP BY category;

-- Q8: Orders per day
SELECT DATE(orderdate) AS order_date, COUNT(*) AS daily_orders
FROM orders GROUP BY DATE(orderdate) ORDER BY order_date;

-- Q9: Average item price per category
SELECT p.category, ROUND(AVG(oi.itemprice), 2) AS avg_item_price
FROM products p JOIN order_items oi ON p.productid = oi.productid
GROUP BY p.category;

-- Q10: Payments per method
SELECT method, COUNT(*) AS payment_count, SUM(amountpaid) AS total_paid
FROM payments GROUP BY method;

-- =====================================================
-- LEVEL 4: JOINS 
-- =====================================================

-- Q1: Customer orders (INNER JOIN)
SELECT c.name, o.orderid, o.orderdate, o.totalamount
FROM customers c INNER JOIN orders o ON c.customerid = o.customerid
ORDER BY o.orderdate DESC;

-- Q2: Products that have been sold
SELECT DISTINCT p.name, p.category
FROM products p INNER JOIN order_items oi ON p.productid = oi.productid;

-- Q3: Orders with payment method
SELECT o.orderid, p.method, p.amountpaid
FROM orders o INNER JOIN payments p ON o.orderid = p.orderid;

-- Q4: All customers + their orders (LEFT JOIN)
SELECT c.name, COUNT(o.orderid) AS order_count
FROM customers c LEFT JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.name
ORDER BY order_count DESC;

-- Q5: All products + sales quantity (LEFT JOIN)
SELECT p.name, COALESCE(SUM(oi.quantity), 0) AS total_sold
FROM products p LEFT JOIN order_items oi ON p.productid = oi.productid
GROUP BY p.productid, p.name;

-- Q6: All payments including unmatched (RIGHT JOIN)
SELECT p.paymentid, p.method, o.orderid
FROM orders o RIGHT JOIN payments p ON o.orderid = p.orderid;

-- Q7: Triple JOIN: Customer-Order-Payment
SELECT c.name, o.orderid, o.totalamount, p.method
FROM customers c 
JOIN orders o ON c.customerid = o.customerid
JOIN payments p ON o.orderid = p.orderid;

-- =====================================================
-- LEVEL 5: SUBQUERIES 
-- =====================================================

-- Q1: Products above average price
SELECT name, price FROM products 
WHERE price > (SELECT AVG(price) FROM products);

-- Q2: Customers with at least one order
SELECT name FROM customers 
WHERE customerid IN (SELECT DISTINCT customerid FROM orders);

-- Q3: Orders above customer average
SELECT o.orderid, o.totalamount, o.customerid
FROM orders o
WHERE o.totalamount > (
    SELECT AVG(o2.totalamount) 
    FROM orders o2 WHERE o2.customerid = o.customerid
);

-- Q4: Customers with no orders
SELECT name FROM customers 
WHERE customerid NOT IN (SELECT DISTINCT customerid FROM orders);

-- Q5: Products never ordered
SELECT name FROM products 
WHERE productid NOT IN (SELECT DISTINCT productid FROM order_items);

-- Q6: Highest order per customer
SELECT c.name, o.orderid, o.totalamount
FROM customers c JOIN orders o ON c.customerid = o.customerid
WHERE (o.customerid, o.totalamount) IN (
    SELECT customerid, MAX(totalamount)
    FROM orders GROUP BY customerid
);

-- Q7: Highest order per customer with names
SELECT c.name, MAX(o.totalamount) AS highest_order
FROM customers c JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.name;

-- =====================================================
-- LEVEL 6: SET OPERATIONS 
-- =====================================================

-- Q1: Customers who ordered OR reviewed (UNION)
SELECT DISTINCT 'Order' AS activity, customerid FROM orders
UNION ALL
SELECT DISTINCT 'Review' AS activity, customerid FROM product_reviews;

-- Q2: Customers who ordered AND reviewed (No INTERSECT - JOIN)
SELECT DISTINCT c.name AS highly_engaged_customers
FROM customers c
INNER JOIN orders o ON c.customerid = o.customerid
INNER JOIN product_reviews pr ON c.customerid = pr.customerid;
