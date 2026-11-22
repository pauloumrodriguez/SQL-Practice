SELECT
  transaction_date,
  user_id,
  COUNT(product_id) AS purchase_count
FROM (
  SELECT
    transaction_date,
    user_id,
    product_id,
    RANK() OVER (
      PARTITION BY user_id
      ORDER BY transaction_date DESC
    ) AS transaction_rank
  FROM user_transactions
) AS ranked_transactions
WHERE transaction_rank = 1
GROUP BY transaction_date, user_id
ORDER BY transaction_date;
