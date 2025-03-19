def solution(numbers):
    idx = len(numbers) - 1
    if not len(numbers) % 2 :
        answer = (numbers[idx//2] + numbers[idx//2 + 1]) / 2
    else : 
        answer = numbers[idx//2]
    return answer 