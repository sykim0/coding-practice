# USED_GOODS_BOARD : 중고 거래 게시판 정보
# BOARD_ID,           WRITER_ID,            TITLE,   CONTENTS,    PRICE,     CREATED_DATE,       STATUS,    VIEWS
# 게시글 ID,           작성자 ID,       게시글 제목,   게시글 내용,    가격,        작성일,           거래상태,   조회수

# USED_GOODS_USER  : 중고 거래 게시판 사용자 정보
# USER_ID,      NICKNAME,       CITY, STREET_ADDRESS1, STREET_ADDRESS2,     TLNO
# 회원 ID,        닉네임,         시,     도로명 주소,         상세 주소,      전화번호


# 완료된 중고 거래의 총금액이 70만 원 이상인 사람 <=> 작성자의 완료된 총 금액을 확인하기
    # GROUP BY  USER_ID
    # STATUS = "DONE" AND SUM(PRICE) >= 7000000

SELECT 
    USER_ID, NICKNAME, SUM(PRICE) AS TOTAL_SALES
FROM USED_GOODS_USER ugu
INNER JOIN USED_GOODS_BOARD ugb
ON ugb.WRITER_ID = ugu.USER_ID
WHERE ugb.STATUS = "DONE"
GROUP BY USER_ID, NICKNAME
HAVING SUM(PRICE) >= 700000
ORDER BY TOTAL_SALES ASC
