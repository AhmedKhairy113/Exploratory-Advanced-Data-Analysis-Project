/* =========================================
   MAGNITUDE ANALYSIS
   Compare Measures by Categories
========================================= */


-- =========================================
-- 1. Total Customers by Country
-- =========================================
SELECT 
    country,
    COUNT(DISTINCT customer_key) AS total_customers
FROM 
    gold.dim_customers
GROUP BY 
    country
ORDER BY 
    total_customers DESC;



-- =========================================
-- 2. Total Customers by Gender
-- =========================================
SELECT 
    gender,
    COUNT(DISTINCT customer_key) AS total_customers
FROM 
    gold.dim_customers
GROUP BY 
    gender
ORDER BY 
    total_customers DESC;



-- =========================================
-- 3. Total Products by Category
-- =========================================
SELECT 
    category,
    COUNT(DISTINCT product_key) AS total_products
FROM 
    gold.dim_products
GROUP BY 
    category
ORDER BY 
    total_products DESC;



-- =========================================
-- 4. Average Cost by Category
-- =========================================
SELECT 
    category,
    ROUND(AVG(cost), 2) AS avg_cost
FROM 
    gold.dim_products
GROUP BY 
    category
ORDER BY 
    avg_cost DESC;



-- =========================================
-- 5. Total Revenue by Category
-- =========================================
SELECT 
    p.category,
    SUM(f.sales_amount) AS total_revenue
FROM 
    gold.fact_sales f
JOIN 
    gold.dim_products p 
        ON f.product_key = p.product_key
GROUP BY 
    p.category
ORDER BY 
    total_revenue DESC;



-- =========================================
-- 6. Total Revenue per Customer
-- =========================================
SELECT 
    c.customer_key,
    c.first_name + ' ' + c.last_name AS customer_name,
    SUM(f.sales_amount) AS total_revenue
FROM 
    gold.fact_sales f
JOIN 
    gold.dim_customers c 
        ON f.customer_key = c.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY 
    total_revenue DESC;



-- =========================================
-- 7. Distribution of Sold Items Across Countries
-- =========================================
SELECT 
    c.country,
    SUM(f.quantity) AS total_items_sold
FROM 
    gold.fact_sales f
JOIN 
    gold.dim_customers c 
        ON f.customer_key = c.customer_key
GROUP BY 
    c.country
ORDER BY 
    total_items_sold DESC;