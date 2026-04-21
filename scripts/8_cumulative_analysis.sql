/* =========================================
  Cumulative Trends & Moving Averages
========================================= */


-- =========================================
-- Running Total Sales (Cumulative)
-- =========================================
SELECT 
    order_month,
    total_sales,
    SUM(total_sales) OVER (
        ORDER BY order_month
    ) AS running_total_sales
FROM (
    SELECT 
        DATETRUNC(MONTH, order_date) AS order_month,
        SUM(sales_amount) AS total_sales
    FROM 
        gold.fact_sales
    WHERE 
        order_date IS NOT NULL
    GROUP BY 
        DATETRUNC(MONTH, order_date)
) t
ORDER BY 
    order_month;



-- =========================================
-- Moving Average (3 Months)
-- =========================================
SELECT 
    order_month,
    total_sales,
    AVG(total_sales) OVER (
        ORDER BY order_month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_3_months
FROM (
    SELECT 
        DATETRUNC(MONTH, order_date) AS order_month,
        SUM(sales_amount) AS total_sales
    FROM 
        gold.fact_sales
    WHERE 
        order_date IS NOT NULL
    GROUP BY 
        DATETRUNC(MONTH, order_date)
) t
ORDER BY 
    order_month;