/* =========================================
   DATE EXPLORATION
   Identify earliest and latest order dates
========================================= */

SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    DATEDIFF(YEAR, MIN(order_date), MAX(order_date)) AS order_span_years
FROM 
    gold.fact_sales;



/* =========================================
   CUSTOMER AGE ANALYSIS
   Find youngest and oldest customers
========================================= */

SELECT
    MIN(birthdate) AS oldest_birthdate,
    MAX(birthdate) AS youngest_birthdate,
    DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest_age,
    DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS youngest_age
FROM 
    gold.dim_customers;
