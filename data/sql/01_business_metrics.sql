-- Portfolio KPI summary
SELECT
    COUNT(*) AS total_customers,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    ROUND(AVG(total_orders), 2) AS average_orders_per_customer,
    ROUND(AVG(average_order_value), 2) AS average_order_value,
    ROUND(AVG(average_review_score), 2) AS average_review_score,
    SUM(CASE WHEN risk_level = 'High' THEN 1 ELSE 0 END) AS high_risk_customers,
    ROUND(
        100.0 * SUM(CASE WHEN risk_level = 'High' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS high_risk_customer_rate_pct
FROM customer_360;


-- Revenue, quality, and delivery performance by customer segment
SELECT
    customer_segment,
    COUNT(*) AS customers,
    ROUND(SUM(total_revenue), 2) AS revenue,
    ROUND(100.0 * SUM(total_revenue) / SUM(SUM(total_revenue)) OVER (), 2)
        AS revenue_share_pct,
    ROUND(AVG(average_order_value), 2) AS average_order_value,
    ROUND(AVG(average_review_score), 2) AS average_review_score,
    ROUND(100.0 * AVG(late_order_rate), 2) AS late_delivery_rate_pct
FROM customer_360
GROUP BY customer_segment
ORDER BY revenue DESC;


-- Customer action queue for retention work
SELECT
    customer_unique_id,
    customer_state,
    customer_segment,
    risk_level,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(average_review_score, 2) AS average_review_score,
    ai_customer_summary,
    recommended_next_action
FROM customer_360
WHERE risk_level = 'High'
ORDER BY total_revenue DESC
LIMIT 50;