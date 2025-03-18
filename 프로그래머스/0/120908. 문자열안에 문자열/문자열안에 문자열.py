import re
def solution(str1, str2):
    result = re.search(str2, str1)
    answer = 1 if result else 2
    return answer