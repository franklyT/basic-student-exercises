rows = 8
cols = 8

for i in range(0, rows):
    checkerboard = ""
    
    for j in range(0, cols):
        if (j + i) % 2 != 0:
            checkerboard += "#"
        else:
            checkerboard += " "
    
    print(checkerboard)
