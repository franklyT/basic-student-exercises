def count_char(str, char):
    return len(list(filter(lambda char2: char2 == char, str)))

# Simple version
def simple_count_chars(str, char):
    count = 0
    for i in str: 
        if i == char: 
            count = count + 1
    return count

print(count_char('abbc', 'b'))
