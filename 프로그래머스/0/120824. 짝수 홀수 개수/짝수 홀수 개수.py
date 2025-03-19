def solution(num_list):
    length = len(num_list)
    even = 0
    odd = 0
    for i in range(length) : 
        if not num_list[i] % 2 : 
           even += 1
        else : 
            odd += 1
    answer = [even, odd]
        
    return answer