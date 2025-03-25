-- 코드를 작성해주세요
# 코드와 스킬코드가 join되면서 중복값 발생
SELECT
    DISTINCT(d.ID), d.EMAIL, d.FIRST_NAME, d.LAST_NAME
FROM SKILLCODES s
INNER JOIN DEVELOPERS d
ON s.CODE & d.SKILL_CODE # 왜 굳이 이진수..?
WHERE s.NAME IN ('C#', "Python")
ORDER BY 1