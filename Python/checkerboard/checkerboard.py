def checkerboard(rows, cols):
    the_board = ""
    for i in range(0, rows):
    	for j in range(0, cols):
        	if (j + i) % 2 != 0:
            	the_board += "#"
        	else:
            	the_board += " "
            the_board += "\n"
    return the_board
