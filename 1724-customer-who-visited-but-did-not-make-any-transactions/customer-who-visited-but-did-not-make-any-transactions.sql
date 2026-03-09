SELECT
    customer_id,
    SUM(CASE WHEN t.visit_id IS NULL THEN 1 END) AS count_no_trans
FROM
    visits v
LEFT JOIN
    transactions t
ON
    v.visit_id = t.visit_id
GROUP BY
    customer_id
HAVING
    SUM(CASE WHEN t.visit_id IS NULL THEN 1 END) IS NOT NULL
ORDER BY
    count_no_trans DESC