def factorial(n) : 
    if n > 1 : 
        return n * factorial(n-1)
    else : 
        return 1
        

def solution(balls, share):
    answer = factorial(balls) / (factorial(share) * factorial(balls - share))
    return answer