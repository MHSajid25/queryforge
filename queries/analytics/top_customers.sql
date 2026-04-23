-- Top customers by total revenue

SELECT 
    customer_id,
    SUM(amount) AS total_spent,
    COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;
