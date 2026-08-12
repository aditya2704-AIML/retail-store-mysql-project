# Retail Store MySQL Project
This project models a small retail store in MySQL and uses realistic sample data plus SQL queries to answer common business questions about customers, products, orders, payments, and reviews.

## Project Overview
The database simulates a transactional retail environment with customers, products, orders, order items, payments, and product reviews.  
On top of this schema, the project includes multiple levels of SQL queries (from basics to subqueries and set operations) to practice real-world data analysis. 

## Problem Statement
Retail businesses generate large amounts of transactional data, but that data must be structured and queried properly to extract insights.  
The goal of this project is to design a normalized schema for a retail store, populate it with sample data, and write SQL queries that can answer business questions such as sales performance, customer activity, and product popularity.

## Database Design
The project creates a `retail_store` database with the following tables:
- `customers`: customer details (id, name, email, phone, created date).
- `products`: product catalog with category, price, stock quantity, and added date.
- `orders`: high-level order information including customer, date, status, and total amount.
- `order_items`: line items for each order (product, quantity, price).  
- `payments`: payments made against orders with method and amount.  
- `product_reviews`: ratings and text reviews by customers for products.

All tables are linked using foreign keys to maintain referential integrity.

## Sample Data
The script inserts realistic sample data, including:
- 30 customers with names, emails, phone numbers, and signup timestamps. 
- 20 products across categories like Home, Clothing, Electronics, Toys, and Books. 
- 50+ orders with different statuses (Delivered, Shipped, Pending, Cancelled).   
- Order items linking orders to products with quantities and item prices.  
- Payments made via Credit Card, Debit Card, UPI, and Cash. 
- 20 product reviews with ratings from 1–5 and short review texts.

This gives you a realistic dataset for practicing analytical SQL queries.

## SQL Practice Levels
The project is structured into multiple “levels” of difficulty: 

### Level 1 – Basics
Simple `SELECT` queries to: 
- list customers and emails,  
- view the product catalog,  
- filter by price ranges and categories,  
- search by customer name patterns,  
- sort products by price.

### Level 2 – Filtering & Formatting
Queries that use conditions and basic expressions to: 
- find orders with missing customer info,  
- compute line totals in `order_items`,  
- format concatenated contact information,  
- extract only the date part from datetime fields.

### Level 3 – Aggregations
Aggregate queries to answer business questions like:
- total number of orders and total revenue,  
- average order value and active customer count,  
- total spending per customer,  
- product counts and average prices per category,  
- payments grouped by payment method.

### Level 4 – Joins
Join-based queries that combine tables to show: 
- customers and their orders,  
- products that have been sold,  
- orders with their payment method,  
- customers with their order counts (including those with zero orders),  
- products with total quantity sold.

### Level 5 – Subqueries
Subqueries used to:  
- find products priced above the average,  
- identify customers with and without orders,  
- select orders above each customer’s average order value,  
- get the highest order per customer. 

### Level 6 – Set Operations & Engagement
Queries that mix activities and engagement, for example:
- customers who ordered or reviewed (using `UNION ALL`),  
- customers who have both orders and reviews (join-based “INTERSECT”). 

## What I Learned
- Designing a normalized relational schema for a retail use case.
- Writing SQL for CRUD operations and realistic analytical questions.
- Using constraints, foreign keys, and CHECK conditions to enforce data quality. 
- Applying aggregations, joins, subqueries, and set-like operations in MySQL.
- Create views for “top customers”, “top products”, or “monthly sales”.
- Write stored procedures and functions for recurring reports. 
- Connect this database to a BI tool or a Python notebook for dashboards and deeper analysis. 
