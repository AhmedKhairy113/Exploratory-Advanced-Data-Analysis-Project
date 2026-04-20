/* =========================================
   RANKING ANALYSIS
   Top / Bottom Products by Revenue
========================================= */


-- =========================================
-- 1. Top 5 Products by Revenue (Simple Method)
-- =========================================
SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM 
    gold.fact_sales f
JOIN 
    gold.dim_products p 
        ON f.product_key = p.product_key
GROUP BY 
    p.product_name
ORDER BY 
    total_revenue DESC;



-- =========================================
-- 2. Bottom 5 Products by Revenue (Window Function)
-- =========================================
SELECT 
    product_name,
    total_revenue
FROM (
    SELECT 
        p.product_name,
        SUM(f.sales_amount) AS total_revenue,
        ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) ASC) AS rn
    FROM 
        gold.fact_sales f
    JOIN 
        gold.dim_products p 
            ON f.product_key = p.product_key
    GROUP BY 
        p.product_name
) t
WHERE 
    rn <= 5;