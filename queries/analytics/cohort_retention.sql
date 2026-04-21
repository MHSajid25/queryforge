-- Cohort retention analysis

WITH first_order AS (
    SELECT 
        user_id,
        MIN(order_date) AS first_purchase
    FROM orders
    GROUP BY user_id
),

cohort_data AS (
    SELECT 
        o.user_id,
        DATE_TRUNC('month', f.first_purchase) AS cohort_month,
        DATE_TRUNC('month', o.order_date) AS activity_month
    FROM orders o
    JOIN first_order f ON o.user_id = f.user_id
),

cohort_index AS (
    SELECT 
        cohort_month,
        activity_month,
        EXTRACT(MONTH FROM AGE(activity_month, cohort_month)) AS month_number,
        COUNT(DISTINCT user_id) AS users
    FROM cohort_data
    GROUP BY cohort_month, activity_month
)

SELECT * FROM cohort_index
ORDER BY cohort_month, month_number;
