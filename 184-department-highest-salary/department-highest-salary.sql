# Write your MySQL query statement below
WITH cte AS(
        SELECT
            d.name AS department,
            e.name AS employee,
            salary,
            RANK() OVER(PARTITION BY d.name ORDER BY salary DESC) AS rnk
        FROM
            department d
        JOIN
            employee e
        ON
            d.id = e.departmentid
)
SELECT
    department,
    employee,
    salary
FROM
    cte
WHERE rnk = 1