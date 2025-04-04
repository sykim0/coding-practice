# ECOLI_DATA : 대장균 정보
# ID,                 PARENT_ID,          SIZE_OF_COLONY,      DIFFERENTIATION_DATE,       GENOTYPE
# 대장균 개체의 ID, 부모 개체의 ID,              개체의 크기,         분화되어 나온 날짜,         개체의 형질

# 문제 => 그냥 CASE WHEN
#     대장균 개체의 크기가 100 이하라면 'LOW
#     100 초과 1000 이하라면 'MEDIUM',
#     1000 초과라면 'HIGH' 라고 분류
#     대장균 개체의 ID(ID) 와 분류(SIZE)를 출력
#     개체의 ID 에 대해 오름차순 정렬
    
SELECT
    ID,
    CASE
        WHEN SIZE_OF_COLONY <= 100 THEN "LOW"
        WHEN SIZE_OF_COLONY > 1000 THEN "HIGH"
        ELSE "MEDIUM"
    END AS "SIZE"
FROM ECOLI_DATA
ORDER BY 1 ASC