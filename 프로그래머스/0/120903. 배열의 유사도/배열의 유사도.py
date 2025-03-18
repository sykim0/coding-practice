def solution(s1, s2):
    len1 = len(s1  + s2)
    len2 = len(set(s1 + s2))
    return abs(len1 - len2)