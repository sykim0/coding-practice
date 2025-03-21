# def solution(my_str, n):
#     if len(my_str) % n == 0 : 
#         answer = [my_str[i : i + n] for i in range(0, len(my_str), n)]
#     else : 
#         answer = [my_str[i : i + n] for i in range(0, len(my_str) - n, n)] + [my_str[-(len(my_str) % n) : ]]
#     return answer

def solution(my_str, n):
    answer = [my_str[i : i + n] for i in range(0, len(my_str), n)]
    return answer