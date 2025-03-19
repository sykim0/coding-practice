def solution(dots):
    a, b, c, d = dots
    
    fir = 0
    sec = 0
    
    for dot in [b,c,d] : 
        if a[0] == dot[0] : 
            fir = dot
        elif a[1] == dot[1] : 
            sec = dot
    
    answer= abs(fir[1] - a[1]) * abs(sec[0] - a[0])
    
    return answer