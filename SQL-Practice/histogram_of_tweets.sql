WITH tweets_por_usuario AS (
  SELECT 
    user_id,
    COUNT(tweet_id) AS tweet_bucket
  FROM tweets
  WHERE tweet_date >= '2022-01-01' 
    AND tweet_date < '2023-01-01'
  GROUP BY user_id
)
SELECT 
  tweet_bucket,
  COUNT(user_id) AS users_num
FROM tweets_por_usuario
GROUP BY tweet_bucket
ORDER BY tweet_bucket;
