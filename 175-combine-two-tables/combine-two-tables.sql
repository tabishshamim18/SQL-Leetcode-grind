/* Write your T-SQL query statement below */
SELECT
    firstname,
    lastName,
    city,
    state
FROM
    person p
LEFT JOIN
    address a
ON
    p.personID=a.personID
