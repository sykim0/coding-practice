-- 코드를 입력하세요
SELECT 
    *
FROM CAR_RENTAL_COMPANY_CAR
# WHERE options REGEXP '^*네비게이션*'
WHERE options LIKE '%네비게이션%'
ORDER BY 1 DESC