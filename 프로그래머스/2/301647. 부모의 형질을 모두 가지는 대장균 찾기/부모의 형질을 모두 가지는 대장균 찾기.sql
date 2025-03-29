SELECT
    child.ID, child.GENOTYPE, parent.GENOTYPE AS PARENT_GENOTYPE
FROM ECOLI_DATA child
INNER JOIN ECOLI_DATA parent
ON child.PARENT_ID = parent.ID
WHERE parent.GENOTYPE = child.GENOTYPE & parent.GENOTYPE
ORDER BY child.ID