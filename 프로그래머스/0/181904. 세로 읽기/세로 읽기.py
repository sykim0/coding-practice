def solution(my_string, m, c):
    # answer = ''
    # for i, s in enumerate(my_string) : 
    #     row, col = divmod(i, m)
    #     if col == (c-1) : 
    #         answer += s
    # return answer
    
    return my_string[c - 1 : : m]