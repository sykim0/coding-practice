def solution(numbers):
    max_val = max(numbers)
    numbers.remove(max_val)
    max_sec = max(numbers)
    return max_val * max_sec