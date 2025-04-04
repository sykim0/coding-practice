# USED_GOODS_BOARD : 중고 거래 게시판 정보
# BOARD_ID, WRITER_ID,    TITLE,      CONTENTS,       PRICE,  CREATED_DATE,   STATUS,     VIEWS
# 게시글 ID, 작성자 ID, 게시글 제목,     게시글 내용,     가격,         작성일,    거래상태,   조회수

# USED_GOODS_USER 
# USER_ID,         NICKNAME, CITY,    STREET_ADDRESS1, STREET_ADDRESS2,    TLNO
# 회원 ID,       닉네임,        시,     도로명 주소,          상세 주소,      전화번호

# 문제
#     중고 거래 게시물을 3건 이상 등록한 사용자 => GROUP BY USER_ID // COUNT(BOARD_ID) >= 3
#     사용자 ID, 닉네임, 전체주소, 전화번호
#     전체 주소는 시, 도로명 주소, 상세 주소가 함께 출력 CONCAT(CITY, STREET_ADD1, STREET_ADD2)
#     전화번호의 경우 xxx-xxxx-xxxx 같은 형태로 하이픈 문자열(-)을 삽입 => SUBSTR?
#     회원 ID를 기준으로 내림차순 정렬

SELECT
    temp.USER_ID, temp.NICKNAME, temp.전체주소, 
    CONCAT(SUBSTR(temp.TLNO,1,3), '-', SUBSTR(temp.TLNO,4,4), '-', SUBSTR(temp.TLNO,8,4)) AS `전화번호`
FROM(
    SELECT
        USER_ID, 
        NICKNAME, 
        CONCAT(CITY, ' ',STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS `전체주소`, 
        TLNO, 
        COUNT(BOARD_ID) AS writing_count
    FROM USED_GOODS_BOARD ugb
    INNER JOIN USED_GOODS_USER ugu
    ON ugb.WRITER_ID = ugu.USER_ID
    GROUP BY 1,2,3,4
    ) AS temp 
WHERE writing_count >= 3
ORDER BY 1 DESC
    