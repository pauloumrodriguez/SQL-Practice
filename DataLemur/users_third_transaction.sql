SELECT
  user_id,
  spend,
  transaction_date
FROM (
  SELECT
    user_id,
    spend,
    transaction_date,
    ROW_NUMBER() OVER (
      PARTITION BY user_id
      ORDER BY transaction_date
    ) AS row_num
  FROM transactions
) AS ranked_transactions
WHERE row_num = 3;
