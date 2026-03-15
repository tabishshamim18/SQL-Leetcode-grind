# Write your MySQL query statement below
SELECT employee_id
FROM (
SELECT e.employee_id
FROM employees e
LEFT JOIN salaries s
ON e.employee_id = s.employee_id
WHERE s.employee_id IS NULL
UNION ALL
SELECT s.employee_id
FROM employees e
RIGHT JOIN salaries s
ON e.employee_id = s.employee_id
WHERE e.employee_id IS NULL) a
ORDER BY employee_id