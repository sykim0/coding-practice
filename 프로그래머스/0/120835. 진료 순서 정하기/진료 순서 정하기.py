# def solution(emergency):
#     sort_emer = sorted(emergency, reverse = True)
#     emer_dict = dict(zip(sort_emer, [rank for rank in range(1, len(emergency) + 1)]))
    
#     answer = []
#     for key in emergency : 
#         answer.append(emer_dict[key])
        
#     return answer

def solution(emergency):
    e = sorted(emergency,reverse=True)
    return [e.index(i)+1 for i in emergency]