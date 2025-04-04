-- 코드를 작성해주세요
SELECT
    temp.ID, temp.FISH_NAME, temp.LENGTH
FROM(
    SELECT
        *, 
        RANK() OVER(PARTITION BY fi.FISH_TYPE ORDER BY fi.LENGTH DESC) AS `RANKING`
    FROM FISH_INFO fi
    # INNER JOIN FISH_NAME_INFO fni
    # ON fi.FISH_TYPE = fni.FISH_TYPE
    NATURAL JOIN FISH_NAME_INFO fni
) AS temp
WHERE temp.RANKING = 1
ORDER BY 1;