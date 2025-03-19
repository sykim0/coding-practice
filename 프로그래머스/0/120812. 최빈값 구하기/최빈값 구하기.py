def solution(array):
    uniques = list(set(array))
    num_dict = {num : 0 for num in uniques}
    
    for num in array : 
        for key in num_dict.keys() : 
            if key == num : 
                num_dict[key] += 1
    max_val = max(num_dict.values())
    # max_val = 0
    # for key, value in num_dict.items() : 
    #     if value > max_val : 
    #         max_val = value
    #     else : 
    #         continue
    
    i = 0
    result = 0
    for key, value in num_dict.items() : 
        if value == max_val : 
            i += 1
            result = key
        else : 
            continue
     
    answer = result if i == 1 else -1
        
    return answer