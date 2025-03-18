def solution(my_string, n):
    answer = [n * char for char in my_string]
    return ''.join(answer)