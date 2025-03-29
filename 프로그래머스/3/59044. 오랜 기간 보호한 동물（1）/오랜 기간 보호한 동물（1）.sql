-- 코드를 입력하세요
SELECT
    ai.NAME, ai.DATETIME
FROM ANIMAL_INS ai
WHERE ai.ANIMAL_ID NOT IN (
                SELECT
                    ao.ANIMAL_ID
                FROM ANIMAL_OUTS ao
            )
ORDER BY ai.DATETIME ASC
limit 3