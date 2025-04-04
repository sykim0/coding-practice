# FISH_INFO : 물고기 정보
# ID,             FISH_TYPE,          LENGTH,                 TIME    
# 물고기의 ID, 물고기의 종류(숫자), 잡은 물고기의 길이(cm), 물고기를 잡은 날짜

# 단, 잡은 물고기의 길이가 10cm 이하일 경우에는 LENGTH 가 NULL 이며, LENGTH 에 NULL 만 있는 경우는 없습니다.

# 문제
#  평균 길이가 33cm 이상인 물고기들을 종류별로 분류  => GROUP BY FISH_TYPE, HAVING AVG(LENGTH) >= 33
#  잡은 수, 최대 길이, 물고기의 종류  COUNT(ID) MAX(LENGTH) FISH_TYPE
#  물고기 종류에 대해 오름차순 ORDER BY FISH_TYPE
#  10cm이하의 물고기들은 10cm로 취급 => COALESCE(LENGTH, 10)

SELECT
    COUNT(ID) AS FISH_COUNT, 
    MAX(COALESCE(LENGTH, 10)) AS MAX_LENGTH,
    FISH_TYPE
FROM FISH_INFO
GROUP BY 3
HAVING AVG(COALESCE(LENGTH, 10)) >= 33
ORDER BY 3