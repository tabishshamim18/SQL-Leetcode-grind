# Write your MySQL query statement below
SELECT
    user_id AS buyer_id,
    join_date,
    IFNULL(COUNT(CASE WHEN YEAR(order_date) = 2019 THEN buyer_id END),0) AS orders_in_2019
FROM
    users u
LEFT JOIN
    orders o
ON
    u.user_id = o.buyer_id
GROUP BY
    user_id,
    join_date