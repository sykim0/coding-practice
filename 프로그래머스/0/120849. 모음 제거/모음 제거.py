def solution(my_string):
    vowels = ['a', 'e', 'i', 'o', 'u']
    
    for i, alphabet in enumerate(my_string) : 
        for vowel in vowels : 
            if alphabet == vowel : 
                # my_string[i] = ''
                my_string = my_string.replace(alphabet, '')
                break
    answer = my_string
    return answer