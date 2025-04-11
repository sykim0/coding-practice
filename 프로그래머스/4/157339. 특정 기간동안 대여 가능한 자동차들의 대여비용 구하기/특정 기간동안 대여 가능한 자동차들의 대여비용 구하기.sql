# # CAR_RENTAL_COMPANY_CAR
# # CAR_ID,     CAR_TYPE,        DAILY_FEE,         OPTIONS 
# # 자동차 ID,     자동차 종류, 일일 대여 요금(원), 자동차 옵션 리스트


# # CAR_RENTAL_COMPANY_RENTAL_HISTORY 
# # HISTORY_ID,            CAR_ID,  START_DATE, END_DATE 
# # 자동차 대여 기록 ID, 자동차 ID,   대여 시작일, 대여 종료일


# # CAR_RENTAL_COMPANY_DISCOUNT_PLAN 
# # PLAN_ID,             CAR_TYPE, DURATION_TYPE,   DISCOUNT_RATE 
# # 요금 할인 정책 ID, 자동차 종류, 대여 기간 종류,       할인율(%)

# # 할인율이 적용되는 대여 기간 종류
# #      '7일 이상' (대여 기간이 7일 이상 30일 미만인 경우)
# #      '30일 이상' (대여 기간이 30일 이상 90일 미만인 경우),
# #      '90일 이상' (대여 기간이 90일 이상인 경우)

# # 문제
# #     자동차 종류가 '세단' 또는 'SUV' 인 자동차 : WHERE CAR_TYPE = "세단" OR "SUV"
# #     2022년 11월 1일부터 2022년 11월 30일까지 대여 가능하고 
#     # 대여 시작이 11/01~11/30이 아니고, 대여 마감도 11/01~11/30이 또는 그 이후도 아니어야함.
    
# #     30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차에 대해
#     # 대여 금액 FEE : (DAILY_FEE * DISCOUNT_RATE) * 30
# #     자동차 ID, 자동차 종류, 대여 금액(컬럼명: FEE) 리스트를 출력
# #     대여 금액을 기준으로 내림차순 정렬
# #     자동차 종류를 기준으로 오름차순 정렬
# #     자동차 ID를 기준으로 내림차순


# WITH except_period AS(
#     SELECT 
#         crcc.*,
#         COALESCE(crcrh.START_DATE, DATE('2020-01-01')) AS START_DATE,
#         COALESCE(crcrh.END_DATE, DATE('2020-01-01')) AS END_DATE
#     FROM CAR_RENTAL_COMPANY_CAR crcc
#     LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY crcrh
#     ON crcc.CAR_ID = crcrh.CAR_ID
#     WHERE 
#         (crcrh.START_DATE NOT BETWEEN '2022-11-01' AND '2022-11-30') AND
#         crcc.CAR_TYPE = '세단' OR
#         crcc.CAR_TYPE = 'SUV'
# ),

# available_list AS(
#     SELECT
#         # ep.CAR_ID, ep.CAR_TYPE, ep.DAILY_FEE, ep.OPTIONS AS START_DATE
#     *
#     FROM except_period ep
#     WHERE ep.CAR_ID NOT IN (SELECT CAR_ID FROM except_period WHERE END_DATE >= '2022-11-01') # 12월 이후 대여기록이 없어서
#     GROUP BY 1,2,3,4
# ),

# # SELECT * FROM available_list



# # SELECT
# #     temp.*
# # FROM(
# #     SELECT 
# #         a.CAR_ID, a.CAR_TYPE, (a.DAILY_FEE * (1 - 0.01 * crcdp.DISCOUNT_RATE)) * 30 AS FEE
# #     # a.*, crcdp.plan_id, crcdp.car_type AS car___type, crcdp.duration_type, crcdp.discount_rate
# #     FROM available_list a
# #     INNER JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN crcdp
# #     ON crcdp.CAR_TYPE = a.CAR_TYPE
# #     WHERE LEFT(crcdp.DURATION_TYPE, 2) = '30'
# #     ORDER BY 3 DESC, 2 ASC, 1 DESC
# # ) AS temp
# # WHERE temp.FEE BETWEEN 500000 AND 2000000

WITH inavailable AS(
    SELECT 
        CAR_ID , START_DATE, END_DATE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
    WHERE 
        (START_DATE BETWEEN '2022-11-01' AND '2022-11-30') OR
        (END_DATE > '2022-10-31')
),

# SELECT * FROM inavailable ORDER BY 1
# SELECT * FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY ORDER BY CAR_ID

available_list AS(
    SELECT 
        crcc.*,
        COALESCE(crcrh.START_DATE, DATE('2020-01-01')) AS START_DATE,
        COALESCE(crcrh.END_DATE, DATE('2020-01-01')) AS END_DATE
    FROM CAR_RENTAL_COMPANY_CAR crcc
    LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY crcrh
    ON crcc.CAR_ID = crcrh.CAR_ID
    WHERE 
        crcc.CAR_ID NOT IN (SELECT CAR_ID FROM inavailable) AND
        (crcc.CAR_TYPE = '세단' OR crcc.CAR_TYPE = 'SUV')
)

# SELECT * FROM available_list

SELECT
    DISTINCT temp.*
FROM(
    SELECT 
        a.CAR_ID, a.CAR_TYPE, ROUND((a.DAILY_FEE * (1 - 0.01 * crcdp.DISCOUNT_RATE)),0) * 30 AS FEE
    # a.*, crcdp.plan_id, crcdp.car_type AS car___type, crcdp.duration_type, crcdp.discount_rate
    FROM available_list a
    INNER JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN crcdp
    ON crcdp.CAR_TYPE = a.CAR_TYPE
    WHERE LEFT(crcdp.DURATION_TYPE, 2) = '30'
    ORDER BY 3 DESC, 2 ASC, 1 DESC
) AS temp
WHERE temp.FEE BETWEEN 500000 AND 2000000