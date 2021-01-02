from random import choice
from typing import TextIO


class Game:
    def __init__(self):
        self.build_dictionary()
        self.choose_word()
        self.thread()

    images: list = [
        '''
           +---+
               |
               |
               |
             =====
        ''',
        '''
           +---+
           O   |
               |
               |
             =====
        ''',
        '''
           +---+
           O   |
           |   |
               |
             =====
        ''',
        '''
           +---+
           O   |
          /|   |
               |
             =====
        ''',
        '''
           +---+
           O   |
          /|\\  |
               |
             =====
        ''',
        '''
           +---+
           O   |
          /|\\  |
          /    |
             =====
        ''',
        '''
           +---+
           O   |
          /|\\  |
          / \\  |
             =====
        ''']

    word_list: list = []
    chosen_word: str = ""
    guesses: str = ""
    guess: str = ""
    guess_increment: int = 0
    chances: int = 0

    def build_dictionary(self):
        open_file: TextIO = open('./words.txt')

        for line in open_file:
            line = line.strip().lower()

            if self.is_line_clean(line):
                self.word_list.append(line)

    @staticmethod
    def is_line_clean(line: str):
        if ((len(line) < 4 or len(line)) > 8) or not line.isalpha():
            return False
        else:
            return True

    def choose_word(self):
        self.chosen_word = choice(self.word_list)

    def thread(self):
        while self.chances < len(self.images):
            self.player_guess()
            self.word_feedback()
            print(self.images[self.chances])

    def word_feedback(self):
        self.guess_increment = 0

        for char in self.chosen_word:
            if char in self.guesses:
                print(char, end=" ")
                self.guess_increment += 1
            else:
                print("_", end=" ")

            if self.guess_increment == len(self.chosen_word):
                print("\nYou win!")
                print("The word was " + self.chosen_word + "!")
                self.game_over(True)

        print("\n\nLetters guessed: " + self.guesses)

    @staticmethod
    def game_over(state: bool):
        if state:
            raise Exception("You win!")
        else:
            raise Exception("You lose!")

    def player_guess(self):
        self.guess = input("Guess a letter: ")

        self.validate_guess()

        self.guesses += self.guess

        self.check_guess()

    def validate_guess(self):
        while (not self.guess.isalpha()) or len(self.guess) > 1 or self.guess in self.guesses:
            self.guess = input("Invalid input. Please guess a letter: ")

    def check_guess(self):
        if self.guess in self.chosen_word:
            print("You guessed right!")
        else:
            print("You guessed wrong!")
            self.chances += 1

            if self.chances == len(self.images) - 1:
                print("You lose!")
                print("The word was " + self.chosen_word + "!")
                print(self.images[len(self.images) - 1])
                self.game_over(False)


Game()
