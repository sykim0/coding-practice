-- 코드를 작성해주세요
# ROUND => n째 자리까지
# 문제는 n째 자리에서 이므로 n-1로 써줘야함.
SELECT ROUND(AVG(COALESCE(LENGTH, 10)), 2) AS AVERAGE_LENGTH
FROM FISH_INFO