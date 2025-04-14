# USER_INFO 
# USER_ID, GENDER(NULL), AGE, JOINED
# 회원 ID,  성별,    나이, 가입일


# ONLINE_SALE 
# ONLINE_SALE_ID,     USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE
# 온라인 상품 판매 ID,   회원 ID, 상품 ID,       판매량,         판매일


# 동일한 날짜, 회원 ID, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재 => 이 3개에 대해서는 DISTINCT함

# 문제
#     USER_INFO 테이블과 ONLINE_SALE 테이블에서 년, 월, 성별 별로 상품을 구매한 회원수를 집계
#     년, 월, 성별을 기준으로 오름차순 정렬
#      성별 정보가 없는 경우 결과에서 제외 => GENDER IS NOT NULL

SELECT
    # os.*, 
    YEAR(os.SALES_DATE) AS YEAR, MONTH(os.SALES_DATE) AS MONTH, ui.GENDER, COUNT(DISTINCT os.USER_ID) AS USERS
    # ui.USER_ID, ui.GENDER, ui.AGE, ui.JOINED
FROM USER_INFO ui
RIGHT JOIN  ONLINE_SALE os # 어차피 집계라서 구매 정보만 있으면 되서
ON os.USER_ID = ui.USER_ID
WHERE ui.GENDER IS NOT NULL
GROUP BY 1,2,3
ORDER BY 1,2,3

