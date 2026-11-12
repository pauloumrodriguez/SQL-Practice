SELECT
  age_breakdown.age_bucket,
  ROUND(
    100.0 * SUM(activities.time_spent)
      FILTER (WHERE activities.activity_type = 'send')
    / SUM(activities.time_spent),
    2
  ) AS send_perc,
  ROUND(
    100.0 * SUM(activities.time_spent)
      FILTER (WHERE activities.activity_type = 'open')
    / SUM(activities.time_spent),
    2
  ) AS open_perc
FROM activities
INNER JOIN age_breakdown
  ON activities.user_id = age_breakdown.user_id
WHERE activities.activity_type IN ('send', 'open')
GROUP BY age_breakdown.age_bucket;
