# MEMBER_PROFILE
# MEMBER_ID, MEMBER_NAME, TLNO,      GENDER, DATE_OF_BIRTH
# 회원 ID,  회원 이름,      회원 연락처, 성별,     생년월일

# REST_REVIEW 
# REVIEW_ID, REST_ID, MEMBER_ID, REVIEW_SCORE, REVIEW_TEXT,REVIEW_DATE
# 리뷰 ID,  식당 ID,      회원 ID,       점수,    리뷰 텍스트,     리뷰 작성일

# 문제
#     리뷰를 가장 많이 작성한 회원의 리뷰들을 조회
#     회원 이름, 리뷰 텍스트, 리뷰 작성일
#     리뷰 작성일을 기준으로 오름차순
#     리뷰 텍스트를 기준으로 오름차순 

# REST_REVIEW에 left join 하여 리뷰ID 개수를 ORDER BY 로 조회

WITH review_cnt AS(
    SELECT
        temp.*,
        RANK() OVER(ORDER BY temp.cnt DESC) AS ranking
    FROM(
        SELECT
            rr.MEMBER_ID, mp.MEMBER_NAME, COUNT(rr.REVIEW_ID) AS cnt
        FROM REST_REVIEW rr
        LEFT JOIN MEMBER_PROFILE mp
        ON mp.MEMBER_ID = rr.MEMBER_ID
        GROUP BY 1,2
        ORDER BY 3 DESC
        # LIMIT 1 => 최대 리뷰 작성 개수가 같은 사람들을 놓침.
        ) AS temp
)

# SELECT * FROM review_cnt

SELECT 
    rc.MEMBER_NAME, rr.REVIEW_TEXT, DATE_FORMAT(rr.REVIEW_DATE, "%Y-%m-%d") AS REVIEW_DATE
FROM review_cnt rc
INNER JOIN REST_REVIEW rr
ON rc.MEMBER_ID = rr.MEMBER_ID
WHERE rc.ranking = 1
ORDER BY 3, 2