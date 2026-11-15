WITH ranked_salaries AS (
  SELECT
    name,
    salary,
    department_id,
    DENSE_RANK() OVER (
      PARTITION BY department_id
      ORDER BY salary DESC
    ) AS ranking
  FROM employee
)

SELECT
  department.department_name,
  ranked_salaries.name,
  ranked_salaries.salary
FROM ranked_salaries
INNER JOIN department
  ON ranked_salaries.department_id = department.department_id
WHERE ranked_salaries.ranking <= 3
ORDER BY
  department.department_name,
  ranked_salaries.salary DESC,
  ranked_salaries.name;
