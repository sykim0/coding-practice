def solution(number):
    number = number.replace('','+')[1:-1]
    answer = eval(number) % 9
    return answer