# Write your MySQL query statement below
SELECT
    book_id,
    title,
    author,
    genre,
    publication_year,
    current_borrowers
FROM(
        SELECT
            l.*,
            COUNT(b.book_id) as current_borrowers
        FROM
            borrowing_records b
        JOIN
            library_books l
        ON
            b.book_id = l.book_id
        WHERE
            return_date IS NULL
        GROUP BY
            1,2,3,4,5,6
) a
WHERE
    total_copies - current_borrowers = 0
ORDER BY
    current_borrowers DESC,
    title