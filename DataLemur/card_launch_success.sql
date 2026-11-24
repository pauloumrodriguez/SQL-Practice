SELECT
  card_name,
  issued_amount
FROM (
  SELECT
    card_name,
    issued_amount,
    ROW_NUMBER() OVER (
      PARTITION BY card_name
      ORDER BY issue_year, issue_month
    ) AS launch_rank
  FROM monthly_cards_issued
) AS ranked_cards
WHERE launch_rank = 1
ORDER BY issued_amount DESC;
