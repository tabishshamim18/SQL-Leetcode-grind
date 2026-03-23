# Write your MySQL query statement below
SELECT
    a.name AS name
FROM
    employee a
JOIN
    employee b
ON
    a.id =  b.managerid
GROUP BY
    a.id
HAVING
    COUNT(b.id) >=5