# PATIENT 
# PT_NO, PT_NAME, GEND_CD, AGE, TLNO
# 환자번호, 환자이름, 성별코드, 나이, 전화번호

# DOCTOR 
# DR_NAME, DR_ID, LCNS_NO, HIRE_YMD, MCDP_CD, TLNO
# 의사이름, 의사ID, 면허번호, 고용일자, 진료과코드, 전화번호

# APPOINTMENT
# APNT_YMD,       APNT_NO,    PT_NO,  MCDP_CD,     MDDR_ID,   APNT_CNCL_YN, APNT_CNCL_YMD
# 진료 예약일시, 진료예약번호, 환자번호, 진료과코드,     의사ID,     예약취소여부, 예약취소날짜

# # 문제
#     2022년 4월 13일 취소되지 않은 흉부외과(CS) 진료 예약 내역을 조회
#      진료예약번호, 환자이름, 환자번호, 진료과코드, 의사이름, 진료예약일시
#      진료예약일시를 기준으로 오름차순

# 예약을 안 한 환자가 있을 수도 있으니 appointment에 다 붙어야함.

SELECT
    a.APNT_NO, p.PT_NAME, a.PT_NO, a.MCDP_CD, d.DR_NAME, a.APNT_YMD
FROM APPOINTMENT a
LEFT JOIN PATIENT p
ON a.PT_NO = p.PT_NO
LEFT JOIN DOCTOR d
ON a.MDDR_ID = d.DR_ID
WHERE 
    a.MCDP_CD = 'CS' AND
    DATE_FORMAT(a.APNT_YMD, "%Y-%m-%d") = '2022-04-13' AND
    a.APNT_CNCL_YMD IS NULL
ORDER BY a.APNT_YMD ASC