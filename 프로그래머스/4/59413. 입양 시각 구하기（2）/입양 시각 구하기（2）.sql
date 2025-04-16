# 요구사항 : 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보기

# 자연어를 SQL로 옮기면

# 문제
#     0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회
#     시간대순 정렬

# 그냥 시간 뽑아서 시간별 count하면.. 카운팅이 없는 시간대는 출력이 안됨.

# 반복으로 생성.
WITH RECURSIVE all_hours AS(
    SELECT 
        0 AS hour
    
    UNION ALL
    
    SELECT 
        hour + 1
    FROM all_hours 
    WHERE hour < 23
),

exists_hours AS(
    SELECT
        HOUR(DATETIME) AS HOUR, COUNT(ANIMAL_ID) AS 'COUNT'
    FROM ANIMAL_OUTS 
    GROUP BY 1
)

SELECT
    a.HOUR, COALESCE(e.COUNT, 0) AS 'COUNT'
FROM all_hours a
LEFT JOIN exists_hours e
ON a.HOUR = e.HOUR
ORDER BY 1