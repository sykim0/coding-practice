# def solution(n):
#     cd_list = []
#     for i in range(1, n + 1) :
#         remainder = n % i
#         if not remainder : # 나머지가 없으면
#             quot = n // i 
#             if quot in cd_list : 
#                 break
#             cd_list.extend([i, quot] if i != quot else [i])
            
#     answer = sorted(cd_list)
#     return answer

def solution(n):
    answer = [i for i in range(1,n+1) if n%i == 0]
    return answer