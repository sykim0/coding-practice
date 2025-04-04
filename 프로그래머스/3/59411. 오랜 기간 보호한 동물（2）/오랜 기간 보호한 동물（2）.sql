# 입양을 간 동물 중, 보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 이때 결과는 보호 기간이 긴 순으로 조회해야 합니다.
# DATE_DIFF(입양 간, 입양 시작) => 시간 상 늦은 날짜가 먼저 옴.
# TIMESTAMPDIFF(day, 시작, 가버린) => 위와 반대

WITH time_interval AS(
    SELECT
        ai.ANIMAL_ID, ai.NAME, ai.DATETIME AS start_date, 
        ao.DATETIME AS end_date, TIMESTAMPDIFF(minute, ai.DATETIME, ao.DATETIME) AS start_end_interval,
        DATEDIFF(ai.DATETIME, ao.DATETIME) AS start_end_interval2
    FROM ANIMAL_INS ai
    INNER JOIN ANIMAL_OUTS ao
    ON ai.ANIMAL_ID = ao.ANIMAL_ID
)

SELECT
    ANIMAL_ID, NAME
FROM time_interval
ORDER BY start_end_interval DESC
limit 2