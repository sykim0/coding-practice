def solution(n):
    array = [0] * (n + 1) 
    
    for idx in range(1, n + 1) : 
        if idx % 2 : 
            array[idx] = 1
    
    answer = filter(lambda x : array[x] == 1, range(len(array) ))
    answer = sorted(list(answer))
    return answer

print(solution(6))