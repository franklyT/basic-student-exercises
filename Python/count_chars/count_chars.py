def count_chars_lambda(str, char):
    return len(list(filter(lambda char2: char2 == char, str)))

# Simple version
def count_chars(str, char):
    count = 0
    for i in str: 
        if i == char: 
            count = count + 1
    return count

print(count_chars('abbc', 'b'))
