SELECT
  employee.employee_id,
  employee.name AS employee_name
FROM employee
INNER JOIN employee AS manager
  ON employee.manager_id = manager.employee_id
WHERE employee.salary > manager.salary;
