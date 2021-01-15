import math

def getMiddle(str):
    if len(str) % 2 == 0: return str[int(len(str) / 2 - 1)] + str[int(len(str) / 2)];
    return str[math.floor(len(str) / 2)]

print(getMiddle("Helllo"))
