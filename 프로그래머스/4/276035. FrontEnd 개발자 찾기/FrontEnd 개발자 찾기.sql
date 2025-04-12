# 프엔을 가지고 있음. => & 했을 때 프엔 있으면됨.
SELECT DISTINCT
    temp.ID, temp.EMAIL, temp.FIRST_NAME, temp.LAST_NAME
FROM(
    SELECT
        d.ID, d.EMAIL, d.FIRST_NAME, d.LAST_NAME, s.CATEGORY,
        CASE 
            WHEN s.CATEGORY LIKE "F%" THEN 1
            ELSE 0
        END AS mask
    FROM DEVELOPERS d
    INNER JOIN SKILLCODES s
    ON d.SKILL_CODE & s.CODE = s.CODE
    ) AS temp
WHERE temp.mask = 1
ORDER BY 1 ASC
