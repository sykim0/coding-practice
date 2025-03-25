WITH child_and_parent AS(
    SELECT
        child.ID, child.GENOTYPE AS GENOTYPE,
        parent.GENOTYPE AS PARENT_GENOTYPE
    FROM ECOLI_DATA child
    INNER JOIN ECOLI_DATA parent
    ON child.PARENT_ID = parent.ID
)

# SELECT * FROM child_and_parent

SELECT
    * 
FROM child_and_parent
WHERE (GENOTYPE & PARENT_GENOTYPE) = PARENT_GENOTYPE
ORDER BY 1 ASC