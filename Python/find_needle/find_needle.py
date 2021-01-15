def find_needle(haystack):
    for i, x in enumerate(haystack):
        if x == 'needle': 
            print('found the needle at position ' + str(i))
            return
    print(None)
    return
