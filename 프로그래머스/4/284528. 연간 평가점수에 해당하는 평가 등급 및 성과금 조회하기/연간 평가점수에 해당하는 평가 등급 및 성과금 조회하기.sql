# HR_DEPARTMENT 
# DEPT_ID, DEPT_NAME_KR, DEPT_NAME_EN, LOCATION
# 부서 ID, 국문 부서명, 영문 부서명, 부서 위치

# HR_EMPLOYEES 
# EMP_NO, EMP_NAME, DEPT_ID, POSITION, EMAIL, COMP_TEL, HIRE_DATE, SAL
# 사번,      성명,    부서 ID,   직책,     이메일, 전화번호, 입사일,     연봉

# HR_GRADE 
# EMP_NO, YEAR, HALF_YEAR, SCORE
# 사번,     연도, 반기,      평가 점수

# 사번, 성명, 평가 등급, 성과금

# 사원 right join 부서 right join grade
# case when 통해서 등급과 성과금계산
# 반기별로 다하니 틀리고 예제 답안도 하반기만 한 거 같음. 아니면 상하반기 절반으로..?
# 문제에 별도 표시가 없어서
WITH score_2022 AS(
    SELECT
        EMP_NO, AVG(SCORE) AS avg_score
    FROM HR_GRADE
    GROUP BY 1
),
 
alphabet_grade AS(
    SELECT
        s2.EMP_NO, he.EMP_NAME, he.SAL,
        CASE 
            WHEN s2.AVG_SCORE >= 96 THEN 'S'
            WHEN s2.AVG_SCORE >= 90 THEN 'A'
            WHEN s2.AVG_SCORE >= 80 THEN 'B'
            ELSE 'C'
        END AS GRADE
    FROM score_2022 s2
    LEFT JOIN HR_EMPLOYEES he
    ON s2.EMP_NO = he.EMP_NO
),

half_year_grade AS(
    SELECT
        ag.*,
        CASE
            WHEN ag.GRADE = "S" THEN 0.2
            WHEN ag.GRADE = "A" THEN 0.15
            WHEN ag.GRADE = "B" THEN 0.1
            ELSE 0  
        END AS percentage
    FROM alphabet_grade ag
)

SELECT 
    EMP_NO, EMP_NAME, GRADE, (SAL * PERCENTAGE) AS BONUS
FROM half_year_grade
ORDER BY 1