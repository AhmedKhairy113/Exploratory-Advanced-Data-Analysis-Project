
-- =========================================
-- Measures Exploration
-- Key Business Metrics
-- =========================================

SELECT 
    'Total Sales' AS measure_name,
    SUM(sales_amount) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 
    'Total Quantity',
    SUM(quantity)
FROM gold.fact_sales

UNION ALL

SELECT 
    'Average Price',
    AVG(price)
FROM gold.fact_sales

UNION ALL

SELECT 
    'Total Orders',
    COUNT(DISTINCT order_number)
FROM gold.fact_sales

UNION ALL

SELECT 
    'Unique Customers',
    COUNT(DISTINCT customer_key)
FROM gold.fact_sales

UNION ALL

SELECT 
    'Average Order Value',
    ROUND(CAST(SUM(sales_amount) AS FLOAT) / COUNT(DISTINCT order_number),2)
FROM gold.fact_sales;
