def solution(common):
    diff = []
    length = len(common)
    for i in range(0, len(common) - 1) : 
        diff.append(common[i + 1] - common[i])
    if diff[0] == diff[-1] : 
        constant = common[0] - diff[0]
        answer = diff[0] *(length + 1) + constant
    else : 
        ratio = []
        for i in range(0, len(common) - 1) : 
            ratio.append(common[i + 1] / common[i])
            a = common[0]
            answer = a * (ratio[0]**length)
    return answer


