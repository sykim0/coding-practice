-- 코드를 작성해주세요
WITH child_and_parent AS(
    SELECT 
        parent.ID AS parent_ID, child.ID AS child_ID
    FROM ECOLI_DATA child
    INNER JOIN ECOLI_DATA parent
    on child.PARENT_ID =  parent.ID
),

child_exist AS(
    SELECT
        parent_ID, COUNT(parent_ID) AS CHILD_COUNT 
    FROM child_and_parent
    GROUP BY parent_ID
),
zero_count AS(
    SELECT
        ID, 0 AS CHILD_COUNT
    FROM ECOLI_DATA
)

# SELECT * FROM child_and_parent
# SELECT * FROM child_exist
# SELECT * FROM zero_count


SELECT
    e.ID, COALESCE(ce.CHILD_COUNT, 0) AS CHILD_COUNT
FROM child_exist ce
# RIGHT JOIN zero_count z
RIGHT JOIN ECOLI_DATA  e
ON e.ID = ce.parent_ID
ORDER BY 1