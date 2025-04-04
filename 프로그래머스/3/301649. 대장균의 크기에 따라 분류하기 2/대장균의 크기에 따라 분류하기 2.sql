# ID,                     PARENT_ID,              SIZE_OF_COLONY,         DIFFERENTIATION_DATE,       GENOTYPE
# 대장균 개체의 ID,         부모 개체의 ID,          개체의 크기,             분화되어 나온 날짜,          개체의 형질

# 문제
#     대장균 개체의 크기를 내름차순으로 정렬했을 때 상위 0% ~ 25% 를 'CRITICAL',
#     'CRITICAL', 26% ~ 50% 를 'HIGH'
#     1% ~ 75% 를 'MEDIUM', 
#      76% ~ 100% 를 'LOW
#      대장균 개체의 ID(ID) 와 분류된 이름(COLONY_NAME)을 출력
#      개체의 ID 에 대해 오름차순 정렬
#      총 데이터의 수는 4의 배수이며 같은 사이즈의 대장균 개체가 서로 다른 이름으로 분류되는 경우는 없습니다. => 소수점 문제 없게끔?

# SELECT
#     temp.ID, 
#     CASE
#         WHEN temp.SIZE BETWEEN 0 AND 0.25 THEN "CRITICAL"
#         WHEN temp.SIZE BETWEEN 0.26 AND 0.5 THEN "HIGH"
#         WHEN temp.SIZE BETWEEN 0.51 AND 0.75 THEN "MEDIUM"
#         ELSE "LOW"
#     END AS COLONY_NAME#,
#     # temp.SIZE, temp.SIZE_OF_COLONY
# FROM(
#     SELECT
#         ID, SIZE_OF_COLONY, PERCENT_RANK() OVER(ORDER BY SIZE_OF_COLONY DESC) AS SIZE
#     FROM ECOLI_DATA
#     ) AS temp
# ORDER BY temp.ID ASC



SELECT
    temp.ID, 
    CASE
        WHEN temp.SIZE = 1 THEN "CRITICAL"
        WHEN temp.SIZE = 2 THEN "HIGH"
        WHEN temp.SIZE = 3 THEN "MEDIUM"
        ELSE "LOW"
    END AS COLONY_NAME
FROM(
    SELECT
        ID, SIZE_OF_COLONY, NTILE(4) OVER(ORDER BY SIZE_OF_COLONY DESC) AS SIZE
    FROM ECOLI_DATA
    ) AS temp
ORDER BY temp.ID ASC
