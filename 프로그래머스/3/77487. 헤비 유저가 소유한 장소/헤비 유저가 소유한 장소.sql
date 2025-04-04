# PLACES : 공간 임대 서비스에 등록된 공간의 정보
# ID,                 NAME,               HOST_ID
# 공간의 아이디,        이름,         공간을 소유한 유저의 아이디

# 문제
#     공간을 둘 이상 등록한 사람을 "헤비 유저" => GROUP BY HOST_ID // COUNT(ID) >=2 이면 헤비 유저
#     헤비 유저가 등록한 공간의 정보를 아이디 순으로 조회
    
WITH heavy_user AS(
    SELECT
       temp.ID, temp.NAME, temp.HOST_ID
    FROM(
        SELECT
            *, COUNT(ID) AS space_count
        FROM PLACES
        GROUP BY HOST_ID
        ) AS temp
    WHERE temp.space_count >= 2)
    
SELECT
    p.ID, p.NAME, p.HOST_ID
FROM PLACES p
WHERE HOST_ID IN (SELECT HOST_ID FROM heavy_user)
ORDER BY p.ID ASC
