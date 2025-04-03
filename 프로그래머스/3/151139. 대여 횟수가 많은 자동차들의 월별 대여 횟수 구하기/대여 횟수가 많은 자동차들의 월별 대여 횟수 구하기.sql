-- 코드를 입력하세요
# WITH all_count AS(
# SELECT DISTINCT temp.MONTH, temp.CAR_ID, COUNT(temp.HISTORY_ID) AS RECORDS
# FROM(
#     SELECT
#         MONTH(START_DATE) AS MONTH, CAR_ID, HISTORY_ID, 
#         ROW_NUMBER() OVER(PARTITION BY CAR_ID ORDER BY HISTORY_ID ASC) AS COUNTING
#     FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
#     WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
#     ) AS temp
# WHERE temp.COUNTING >= 5
# GROUP BY CAR_ID
# ORDER BY MONTH ASC, CAR_ID DESC
# )

# SELECT 
#     MONTH, CAR_ID, RECORDS#,
#     # ROW_NUMBER() OVER(PARTITION BY CAR_ID ORDER BY MONTH ASC) AS CHECKING
# FROM all_count

WITH history_count AS(
    SELECT
        MONTH(START_DATE) AS MONTH, CAR_ID, COUNT(HISTORY_ID) AS RECORDS
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
    WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY 1, 2
),

checking_conditions AS(
    SELECT
        temp.CAR_ID
    FROM(
        SELECT 
            *, 
            # ROW_NUMBER() OVER(PARTITION BY CAR_ID ORDER BY MONTH) AS checking_3months,
            SUM(RECORDS) OVER(PARTITION BY CAR_ID ORDER BY MONTH) AS checking_5counts
        FROM history_count
    ) AS temp
    WHERE 
        # temp.checking_3months = 3 AND
        temp.checking_5counts >=5
)

SELECT 
    MONTH, CAR_ID, RECORDS
FROM history_count hc
# NATURAL JOIN checking_conditions
WHERE EXISTS(
            SELECT 1
            FROM checking_conditions cc
            WHERE cc.CAR_ID = hc.CAR_ID)
ORDER BY 1 ASC, 2 DESC

