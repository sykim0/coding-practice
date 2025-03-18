def solution(hp):
    remain_hp = hp - (hp//5 * 5)
    final_hp = remain_hp - (remain_hp//3 * 3)
    answer = hp//5 + remain_hp//3 + final_hp//1
    return answer