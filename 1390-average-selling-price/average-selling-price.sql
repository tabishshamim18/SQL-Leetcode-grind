SELECT
    p.product_id,
    IFNULL(ROUND(SUM(units * price)/SUM(units), 2), 0) AS average_price
FROM
    prices p
LEFT JOIN
    unitssold u
ON
    p.product_id = u.product_id AND
    start_date <= purchase_date AND end_date >= purchase_date
GROUP BY
    p.product_id