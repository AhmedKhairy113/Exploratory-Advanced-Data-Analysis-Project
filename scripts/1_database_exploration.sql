/* =========================================
   DATABASE EXPLORATION
========================================= */

-- Explore All Tables in Database
SELECT 
    *
FROM 
    INFORMATION_SCHEMA.TABLES;



/* =========================================
   EXPLORE COLUMNS IN DATABASE
========================================= */

-- dim_customers
SELECT 
    *
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'dim_customers';


-- dim_products
SELECT 
    *
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'dim_products';


-- fact_sales
SELECT 
    *
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'fact_sales';
