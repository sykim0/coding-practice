def solution(num, total):
    answer = [0] * num
    
    if num % 2 == 0 :
        mid_left_idx = num // 2 - 1
        mid_right_idx = num // 2 
        mid_left = total // num
        mid_right = total // num + 1
        
        for i in range(0, mid_right_idx) : 
            answer[i] = mid_left - (mid_left_idx - i)
        
        for i in range(mid_right_idx, num) : 
            answer[i] = mid_right - (mid_right_idx - i)
        
        
    else :     
        mid_idx = num // 2
        mid = total // num
        
        for i in range(0, num) : 
            answer[i] = mid - (mid_idx - i)  
            
    return answer