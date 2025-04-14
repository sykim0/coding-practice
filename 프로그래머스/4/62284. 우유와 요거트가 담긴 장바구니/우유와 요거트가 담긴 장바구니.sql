# CART_PRODUCTS 
# ID,     CART_ID,        NAME,    PRICE 
# 아이디, 장바구니의 아이디, 상품 종류, 가격


# 문제
#     우유(Milk)와 요거트(Yogurt)를 동시에 구입한 장바구니 아이디를 조회
#      장바구니의 아이디 순

# 요거트가 있으면 1, 우유가 있으면 1 해서 SUM한 값이 2 이상이면 DISTINCT cART_ID 출력
    # => 요거트 2개, 우유 0개 같은 경우 못 걸러냄....
    # 그렇다면 ID 제외하고, CART_ID, NAME 이 DISTINCT하면 됨. 
    
WITH milk_and_yogurt AS(
    SELECT DISTINCT
        # *,
        CART_ID, NAME,
        CASE WHEN NAME IN ("MILK", "Yogurt") THEN 1 ELSE 0 END AS same_time
    FROM CART_PRODUCTS
)

# SELECT * FROM milk_and_yogurt ORDER BY same_time DESC, CART_ID
SELECT 
    temp.CART_ID
FROM(
    SELECT
        CART_ID, SUM(same_time)
    FROM milk_and_yogurt
    GROUP BY CART_ID
    HAVING SUM(same_time) >= 2 # 
) AS temp
ORDER BY 1 ASC
    