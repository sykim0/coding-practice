def solution(num_list, n):
    answer = []
    length = len(num_list)
    group = length // n
    
    for i in range(0, length, n) : 
        answer.append(num_list[i:i+n])
               
    return answer