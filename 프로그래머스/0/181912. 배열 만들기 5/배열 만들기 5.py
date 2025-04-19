def solution(intStrs, k, s, l):
    answer = []
    for num in intStrs : 
        part = int(num[s : s + l])

        if part > k : 
            answer.append(part)
    return answer