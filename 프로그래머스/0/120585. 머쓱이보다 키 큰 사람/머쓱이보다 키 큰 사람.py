def solution(array, height):
    result = [friend for friend in array if friend > height ]
    return len(result)