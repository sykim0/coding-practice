def solution(my_string, num1, num2):
    
    my_list = list(my_string)
    my_list[num1], my_list[num2] = my_list[num2], my_list[num1]
    
    answer = ''.join(my_list)
    return answer