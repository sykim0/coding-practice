def solution(n):
    answer = 0
    if n&1 : # 홀수라면 
        for i in range(1, n+1) : 
            plus = i if i&1 else 0
            answer += plus
    else : 
        for i in range(1, n+1) : 
            plus = 0 if i&1 else i
            answer += plus**2
    return answer