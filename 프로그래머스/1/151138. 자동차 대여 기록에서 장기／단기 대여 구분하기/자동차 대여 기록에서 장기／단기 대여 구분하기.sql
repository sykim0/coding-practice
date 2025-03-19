-- 코드를 입력하세요
# 2022년 9월 조건 까먹음.
# DIFF를 구할 때 (시작, 종료) 날짜 순서
WITH date_diff AS(
    SELECT
        HISTORY_ID, CAR_ID, START_DATE, END_DATE, TIMESTAMPDIFF(Day,TIMESTAMP(START_DATE), TIMESTAMP(END_DATE)) AS RENT_day
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE BETWEEN "2022-09-01" AND "2022-09-30"
)

# SELECT * FROM date_diff;

SELECT
    HISTORY_ID, CAR_ID, DATE_FORMAT(START_DATE, "%Y-%m-%d") AS START_DATE, DATE_FORMAT(END_DATE, "%Y-%m-%d") AS END_DATE,
    (CASE
        WHEN RENT_day >= 29 THEN '장기 대여' # 빌린 당일도 1일로 계산해야하므로. 이건 하루 지났을 때부터만 따짐.
        ELSE '단기 대여'
        END) AS RENT_TYPE
FROM date_diff
ORDER BY HISTORY_ID DESC