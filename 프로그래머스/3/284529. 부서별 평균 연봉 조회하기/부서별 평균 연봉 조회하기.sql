# HR_DEPARTMENT : 회사 부서 정보
# DEPT_ID,         DEPT_NAME_KR,   DEPT_NAME_EN,   LOCATION
# 부서 ID,           국문 부서명,    영문 부서명,     부서 위치



# HR_EMPLOYEES : 회사 사원 정보
# EMP_NO,     EMP_NAME,        DEPT_ID,           POSITION,   EMAIL,       COMP_TEL,      HIRE_DATE,  SAL
# 사번,         성명,          부서 ID,             직책,      이메일,       전화번호,        입사일,       연봉

# 문제
#     부서별 평균 연봉 
#     부서별로 부서 ID, 영문 부서명, 평균 연봉
#     평균연봉은 소수점 첫째 자리에서 반올림 AVG_SAL
#     부서별 평균 연봉을 기준으로 내림차순 정렬

SELECT
    hrd.DEPT_ID, hrd.DEPT_NAME_EN, 
    ROUND(AVG(hre.SAL), 0) AS AVG_SAL
FROM HR_DEPARTMENT hrd
INNER JOIN HR_EMPLOYEES hre
ON hrd.DEPT_ID = hre.DEPT_ID
GROUP BY 1,2
ORDER BY 3 DESC
    

    

