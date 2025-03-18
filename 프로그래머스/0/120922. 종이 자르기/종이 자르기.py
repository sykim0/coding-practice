def solution(M, N):
    fir, sec = min(M, N), max(M,N)
    
    # answer = (fir - 1) + fir * (sec - 1)
    answer = fir * sec - 1
    return answer