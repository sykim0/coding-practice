def solution(chicken):
    tnt_chicken = 0 # 108 10 1
    
    while chicken >= 10 :
        chicken, coupon = divmod(chicken, 10)
        tnt_chicken += chicken
        chicken += coupon
    
    return tnt_chicken 