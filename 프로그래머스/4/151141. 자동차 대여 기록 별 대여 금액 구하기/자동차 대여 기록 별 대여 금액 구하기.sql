# CAR_RENTAL_COMPANY_CAR : 대여 중인 자동차들의 정보
# CAR_ID,     CAR_TYPE,       DAILY_FEE,          OPTIONS 
# 자동차 ID,     자동차 종류, 일일 대여 요금(원), 자동차 옵션 리스트



# CAR_RENTAL_COMPANY_RENTAL_HISTORY : 자동차 대여 기록 정보
# ISTORY_ID, CAR_ID,      START_DATE, END_DATE
# 대여 기록 ID, 자동차 ID, 대여 시작일,   대여 종료일


# CAR_RENTAL_COMPANY_DISCOUNT_PLAN : 자동차 종류 별 대여 기간 종류 별 할인 정책 정보
# PLAN_ID,            CAR_TYPE, DURATION_TYPE, DISCOUNT_RATE
# 요금 할인 정책 ID, 자동차 종류,    대여 기간 종류, 할인율(%)

# 문재
#     자동차 종류가 '트럭'인 자동차의 대여 기록에 대해서
        # crcdp.CAR_TYPE = "트럭" , CRCRH LEFT JOIN CRCC USING(CAR_ID)
        # END_DATE - START_DATE 차이를 보고 DURATION_TYPE과 join        
#     대여 기록 별로 대여 금액(컬럼명: FEE) DAILY_FEE * (1- 0.01 * DISCOUNT_RATE)
#     대여 기록 ID와 대여 금액 리스트를 출력
#     대여 금액을 기준으로 내림차순
#     대여 기록 ID를 기준으로 내림차순 정렬
WITH diff AS(
    SELECT
        HISTORY_ID, CAR_ID, DATEDIFF(END_DATE, START_DATE) + 1 AS date_diff # 대여 하루만 해도 한 거라서
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
)

SELECT
    d.HISTORY_ID, 
    # 생각해보니 이렇게 하드코딩하면 테스트케이스에서는 다를 수도 있으니
    ROUND(d.date_diff * crcc.DAILY_FEE * (1 - 0.01 * COALESCE(crcdp.DISCOUNT_RATE, 0)), 0) AS FEE # 7일 미만 대여 기록
    # CASE
    #     WHEN date_diff >=90 THEN ROUND(date_diff * 0.9 * crcc.DAILY_FEE, 0) 
    #     WHEN date_diff >=30 THEN ROUND(date_diff * 0.93 * crcc.DAILY_FEE, 0)
    #     WHEN date_diff >=7 THEN ROUND(date_diff * 0.95 * crcc.DAILY_FEE, 0)
    #     ELSE date_diff * crcc.DAILY_FEE
    # END AS FEE
FROM diff d
LEFT JOIN CAR_RENTAL_COMPANY_CAR crcc
ON d.CAR_ID = crcc.CAR_ID
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN crcdp
ON 
    crcc.CAR_TYPE = crcdp.CAR_TYPE AND
    crcdp.DURATION_TYPE = 
    CASE
        WHEN d.date_diff >= 90 THEN '90일 이상'
        WHEN d.date_diff >= 30 THEN '30일 이상'
        WHEN d.date_diff >= 7 THEN '7일 이상'
    END
WHERE crcc.CAR_TYPE = "트럭"
ORDER BY FEE DESC, HISTORY_ID DESC