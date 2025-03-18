import re

def solution(num, k):
    if str(k) not in str(num) : 
        answer = -1
    else : 
        num = list(str(num))
        answer = num.index(str(k)) + 1
    return answer