# 문제가 묻는 것.
# AandB + BanC + AandC

# [0,1,2,3,4,5]
# [3,4,5,6,7,8,9]
# [1,2,3,4,5,6,7,8,9,10]
# A and B : 3,4,5
# B and C : 3,4,5,6,7,8,9
# A anc C: 1,2,3
# (A and B)  (B and C) (A and C) ////// 1,2,3,4,5,6,7,8,9
                                # ////// [3,4,5], [3,4,5,6,7,8,9], [1,2,3,4,5] 2 + 6 + 4 - 2*2(AandBandC)

# [-1,0,1]
# [1,2,3]
# [3,4,5,6,7,8,9]
# AandB : 1
# BandC : 3
# AandC : X

# [0,1,2]
# [-3,-2,-1]
# [-2,-1,0,1]
# X, [-2,-1], [0,1] => 2 연결된게 아니라 각각 1씩 이니까 


def solution(lines):
    A = [k for k in range(lines[0][0], lines[0][1] + 1)]
    B = [k for k in range(lines[1][0], lines[1][1] + 1)]
    C = [k for k in range(lines[2][0], lines[2][1] + 1)]
    
    AandB = set(A).intersection(set(B))
    AandC = set(A).intersection(set(C))
    BandC = set(B).intersection(set(C))
    AandBandC = (set(A).intersection(set(B))).intersection(set(C))
    
    all_count = 0
    if AandBandC.issubset(AandB) : all_count += 1
    if AandBandC.issubset(AandC) : all_count += 1
    if AandBandC.issubset(BandC) : all_count += 1
    all_count -= 1 #1번은 무조건 있으니 
    
    
    AandB = len(AandB) - 1 if len(AandB) >=2 else 0
    AandC = len(AandC) - 1 if len(AandC) >=2 else 0
    BandC = len(BandC) - 1 if len(BandC) >=2 else 0
    AandBandC = len(AandBandC) - 1 if len(AandBandC) >=2 else 0

    answer = AandB + AandC + BandC - (AandBandC * all_count)
    return answer