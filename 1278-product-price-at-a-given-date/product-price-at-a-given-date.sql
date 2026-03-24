# Write your MySQL query statement below
WITH P AS(
    SELECT product_id,
    new_price AS price
    FROM products
    WHERE (product_id,change_date) IN
    (SELECT
        product_id,
        MAX(change_date) AS change_date
    FROM
        products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id)),
    T AS(
        SELECT DISTINCT product_id FROM products
    )
SELECT
    T.product_id,
    IFNULL(P.price, 10) AS price
FROM T
LEFT JOIN P
USING(product_id)