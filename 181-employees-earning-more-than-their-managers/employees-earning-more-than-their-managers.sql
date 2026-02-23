# Write your MySQL query statement below
 SELECT
    e.name AS Employee
FROM
    employee e
JOIN
    employee m
ON
    m.id=e.managerid
    AND e.salary > m.salary
