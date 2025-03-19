from collections import deque

def solution(numbers, direction):
    if direction == "right" : 
        answer = [numbers[-1]] + numbers
        answer.pop()
    else : 
        answer = deque(numbers + [numbers[0]])
        answer.popleft()
        answer = list(answer)
    return answer