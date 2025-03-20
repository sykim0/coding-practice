# -- 코드를 작성해주세요

SELECT
    SUM(g.SCORE) AS SCORE, e.EMP_NO, e.EMP_NAME, e.POSITION, e.EMAIL
FROM HR_GRADE g
INNER JOIN HR_EMPLOYEES e 
ON g.EMP_NO = e.EMP_NO
GROUP BY 2,3,4,5
HAVING
    SUM(g.SCORE) = (
                    SELECT
                        MAX(temp.SCORE) AS SCORE
                    FROM(
                        SELECT
                            (SUM(SCORE)) AS SCORE
                        FROM HR_GRADE 
                        GROUP BY EMP_NO
                        ) AS temp
                ) 

