def solution(n):
    # 제한사항 1000
    even_n = []
    for num in range(1, n + 1) : 
        cond = num % 2
        if not cond : 
            even_n.append(num)
    return sum(even_n)