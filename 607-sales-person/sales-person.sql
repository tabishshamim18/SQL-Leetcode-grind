# Write your MySQL query statement below
SELECT
    name
FROM
    salesPerson
WHERE
    sales_id NOT IN (
        SELECT
            sales_id
        FROM
            company c
        JOIN
            orders o
        ON
            c.com_id = o.com_id
        WHERE
            name = "RED"

)