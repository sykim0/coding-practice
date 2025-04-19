def solution(q, r, code):
    # return ''.join([s for i, s in enumerate(code) if i % q == r])
    return code[r :: q]