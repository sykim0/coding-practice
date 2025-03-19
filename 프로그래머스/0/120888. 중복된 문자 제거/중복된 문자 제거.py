def solution(my_string):
    unique_dict = {word : 0 for word in set(my_string)}
    for s in my_string : 
        unique_dict[s] += 1
    
    dup_list = {key : 0 for key, value in unique_dict.items() if value >= 2}
    my_list = list(my_string)
    
    for i, s in enumerate(my_list) : 
        if s in dup_list.keys() :
            
            if dup_list[s] == 0:
                dup_list[s] += 1
            else :
                my_list[i] = ''
    
    answer = ''.join(my_list)
    return answer