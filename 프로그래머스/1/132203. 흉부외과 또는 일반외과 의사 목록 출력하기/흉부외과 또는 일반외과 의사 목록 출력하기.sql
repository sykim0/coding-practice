SELECT
    DR_NAME, DR_ID, MCDP_CD, date_format(hire_ymd, "%Y-%m-%d")
FROM doctor 
WHERE MCDP_CD = 'CS' OR MCDP_CD = 'GS' 
ORDER BY HIRE_YMD DESC, DR_NAME ASC