# Write your MySQL query statement below
SELECT
    e1.employee_id,
    e1.name,
    COUNT(DISTINCT e2.employee_id) AS reports_count,
    ROUND(
        SUM(e2.age)/COUNT(e2.employee_id)
        ) AS average_age
FROM
    employees e1
JOIN
    employees e2
ON
    e1.employee_id = e2.reports_to
GROUP BY
    e1.employee_id,
    e1.name
ORDER BY
    e1.employee_id