WITH RECURSIVE gen_tree AS(
    # 첫 세대
    SELECT 
        ID, 1 AS GENERATION, PARENT_ID
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL
    
    UNION ALL
    
    SELECT
        p.ID, g.GENERATION + 1, p.PARENT_ID
    FROM ECOLI_DATA p
    JOIN gen_tree g
    ON p.PARENT_ID = g.ID
)

SELECT
    COUNT(g.ID) AS COUNT, g.GENERATION
FROM gen_tree g
WHERE g.ID NOT IN(
    SELECT DISTINCT
        p.ID
    FROM gen_tree p
    INNER JOIN gen_tree c
    ON p.ID = c.PARENT_ID
)
GROUP BY 2
ORDER BY 2

