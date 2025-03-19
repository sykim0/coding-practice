def facto(k) :
    if k == 1 : 
        return 1
    else : 
        return k * facto(k-1)

def solution(n):
    for i in range(1, 3628800) : 
        if facto(i) > n : 
            return i - 1