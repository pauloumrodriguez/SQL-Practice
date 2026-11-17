WITH ranked_prices AS (
  SELECT
    ticker,
    date,
    open,
    ROW_NUMBER() OVER (
      PARTITION BY ticker
      ORDER BY open DESC
    ) AS highest_rank,
    ROW_NUMBER() OVER (
      PARTITION BY ticker
      ORDER BY open
    ) AS lowest_rank
  FROM stock_prices
)

SELECT
  ticker,
  MAX(TO_CHAR(date, 'Mon-YYYY'))
    FILTER (WHERE highest_rank = 1) AS highest_mth,
  MAX(open)
    FILTER (WHERE highest_rank = 1) AS highest_open,
  MAX(TO_CHAR(date, 'Mon-YYYY'))
    FILTER (WHERE lowest_rank = 1) AS lowest_mth,
  MAX(open)
    FILTER (WHERE lowest_rank = 1) AS lowest_open
FROM ranked_prices
GROUP BY ticker
ORDER BY ticker;
