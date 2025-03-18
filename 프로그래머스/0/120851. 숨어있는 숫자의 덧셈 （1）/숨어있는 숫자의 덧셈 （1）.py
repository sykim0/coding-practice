import re

def solution(my_string):
    new_string = re.sub('[^0-9]', '', my_string)
    answer = sum([int(num) for num in new_string])
    return answer