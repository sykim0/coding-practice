def solution(box, n):
    height = box[2] // n
    vert = box[1] // n
    hori = box[0] // n
    return hori * vert * height