SELECT
    customer_id,
    SUM(amount) AS total_spent,
    CASE
        WHEN SUM(amount) >= 10000 THEN 'high_value'
        WHEN SUM(amount) >= 5000 THEN 'mid_value'
        ELSE 'standard'
    END AS customer_segment
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;
