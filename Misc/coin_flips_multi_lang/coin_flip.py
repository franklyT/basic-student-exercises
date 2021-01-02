from random import randint

heads_count = [0]
tails_count = [0]
max_iterations = 10

for i in range(0, max_iterations):
    [heads_count, tails_count][randint(0, 1)][0] += 1

    # alternately, more lines, more readable:
    # if (randint(0, 1) == 0): heads_count +=1
    # else: tails_count += 1


print(f"Heads #: {heads_count[0]}")
print(f"Tails #: {tails_count[0]}")
