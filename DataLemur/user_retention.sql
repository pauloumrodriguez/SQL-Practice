SELECT
  EXTRACT(MONTH FROM curr_month.event_date) AS mth,
  COUNT(DISTINCT curr_month.user_id) AS monthly_active_users
FROM user_actions AS curr_month
WHERE DATE_TRUNC('month', curr_month.event_date) = '2022-07-01'
  AND EXISTS (
    SELECT 1
    FROM user_actions AS last_month
    WHERE last_month.user_id = curr_month.user_id
      AND DATE_TRUNC('month', last_month.event_date) =
        DATE_TRUNC('month', curr_month.event_date) - INTERVAL '1 month'
  )
GROUP BY EXTRACT(MONTH FROM curr_month.event_date);
