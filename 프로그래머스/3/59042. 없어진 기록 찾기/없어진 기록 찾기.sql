# 입양기록 O, 보호소 들어온 기록 X => outs left join ins 해서 ai.ANIMAL_ID is null
SELECT
    ao.ANIMAL_ID, ao.NAME
FROM ANIMAL_OUTS ao
LEFT JOIN ANIMAL_INS ai
ON ao.ANIMAL_ID = ai.ANIMAL_ID
WHERE ai.ANIMAL_ID IS NULL
ORDER BY 1