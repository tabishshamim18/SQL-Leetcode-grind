# Write your MySQL query statement below
SELECT
    user_id,
    MAX(time_stamp) AS last_stamp
FROM
    logins
WHERE
    YEAR(time_Stamp) = 2020
GROUP BY
    user_id