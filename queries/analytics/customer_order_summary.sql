SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(amount) AS total_revenue,
    AVG(amount) AS average_order_value
FROM orders
GROUP BY customer_id
ORDER BY total_revenue DESC;
