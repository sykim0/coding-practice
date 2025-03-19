def solution(quiz):
    quizs = [i.split(' = ') for i in quiz]
    result = []
    for q in quizs : 
        q1, a1 = q[0], int(q[1])
        num1, pm, num2 = q1.split(' ')
        if pm == "+" : 
            result.append((int(num1) + int(num2)) == a1)
        elif pm == '-' : 
            result.append((int(num1) - int(num2)) == a1)
    
    result = ''.join(list(map(str, result)))
    result = list(result.replace("False", "X").replace("True", "O"))
    return result