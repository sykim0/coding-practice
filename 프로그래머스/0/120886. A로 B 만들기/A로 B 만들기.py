def solution(before, after):
    before_cnt = {b : 0 for b in set(before)}
    after_cnt = {a : 0 for a in set(after)}
    
    for alphabet in before : 
        for key in before_cnt.keys() : 
            if alphabet == key : 
                before_cnt[key] += 1
                break
    
    for alphabet in after : 
        for key in after_cnt.keys() : 
            if alphabet == key : 
                after_cnt[key] += 1
                break
                
    answer = (before_cnt == after_cnt) * 1
    return answer