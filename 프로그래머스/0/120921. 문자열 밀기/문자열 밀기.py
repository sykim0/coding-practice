# from collections import deque

# def solution(A, B):
#     if A == B:
#         return 0
    
#     length = len(B)
#     answer = -1
#     A_queue = deque(A)
    
#     cnt = 1
#     while cnt <= length : 
#         A_queue.rotate(1)
#         if ''.join(A_queue) == B : 
#             answer = cnt
#             break
#         else : 
#             cnt += 1
            
#     return answer

def solution(A, B):
    if A == B : 
        return 0
    answer = -1
    
    cnt = 1
    length = len(B)
    
    while cnt <= length : 
        A = A[-1] + A[:-1]
        if A == B : 
            answer = cnt
            break
        else : 
            cnt +=1
    return answer
