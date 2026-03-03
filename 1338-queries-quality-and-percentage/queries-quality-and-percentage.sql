SELECT
    query_name,
    ROUND(SUM((rating/position))/COUNT(*),2) AS quality,
    IFNULL(ROUND(SUM(CASE WHEN rating < 3 THEN 1 END)/COUNT(*)*100,2),0) AS poor_query_percentage
FROM
    queries
GROUP BY
    query_name