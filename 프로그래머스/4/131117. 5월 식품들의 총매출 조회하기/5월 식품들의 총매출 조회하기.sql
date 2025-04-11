# FOOD_PRODUCT 
# PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE
# 식품 ID,      식품 이름,       식품코드, 식품분류, 식품 가격


# FOOD_ORDER
# ORDER_ID, PRODUCT_ID, AMOUNT, PRODUCE_DATE, IN_DATE, OUT_DATE, FACTORY_ID, WAREHOUSE_ID
# 주문 ID,   제품 ID,     주문량, 생산일자,       입고일자, 출고일자, 공장 ID,      창고 ID

# 문제
#     생산일자가 2022년 5월인 식품들의 식품 ID, 식품 이름, 총매출을 조회
#     총매출을 기준으로 내림차순 정렬
#     총매출이 같다면 식품 ID를 기준으로 오름차순 정렬

SELECT
    fp.PRODUCT_ID, fp.PRODUCT_NAME, SUM(fp.PRICE * fo.AMOUNT) AS TOTAL_SALES
FROM FOOD_PRODUCT fp
LEFT JOIN FOOD_ORDER fo # 주문 안 한 상품이 있을 수 있으므로
ON fp.PRODUCT_ID = fo.PRODUCT_ID
WHERE PRODUCE_DATE BETWEEN '2022-05-01' AND '2022-05-31'
GROUP BY 1,2
ORDER BY 3 DESC, 1 ASC