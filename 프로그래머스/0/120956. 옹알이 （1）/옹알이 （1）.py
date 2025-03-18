def solution(babbling):
    input = babbling
    possible = ["aya", "ye", "woo", "ma"]
    result = 0
    
    for i, bab in enumerate(input) :
        for sound in possible : 
            a = (sound in bab) 
            if a : 
                bab = bab.replace(sound, ' ')
        input[i] = bab.strip()
        if not len(input[i]) : 
            result += 1

    return result