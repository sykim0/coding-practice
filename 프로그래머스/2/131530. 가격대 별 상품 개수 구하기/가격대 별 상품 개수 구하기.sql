-- 코드를 입력하세요
# mysql은 TRUNC 아니고 TRUNCATE
SELECT
    TRUNCATE(PRICE, -4) AS PRICE_GROUP, COUNT(PRODUCT_ID) AS PRODUCTS
FROM PRODUCT 
GROUP BY 1
ORDER BY 1