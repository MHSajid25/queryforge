-- Revenue by month with growth calculation

WITH monthly_revenue AS (
    SELECT 
        DATE_TRUNC('month', order_date) AS month,
        SUM(amount) AS revenue
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
),

growth AS (
    SELECT 
        month,
        revenue,
        LAG(revenue) OVER (ORDER BY month) AS previous_revenue
    FROM monthly_revenue
)

SELECT 
    month,
    revenue,
    previous_revenue,
    ROUND(
        ((revenue - previous_revenue) / previous_revenue) * 100, 
        2
    ) AS growth_percentage
FROM growth;
