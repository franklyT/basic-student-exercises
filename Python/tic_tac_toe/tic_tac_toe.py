board = [['1', 'X', '3'],
         ['4', 'X', '6'],
         ['7', 'X', '9']]

def print_board():
    for row in board:
        index = 0
        for char in row:
            print(char, end = "")
            if index != 2:
                print("|", end = "")
                index += 1
        print("")

def check_diagonals():
    diag_lr = set([board[i][i] for i in range(len(board))])
    diag_rl = set([board[i][len(board)-i-1] for i in range(len(board))])

    if len(diag_lr) == 1 or len(diag_rl) == 1:
        return "".join(filter(lambda diag: len(diag) == 1, [ "".join(diag_rl), "".join(diag_lr) ] ))
    return None

def check_rows():
    for row in board:
        if len(set(row)) == 1:
            return row[0]
    return None

def check_columns():
    for n in range(len(board)):
        column = set([board[i][n] for i in range(len(board))])

        if len(column) == 1:
            return "".join(column)
    return None

def check_win():
    if check_diagonals() != 0 or check_rows() != 0 or check_columns() != 0:
        return check_diagonals() or check_rows() or check_columns() or "Nobody"

print_board()
print(check_win())
