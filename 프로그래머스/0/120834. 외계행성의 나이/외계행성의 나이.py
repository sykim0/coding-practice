def solution(age):
    ages = list(str(age))
    answer = [chr(int(age) + 97) for age in ages]
    return ''.join(answer)