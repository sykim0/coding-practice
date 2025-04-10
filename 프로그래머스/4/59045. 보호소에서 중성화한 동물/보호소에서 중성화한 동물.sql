# 문제
#     보호소에서 중성화 수술을 거친 동물 정보
#     보호소에 들어올 당시에는 중성화되지 않았지만,
#     보호소를 나갈 당시에는 중성화된 동물
#     아이디와 생물 종, 이름을 조회하는 아이디 순으로 조회
    
#     중성화를 거치지 않은 동물은 성별 및 중성화 여부에 Intact,
#     중성화를 거친 동물은 Spayed 또는 Neutered
    

SELECT
    ai.ANIMAL_ID, ai.ANIMAL_TYPE, ai.NAME
FROM ANIMAL_INS ai
LEFT JOIN ANIMAL_OUTS ao
ON ai.ANIMAL_ID = ao.ANIMAL_ID
WHERE 
    ai.SEX_UPON_INTAKE like "%Intact%" AND
    ao.SEX_UPON_OUTCOME not like "%Intact%"
ORDER BY ANIMAL_ID ASC