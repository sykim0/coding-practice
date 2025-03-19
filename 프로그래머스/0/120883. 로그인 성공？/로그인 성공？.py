def solution(id_pw, db):
    answer = "login"
    
    if id_pw not in db : 
        for db_id in db : 
            if (id_pw[0] == db_id[0]) & (id_pw[1] != db_id[1]) : 
                answer = "wrong pw"
                break
                
            elif (id_pw[0] != db_id[0]) :
                answer = "fail"
        
    return answer