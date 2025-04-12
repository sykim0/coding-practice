# REST_INFO : 식당 정보
# REST_ID, REST_NAME, FOOD_TYPE, VIEWS, FAVORITES, PARKING_LOT, ADDRESS, TEL
# 식당 ID, 식당 이름,   음식 종류,  조회수,    즐겨찾기수, 주차장 유무,  주소,     전화번호


# REST_REVIEW 
# REVIEW_ID, REST_ID, MEMBER_ID, REVIEW_SCORE, REVIEW_TEXT,REVIEW_DATE
# 리뷰 ID,      식당 ID, 회원 ID,       점수,     리뷰 텍스트,  리뷰 작성일

# 문제
#     서울에 위치한 식당들의 식당 ID, 식당 이름, 음식 종류, 즐겨찾기수, 주소, 리뷰 평균 점수
        # LEFT(ADDRESS, 2) = "서울", AVG(REVIEW_SCORE)
#     리뷰 평균점수는 소수점 세 번째 자리에서 반올림 
#     평균점수를 기준으로 내림차순 정렬
#     즐겨찾기수를 기준으로 내림차순 정렬



WITH seoul_AVG AS (
    SELECT
        ri.REST_ID, ri.REST_NAME, ROUND(AVG(rr.REVIEW_SCORE), 2) AS SCORE
        # *
    FROM REST_INFO ri
    RIGHT JOIN REST_REVIEW rr # 리뷰가 없을 수도 있으므로 
    ON ri.REST_ID = rr.REST_ID
    WHERE LEFT(ADDRESS, 2) = "서울"
    GROUP BY 1
)

SELECT
    sa.REST_ID, sa.REST_NAME, ri.FOOD_TYPE, ri.FAVORITES, ri.ADDRESS, sa.SCORE
FROM seoul_AVG sa
INNER JOIN REST_INFO ri
ON
    sa.REST_ID = ri.REST_ID AND
    sa.REST_NAME - ri.REST_ID
ORDER BY 6 DESC, 4 DESC