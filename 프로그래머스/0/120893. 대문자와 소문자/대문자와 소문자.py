def solution(my_string):
    new_string = ''
    for s in my_string : 
        if s.islower() : 
            new_string += s.upper()
        else : 
            new_string += s.lower()
    return new_string