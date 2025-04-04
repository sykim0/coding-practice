# USED_GOODS_BOARD : 중고 거래 게시판 정보
# BOARD_ID, WRITER_ID,    TITLE,      CONTENTS,       PRICE,  CREATED_DATE,   STATUS,     VIEWS
# 게시글 ID, 작성자 ID, 게시글 제목,     게시글 내용,     가격,         작성일,    거래상태,   조회수

# USED_GOODS_FILE 
# FILE_ID,     FILE_EXT,      FILE_NAME,  BOARD_ID
# 파일 ID,      파일 확장자,  파일 이름,      게시글 ID
 
# 문제
    # 조회수가 가장 높은 중고거래 게시물에 대한 첨부파일 경로
    # 첨부파일 경로는 FILE ID를 기준으로 내림차순 
    # 기본적인 파일경로는 /home/grep/src/ 
    # 게시글 ID를 기준으로 디렉토리가 구분
    # 파일이름은 파일 ID, 파일 이름, 파일 확장자로
    # 조회수가 가장 높은 게시물은 하나만 존재
     
SELECT
    CONCAT('/home/grep/src/', ugf.BOARD_ID,'/', ugf.FILE_ID, ugf.FILE_NAME, ugf.FILE_EXT) AS FILE_PATH
FROM USED_GOODS_FILE ugf
INNER JOIN USED_GOODS_BOARD ugb
ON ugb.BOARD_ID = ugf.BOARD_ID
WHERE ugb.VIEWS = (SELECT MAX(VIEWS) AS view_max FROM USED_GOODS_BOARD)
ORDER BY ugf.FILE_ID DESC
