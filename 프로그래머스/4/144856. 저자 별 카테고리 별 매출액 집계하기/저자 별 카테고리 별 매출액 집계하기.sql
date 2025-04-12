# 문제
    # 2022년 1월의 도서 판매 데이터를 기준으로 SALES_DATE 2022-01-01 ~ 2022-01-31
    # 저자 별, 카테고리 별 매출액(TOTAL_SALES = 판매량 * 판매가) 을 구하여,GROUP BY AUTHOR_ID, CATEGORY
    # 저자 ID(AUTHOR_ID), 저자명(AUTHOR_NAME), 카테고리(CATEGORY), 매출액(SALES)
    # 저자 ID를 오름차순
    #  카테고리를 내림차순 정렬
    

# 판매한 책만 기록이 있으면 되니까 BOOK_SALES 에 다 붙이기
SELECT
    a.AUTHOR_ID, a.AUTHOR_NAME, b.CATEGORY, SUM(bs.SALES * b.PRICE) AS TOTAL_SALES
FROM BOOK_SALES bs
LEFT JOIN BOOK b
ON bs.BOOK_ID = b.BOOK_ID
LEFT JOIN AUTHOR a
ON a.AUTHOR_ID = b.AUTHOR_ID
WHERE bs.SALES_DATE BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY 1,2,3
ORDER BY 1 ASC, 3 DESC


