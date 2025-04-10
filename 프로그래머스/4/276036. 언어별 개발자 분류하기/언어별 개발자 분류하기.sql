# A : Front End 스킬과 Python 스킬을 함께 가지고 있는 개발자
# B : C# 스킬을 가진 개발자
# C : 그 외의 Front End 개발자

WITH all_skills AS(
    SELECT
        *
    FROM DEVELOPERS d
    LEFT JOIN SKILLCODES s
    ON d.SKILL_CODE & s.code = s.code 
),

grade_A AS(
        SELECT DISTINCT
            'A' AS GRADE, ID, EMAIL
        FROM all_skills
        WHERE 
            NAME = 'Python' AND
            ID IN (SELECT ID FROM all_skills WHERE CATEGORY = 'Front End')
),
grade_B AS(
    SELECT DISTINCT
        'B' AS GRADE, ID, EMAIL
    FROM all_skills
    WHERE 
        NAME = 'C#' AND
        ID NOT IN (SELECT ID FROM grade_A)
),

grade_C AS(
    SELECT DISTINCT
        'C' AS GRADE, ID, EMAIL
    FROM all_skills
    WHERE 
        CATEGORY = 'Front End' AND
        ID NOT IN (SELECT ID FROM grade_A) AND
        ID NOT IN (SELECT ID FROM grade_B)
)

SELECT  * FROM grade_A
UNION ALL
SELECT  * FROM grade_B
UNION ALL
SELECT  * FROM grade_C
ORDER BY GRADE, ID

