WITH employee_queries AS (
  SELECT
    employees.employee_id,
    COUNT(DISTINCT queries.query_id) AS unique_queries
  FROM employees
  LEFT JOIN queries
    ON employees.employee_id = queries.employee_id
    AND queries.query_starttime >= '2023-07-01'
    AND queries.query_starttime < '2023-10-01'
  GROUP BY employees.employee_id
)

SELECT
  unique_queries,
  COUNT(employee_id) AS employee_count
FROM employee_queries
GROUP BY unique_queries
ORDER BY unique_queries;
