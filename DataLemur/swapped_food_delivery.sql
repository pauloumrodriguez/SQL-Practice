WITH order_counts AS (
  SELECT
    COUNT(order_id) AS total_orders
  FROM orders
)

SELECT
  CASE
    WHEN order_id % 2 = 1 AND order_id = total_orders THEN order_id
    WHEN order_id % 2 = 1 THEN order_id + 1
    ELSE order_id - 1
  END AS corrected_order_id,
  item
FROM orders
CROSS JOIN order_counts
ORDER BY corrected_order_id;
