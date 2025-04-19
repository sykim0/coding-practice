WITH over_gen_3 AS(
    SELECT
        c.ID AS child_id, p.PARENT_ID AS parent_ID
    FROM ECOLI_DATA c
    INNER JOIN ECOLI_DATA p
    ON c.PARENT_ID = p.ID
    WHERE p.PARENT_ID IS NOT NULL
)

SELECT
    o.child_id AS ID
FROM over_gen_3 o
INNER JOIN ECOLI_DATA p
on o.parent_ID = p.ID
WHERE p.PARENT_ID IS NULL
ORDER BY 1 ASC
