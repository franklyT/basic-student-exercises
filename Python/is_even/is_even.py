def is_even(num):
    num = abs(num)

    if num == 0: return print(True)
    if num == 1: return print(False)

    is_even(num - 2)
    
is_even(-201)
is_even(200)
