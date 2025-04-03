def solution(number, n, m):
    answer = 0
    
    share, check_first = divmod(number, n)
    
    if check_first == 0: 
        check_second = number % m
        answer = (check_second == 0)* 1
        
    return answer