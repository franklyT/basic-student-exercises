from random import randint
from time import sleep

max_guesses = 5
guess_count = 0
hidden_num = 0
player_guess = ""

def try_to_set_int():
    while True:
        try:
            return int(input("Please input a valid integer. "))
        except:
            print("That is not a valid integer. Please input a valid integer.")

def check_guess():
    if (player_guess == hidden_num):
        print("You guessed the number! It was " + str(hidden_num))
    else:
        if (player_guess < hidden_num):
            print("You guessed too low.")
        else:
            print("You guessed too high.")

        print(f"You have used {guess_count} out of a maximum of {max_guesses} max guesses.")

print("Set the minimum possible number.")
min_number = try_to_set_int()

print("Set the maximum possible number.")
max_number = try_to_set_int()

hidden_num = randint(min_number, max_number)

print("The computer has calculated a random number!")

sleep(1)

while ((guess_count < max_guesses) and (player_guess != hidden_num)):
    guess_count += 1

    player_guess = try_to_set_int()

    check_guess()
