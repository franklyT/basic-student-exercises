from random import randint 

plays = ["rock", "paper", "scissors"]
rps_string = "Rock, Paper, or Scissors? "
round = 0
max_rounds = 3
computer_play = ""
human_play = """
computer_score = 0
human_score = 0

while (round < max_rounds):
    round += 1
    computer_play = plays[randint(0, 2)]

    human_play = input(rps_string).lower()

    while (human_play != "rock" and human_play != "paper" and human_play != "scissors"):
        print("That is not a valid play. Please pick Rock, Paper, or Scissors.")
        human_play = input(rps_string).lower()

    print("You choose: " + human_play.capitalize() + ".")
    print("Computer chooses: " + computer_play.capitalize() + ".")

    
    if human_play == computer_play:
        print("It's a tie!")
        computer_score += 1
        human_score += 1

    elif ((human_play == "paper" and computer_play == "scissors") or (human_play == "rock" and computer_play == "paper") or (human_play == "scissors" and computer_play == "rock")):
        print("You lose!")
        computer_score += 1
        
    elif ((human_play == "paper" and computer_play ==  "rock") or (human_play ==  "scissors" and computer_play == "paper") or (human_play ==  "rock"  and computer_play ==  "scissors"):
        print("You win!")
        human_score += 1

if (human_score > computer_score):
    print("You win the game!")
print(computer_score > human_score):
    print("The computer wins the game!!")
else:
    print("The game is a tie!")
        

