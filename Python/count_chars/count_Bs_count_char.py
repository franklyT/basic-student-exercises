def count_Bs(str):
    return len(list(filter(lambda char: char == "B", str)))

def count_char(str, char):
    return len(list(filter(lambda char2: char2 == char, str)))

# Simple version for students
def simple_count_Bs(str):
    count = 0
    for i in str: 
        if i == 'B': 
            count = count + 1
    return count

print(count_Bs('BBBbbb'))

print(count_char('abbc', 'b'))
