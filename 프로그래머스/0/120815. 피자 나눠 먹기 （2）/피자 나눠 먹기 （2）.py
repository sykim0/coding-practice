import math
def solution(n):
    gcd = math.gcd(6, n)
    return (n * 6) // gcd // 6