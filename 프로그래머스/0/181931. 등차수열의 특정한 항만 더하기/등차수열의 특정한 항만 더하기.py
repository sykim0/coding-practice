def solution(a, d, included):
    first = d - a
    sequence = [d*i - (d - a) for i in range(1,len(included) + 1)]
    answer = sum([num for i, num in enumerate(sequence) if included[i]])
    return answer