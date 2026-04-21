/* =========================================
   TIME ANALYSIS
   Sales Trends & Time-Based Insights
========================================= */


-- =========================================
-- 1. Daily Sales Trend
-- =========================================
SELECT 
    order_date,
    SUM(sales_amount) AS total_sales
FROM 
    gold.fact_sales
WHERE 
    order_date IS NOT NULL
GROUP BY 
    order_date
ORDER BY 
    order_date;



-- =========================================
-- 2. Yearly Sales Overview
-- =========================================
SELECT 
    YEAR(order_date) AS order_year,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM 
    gold.fact_sales
WHERE 
    order_date IS NOT NULL
GROUP BY 
    YEAR(order_date)
ORDER BY 
    order_year;



-- =========================================
-- 3. Monthly Sales Breakdown (Year & Month)
-- =========================================
SELECT 
    YEAR(order_date)  AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales
FROM 
    gold.fact_sales
WHERE 
    order_date IS NOT NULL
GROUP BY 
    YEAR(order_date),
    MONTH(order_date)
ORDER BY 
    order_year,
    order_month;



-- =========================================
-- 4. Monthly Sales Trend (DATETRUNC)
-- =========================================
SELECT 
    DATETRUNC(MONTH, order_date) AS month_start,
    SUM(sales_amount)            AS total_sales
FROM 
    gold.fact_sales
WHERE 
    order_date IS NOT NULL
GROUP BY 
    DATETRUNC(MONTH, order_date)
ORDER BY 
    month_start;



-- =========================================
-- 5. Monthly Sales (Formatted Year-Month)
-- =========================================
SELECT 
    FORMAT(order_date, 'yyyy-MM') AS year_month,
    SUM(sales_amount)             AS total_sales
FROM 
    gold.fact_sales
WHERE 
    order_date IS NOT NULL
GROUP BY 
    FORMAT(order_date, 'yyyy-MM')
ORDER BY 
    year_month;