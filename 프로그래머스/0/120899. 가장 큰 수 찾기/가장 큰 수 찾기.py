def solution(array):
    max_val = max(array)
    for i, num in enumerate(array) : 
        if num == max_val : 
            answer = [num, i]
    return answer