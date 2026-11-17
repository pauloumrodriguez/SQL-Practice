WITH ranked_products AS (
  SELECT
    products.category_name,
    products.product_name,
    RANK() OVER (
      PARTITION BY products.category_name
      ORDER BY
        product_sales.sales_quantity DESC,
        product_sales.rating DESC
    ) AS product_rank
  FROM products
  INNER JOIN product_sales
    ON products.product_id = product_sales.product_id
)

SELECT
  category_name,
  product_name
FROM ranked_products
WHERE product_rank = 1
ORDER BY category_name;
