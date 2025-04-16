# ONLINE_SALE 
# ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE
# 온라인 상품 판매 ID, 회원 ID, 상품 ID, 판매량, 판매일


# OFFLINE_SALE 
# OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE는 
# 오프라인 상품 판매 ID, 상품 ID, 판매량, 판매일



# 동일한 날짜, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재

# 문제
#     2022년 3월의 오프라인/온라인 상품 판매 데이터의 판매 날짜, 상품ID, 유저ID, 판매량
#         2022-03-01<=날짜<=2022-03-31
#     OFFLINE_SALE 테이블의 판매 데이터의 USER_ID 값은 NULL
#     SELECT NULL AS USER_ID
#     판매일을 기준으로 오름차순 정렬
#     상품 ID를 기준으로 오름차순
#     유저 ID를 기준으로 오름차순 정렬
# #1
# - 온라인 세일과 오프라인 세일을 상품ID와 판매날짜로 join하여 가로로 이어붙이고 on.SALES_AMONUT, off.SALES_AMONUT더하기
# #2
# - UNION으로 더해서 날짜, ID별로 더하기 => 더 간단할 듯함.

SELECT
    DATE_FORMAT(SALES_DATE, "%Y-%m-%d") AS SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
FROM online_sale
WHERE SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'
UNION ALL
SELECT
    DATE_FORMAT(SALES_DATE, "%Y-%m-%d") AS SALES_DATE, PRODUCT_ID, NULL AS USER_ID, SALES_AMOUNT
FROM offline_sale
WHERE SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'

ORDER BY 1,2,3
