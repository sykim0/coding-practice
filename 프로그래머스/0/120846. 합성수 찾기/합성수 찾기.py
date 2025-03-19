def 약수(k) :
    return len([i for i in range(1, k + 1) if k%i ==0])

def solution(n):
    answer = 0
    for num in range(1, n + 1) : 
        if 약수(num) >=3 : 
            # print(num, 약수(num))
            answer += 1
    
    return answer