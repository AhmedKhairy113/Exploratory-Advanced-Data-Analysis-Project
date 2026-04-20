/* =========================================
   DIMENSION EXPLORATION
   Identify unique values (categories)
========================================= */

-- Customer Full Names
SELECT DISTINCT
    first_name + ' ' + last_name AS full_name
FROM 
    gold.dim_customers;


-- Customer Countries
SELECT DISTINCT
    country
FROM 
    gold.dim_customers;


-- Product Categories
SELECT DISTINCT
    category
FROM 
    gold.dim_products;


-- Product Subcategories
SELECT DISTINCT
    subcategory
FROM 
    gold.dim_products;


-- Category, Subcategory, Product Name
SELECT DISTINCT
    category,
    subcategory,
    product_name
FROM 
    gold.dim_products
ORDER BY 
    category,
    subcategory,
    product_name;