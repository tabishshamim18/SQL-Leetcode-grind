# Write your MySQL query statement below
WITH cte AS(
            SELECT
                employee_id,
                department_id,
                primary_flag,
                COUNT(*) OVER(PARTITION BY employee_id) AS cnt
            FROM
                employee
)

SELECT
    employee_id,
    MAX(CASE
        WHEN cnt >=2 AND primary_flag = 'Y' THEN department_id
        WHEN cnt = 1 THEN department_id END)
    AS department_id
FROM cte
GROUP BY
    employee_id