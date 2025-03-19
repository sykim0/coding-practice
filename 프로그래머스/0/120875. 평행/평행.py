# # 두 직선이 평행
# # x축과 y축에 평행하지는 않으므로 2개 2개로 나눠볼 때 각 그룹의 x좌표 또는 y좌표가 같은 건 아님.
#     # (1,2), (1,5) // (5,7, 5,12) 같이
# 기울기 (y2 - y1 = a1 / x2 - x1 = b1 ), (y4 - y3 = a2/ x4 - x3 = b2)
# b1 * a2 == a1 * b2 
# 이 조합을 확인해주면 됨.
from itertools import combinations

def solution(dots) : 
    cases = [
        (dots[0], dots[1], dots[2], dots[3]),
        (dots[0], dots[2], dots[1], dots[3]),
        (dots[0], dots[3], dots[1], dots[2]),
    ] 
    
    for (x1, y1), (x2, y2), (x3, y3), (x4, y4) in cases : 
        slope1 = (y2 - y1) / (x2 - x1)
        slope2 = (y4 - y3) / (x4 - x3)
        
        if slope1 == slope2 : 
            return 1
        
    return 0