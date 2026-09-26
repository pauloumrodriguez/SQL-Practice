SELECT
  pages.page_id
FROM pages
WHERE NOT EXISTS (
  SELECT 1
  FROM page_likes
  WHERE page_likes.page_id = pages.page_id
)
ORDER BY pages.page_id;
