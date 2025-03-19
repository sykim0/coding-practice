# from itertools import permutations

# def solution(spell, dic):
#     length = len(spell)
    
#     combine = []
#     for i in permutations(spell, length) : 
#         combine.append(''.join(i))
    
#     for word in dic : 
#         if word in combine : 
#             return 1
        
#     return 2

def solution(spell, dic):
    spell = set(spell)
    for s in dic:
        if not spell-set(s):
            return 1
    return 2