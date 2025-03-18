def 약수(N):
    if N == 1:
        return [1]
    else :
        num_list = []
        for num in range(1, N + 1):
            checking = N % num # num과 num2가 pair인 약수인지
            if not checking :
                num2 = N // num
                if num2 in num_list : 
                    break
                num_list.extend([num, num2] if num != num2 else [num]) # 제곱수 고려
            else : 
                continue
        return set(num_list)
    
def 최대공약수(N1_set, N2_set) : 
    return max(N1_set.intersection(N2_set))

def solution(numer1, denom1, numer2, denom2):
    denom1_cd = set(약수(denom1))
    denom2_cd = set(약수(denom2))
    gcd = 최대공약수(denom1_cd, denom2_cd)
    
    
    final_denom = (denom1 * denom2) // gcd
    final_numer = (numer1 * denom2 + numer2 * denom1) // gcd
    
    if not final_numer % final_denom   : # 분모 분수가 4/2 같은 경우..
        answer = [final_numer // final_denom,1]
        
    else : 
        answer = [final_numer, final_denom]
    
    numer = (numer1 * denom2) + (numer2 * denom1)
    denom = denom1 * denom2
    
    numer_약수 = 약수(numer)
    denom_약수 = 약수(denom)
    gcd = 최대공약수(numer_약수, denom_약수)
    
    answer = [numer//gcd, denom//gcd]
    
    
    return answer


