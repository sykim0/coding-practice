# [3x, 7, x]
# [x,x,x, 7, x] => count if count == 1 : ''
# f'{x_count}x + intercept'

def solution(poly):
    poly = poly.split(' + ')
    
    xs = []
    intercept = []
    
    for elem in poly : 
        if 'x' in elem :
            if elem[0] == 'x' : # 계수 없는 상태 
                xs.extend(['x'])
            else :
                x_count = elem[ : elem.find('x')]
                xs.extend(['x'] * int(x_count))
        else : 
            intercept.extend([elem])

    intercept = sum(map(int, intercept))
    x_count = xs.count('x')
    
    
    if x_count == 0 : 
        if intercept == 0 : 
            return ''
        else : 
            return str(intercept)
    elif x_count == 1:
        if intercept == 0 : 
            return 'x'
        else : 
            return f'x + {intercept}'
    else : 
        if intercept == 0 :
            return f'{x_count}x'
        else : 
            return f'{x_count}x + {intercept}'
