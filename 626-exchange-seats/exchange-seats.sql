# Write your MySQL query statement below
WITH cte As(
        SELECT
            id,
            student,
            COUNT(*) OVER() As cnt
        FROM
            seat)
SELECT
    CASE WHEN id%2!=0 AND id!=cnt THEN LEAD(id-1) OVER()
    WHEN id%2=0 THEN LAG(id+1) OVER()
    ELSE id END AS id,
    CASE WHEN id%2!=0 AND id!=cnt THEN LEAD(student) OVER()
    WHEN id%2=0 THEN LAG(student) OVER()
    ELSE student END AS student
FROM cte
