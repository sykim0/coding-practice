def solution(numLog):
    answer = ""
    change_dict = {1 : "w", -1 : "s", 10 : "d", -10 : "a"}
    for i in range(len(numLog)) : 
        if i == len(numLog) - 1 : 
            break
        
        answer += change_dict[numLog[i+1] - numLog[i]]
    return answer