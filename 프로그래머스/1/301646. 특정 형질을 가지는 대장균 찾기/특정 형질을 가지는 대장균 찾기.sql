-- 코드를 작성해주세요
# 이진수로 변환했을 때 형질 순서는 4,3,2,1
# SUBSTR은 이진수가 4자리가 아니라 자릿수에 맞춰 나와서 안될 듯함..

WITH decimal_to_binary AS(
    SELECT 
        *, CAST(CONV(GENOTYPE, 10, 2) AS CHAR(10000000)) AS GENOTYPE_BINARY
    FROM ECOLI_DATA
),
without_type2 AS(
    SELECT
        *
    FROM decimal_to_binary
    WHERE GENOTYPE_BINARY NOT LIKE '%1_' # 10, 1110, 111
)

SELECT 
    COUNT(ID) AS COUNT
    # *
FROM without_type2
WHERE 
    GENOTYPE_BINARY LIKE '%1__' 
    OR 
    GENOTYPE_BINARY LIKE '%1'