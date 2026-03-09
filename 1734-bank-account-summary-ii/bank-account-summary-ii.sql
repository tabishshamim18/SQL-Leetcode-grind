SELECT
    name,
    SUM(amount) AS balance
FROM
    users u
LEFT JOIN
    transactions t
ON
    u.account = t.account
GROUP BY
    u.name
HAVING SUM(amount) > 10000
