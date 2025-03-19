def solution(order):
    order = list(str(order))
    order = [int(num) for num in order]
    clap = [1 if num in [3,6,9] else 0 for num in order]
    return sum(clap)