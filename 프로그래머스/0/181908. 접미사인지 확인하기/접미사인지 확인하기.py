def solution(my_string, is_suffix):
    all_s = [my_string[i:] for i in range(len(my_string))]
    return 1 if is_suffix in all_s else 0