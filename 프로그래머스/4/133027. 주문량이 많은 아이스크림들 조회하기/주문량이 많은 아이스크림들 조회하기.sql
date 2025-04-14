# FIRST_HALF : 상반기 주문 정보, JULY : 7월의 아이스크림 주문 정보
# HIPMENT_ID(), FLAVOR(PK),      TOTAL_ORDER
# 출하 번호, 아이스크림 맛, 상반기 아이스크림 총주문량

# 7월에는 아이스크림 주문량이 많아 같은 아이스크림에 대하여 서로 다른 두 공장에서 아이스크림 가게로 출하를 진행하는 경우가 있습니다
# => 같은 맛의 아이스크림이라도 다른 출하 번호

# 문제
#     7월 아이스크림 총 주문량, 상반기의 아이스크림 총 주문량을 더한 값이 
#     큰 순서대로 상위 3개의 맛을 조회하는 SQL 문을 작성해주세요.

# 7월은 출하번호 다른게 예제에선 망고와 딸기
# => FLAVOR로 조인

WITH july_total AS(
    SELECT
        FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER
    FROM JULY
    GROUP BY FLAVOR
)

SELECT
    temp.FLAVOR
FROM(
    SELECT
        jt.FLAVOR, SUM(jt.TOTAL_ORDER + fh.TOTAL_ORDER) AS TOTAL_ORDER
    FROM july_total jt
    INNER JOIN FIRST_HALF fh
    ON jt.FLAVOR = fh.FLAVOR
    GROUP BY 1
    ORDER BY 2 DESC
) AS temp
LIMIT 3

    