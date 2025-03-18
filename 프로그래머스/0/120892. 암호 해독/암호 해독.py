def solution(cipher, code):
    length = len(cipher)
    answer = [cipher[s] for s in range(code - 1, length, code)]
    return ''.join(answer)