# Write your MySQL query statement below
WITH a AS (
    SELECT 'Low Salary' AS category
    UNION
    SELECT'Average Salary'
    UNION
    SELECT 'High Salary'
),
b AS(
    SELECT
    CASE
        WHEN income < 20000 THEN 'Low Salary'
        WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
        WHEN income > 20000 THEN 'High Salary'
        END AS category,
        COUNT(*) AS account_count
FROM
    accounts
GROUP BY
    CASE
        WHEN income < 20000 THEN 'Low Salary'
        WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
        WHEN income > 20000 THEN 'High Salary'
        END

)
SELECT
    a.category,
    IFNULL(b.account_count,0) AS accounts_count
FROM a
LEFT JOIN b
USING(category)


