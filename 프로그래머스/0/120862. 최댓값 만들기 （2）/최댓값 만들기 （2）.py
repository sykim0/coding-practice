from collections import deque

def solution(numbers):
    plus = sorted([num for num in numbers if num > 0])
    
    minus = sorted([num for num in numbers if num < 0])
    
    if (len(numbers) ==2) & (len(plus) == 1) & (len(minus) == 1) : 
        return plus[0] * minus[0]
    
    minus = deque(minus)

    plus_max = (plus.pop() * plus.pop()) if len(plus) >=2 else 0
    
    # minus는 음수여서 단순 pop이 아님.
    # 하지만 queue로 변경해줘서 popleft로 가능
    minus_max = (minus.popleft() * minus.popleft()) if len(minus) >=2 else 0
    
    answer = max(plus_max, minus_max)
    
    return answer