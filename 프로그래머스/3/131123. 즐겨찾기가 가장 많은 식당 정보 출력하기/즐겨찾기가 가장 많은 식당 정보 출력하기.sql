# REST_ID,    REST_NAME,      FOOD_TYPE,      VIEWS,       FAVORITES,     PARKING_LOT,       ADDRESS,     TEL
# 식당 ID,      식당 이름,      음식 종류,      조회수,         즐겨찾기수,  주차장 유무,         주소,     전화번호


# 문제
#     음식종류별로 즐겨찾기수가 가장 많은 식당 => GROUP BY FOOD_TYPE MAX(FAVORITES)
#     음식 종류, ID, 식당 이름, 즐겨찾기수 
#     음식 종류를 기준으로 내림차순
    
# SELECT
#     FOOD_TYPE, REST_ID, REST_NAME, MAX(FAVORITES) AS FAVORITES
# FROM REST_INFO 
# GROUP BY 1
# ORDER BY 1 DESC

WITH maximum_fav AS(
    SELECT
        FOOD_TYPE, MAX(FAVORITES) AS FAVORITES
    FROM REST_INFO
    GROUP BY 1
)

SELECT
    mf.FOOD_TYPE, ri.REST_ID, ri.REST_NAME, mf.FAVORITES
FROM REST_INFO ri 
INNER JOIN maximum_fav mf
ON
    ri.FOOD_TYPE = mf.FOOD_TYPE AND
    ri.FAVORITES = mf.FAVORITES
ORDER BY 1 DESC