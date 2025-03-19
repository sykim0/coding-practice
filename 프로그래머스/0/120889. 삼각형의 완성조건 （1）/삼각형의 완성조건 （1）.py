def solution(sides):
    max_leng = max(sides)
    sides.remove(max_leng)
    answer = 1 if max_leng < sum(sides) else 2
    return answer