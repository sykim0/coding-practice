-- 코드를 입력하세요
SELECT
    ai.ANIMAL_ID, ai.NAME
FROM ANIMAL_INS ai
INNER JOIN ANIMAL_OUTS ao
ON ai.ANIMAL_ID = ao.ANIMAL_ID
WHERE ai.DATETIME > ao.DATETIME
ORDER BY ai.DATETIME ASC