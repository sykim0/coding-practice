# 2021년에 가입한 회원 중 상품을 구매한 회원수와 상품을 구매한 회원 비율
# 연, 월, 별 출력
# 비율은 첫째자리까지
# 연 기준 ASC, 월 ASC


SELECT
    YEAR(o.SALES_DATE) AS YEAR, MONTH(o.SALES_DATE) AS MONTH,
    COUNT(DISTINCT o.USER_ID) AS PURCHASED_USERS,
    ROUND(COUNT(DISTINCT o.USER_ID) / (SELECT COUNT(DISTINCT USER_ID) FROM USER_INFO WHERE YEAR(JOINED) = 2021), 1) AS PURCHASED_RATIO
FROM ONLINE_SALE o
LEFT JOIN USER_INFO u
ON o.USER_ID = u.USER_ID
WHERE YEAR(u.JOINED) = 2021
GROUP BY 1,2
ORDER BY 1, 2