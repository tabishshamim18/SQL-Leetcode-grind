# Write your MySQL query statement below
SELECT
    p.user_id,
    COUNT(*) AS prompt_count,
    ROUND(AVG(tokens), 2) AS avg_tokens
FROM
    prompts p
JOIN
(SELECT user_id, AVG(tokens) as avg_tkns, COUNT(*) AS total FROM prompts GROUP BY user_id) a
ON p.user_id = a.user_id
WHERE (SELECT COUNT(*) FROM prompts WHERE user_id = p.user_id) >= 3
AND EXISTS (
    SELECT user_id FROM prompts WHERE user_id = p.user_id
    AND tokens > (SELECT avg(tokens) FROM prompts WHERE user_id = p.user_id)
)
GROUP BY p.user_id
ORDER BY avg_tokens DESC, p.user_id
