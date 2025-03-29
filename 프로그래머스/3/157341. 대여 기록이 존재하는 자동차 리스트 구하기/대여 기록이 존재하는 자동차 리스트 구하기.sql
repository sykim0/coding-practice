-- 코드를 입력하세요
SELECT
    DISTINCT c.CAR_ID
FROM CAR_RENTAL_COMPANY_CAR c
INNER JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY ch
ON c.CAR_ID = ch.CAR_ID
WHERE 
    ch.START_DATE >= '2022-10-01' AND
    c.CAR_TYPE = "세단"
ORDER BY 1 DESC