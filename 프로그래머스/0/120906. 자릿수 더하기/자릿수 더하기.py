def solution(n):
    n = str(n)
    n = ''.join(n)
    n = list(map(int, n))
    return sum(n)