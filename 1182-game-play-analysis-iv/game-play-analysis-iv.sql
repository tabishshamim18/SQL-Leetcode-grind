# Write your MySQL query statement below
WITH cte AS(
        SELECT
            player_id,
            LEAD(event_date) OVER(PARTITION BY player_id ORDER BY event_date) AS next_day,
            event_date,
            ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS rn
        FROM
            activity
)
SELECT
    ROUND(
        COUNT(
            DISTINCT
            CASE
                WHEN DATEDIFF(next_day, event_date) = 1 THEN player_id END)/COUNT(DISTINCT player_id)
                    , 2) AS fraction
FROM
    cte
WHERE rn = 1