# Write your MySQL query statement below
WITH cte AS(
        SELECT
            id,
            LAG(num) OVER() AS prev_num,
            num,
            LEAD(num) OVER() AS next_num
        FROM
            logs)
SELECT
    MAX(CASE WHEN num = prev_num AND num = next_num THEN num
    END) AS ConsecutiveNums
FROM cte
GROUP BY num
HAVING MAX(CASE WHEN num = prev_num AND num = next_num THEN num
    END) IS NOT NULL