# 420 = 2 * 210 2가 소수인지 검사하고 소수면 뒤에꺼만 다시 분해
# 210  = 2 * 105 마찬가지로 105만 다시 분해
# 105 = (2 실패) 3 * 35
# 35 = 5 * 7
# 소수만 리스트에 잘 넣어뒀다면 리스트를 set으로 바꿔만 주면 됨.

# 어차피 소수를 계속 사용하니 n = 10000이어서 10000까지의 소수를 그냥 구해놓으면 빠를 듯함.


# 에라토스테네스의 체 : 2부터 시작해서 배수를 모두 지워나감.
def 소수리스트(k) : 
    소수 = [1] * (k + 1)
    소수[0] = 소수[1] = 0
    for i in range(2, int(k**0.5) + 1) : 
        if 소수[i] : # 지워지지 않았다면
            for j in range(i*i, k+1, i) : # 해당 수의 배수는 모두 소수가 아니므로 0 
                소수[j] = 0
    return 소수

def solution(n):
    소수 = 소수리스트(n) 
    answer = []
    
    i = 2
    re_num = n # 초기화

    
    while True  : 
        if 소수[re_num] :
            answer.append(re_num)
            break
        elif re_num % i == 0  : 
            answer.append(i)
            re_num = re_num // i 
            i = 2
        else : 
            i += 1
    answer = list(set(answer))
    answer.sort()
    return answer