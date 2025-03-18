def solution(n):
    array = [0]
    for i in range(1, 1000) : 
        if (i % 3 == 0) | ("3" in str(i)) :  
            continue
        else : 
            array.append(i)
            
    answer = array[n]
    return answer
