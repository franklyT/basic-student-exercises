from random import choice

class Game:
    def __init__(self):
        self.build_dictionary()
        self.choose_word()
        self.thread()

    images = [
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
          /|\  |
               |
             =====
        ''',
        '''
           +---+
           O   |
          /|\  |
          /    |
             =====
        ''',
        '''
           +---+
           O   |
          /|\  |
          / \  |
             =====
        ''']

    word_list = []
    chosen_word = ""
    guesses = ""
    guess_increment = 0
    chances = 0

    def build_dictionary(self):
        open_file = open('../words.txt')

        for line in open_file:
            line = line.strip().lower()

            if len(line) < 4 or len(line) > 7: continue
            if not line.isalpha(): continue

            self.word_list.append(line)

    def choose_word(self):
        self.chosen_word = choice(self.word_list)

    def thread(self):
        while self.chances < len(self.images):
            self.guess()
            self.word_feedback()
            print(self.images[self.chances])

    def word_feedback(self):
        self.guess_increment = 0

        for char in self.chosen_word:
            if char in self.guesses: 
                print(char, end = " ")
                self.guess_increment += 1
            else: 
                print("_", end = " ")
            
            if self.guess_increment == len(self.chosen_word):
                print("\nYou win!")
                raise 'Game over!'
            
        print("\n\nLetters guessed: " + self.guesses)

    def guess(self):
        guess = input("Guess a letter: ")

        while not (guess.isalpha()) or len(guess) > 1:
            guess = input("Invalid input. Please guess a letter: ")
        
        self.guesses += guess

        if guess in self.chosen_word:
            print("You guessed right!")
        else:
            print("You guessed wrong!")
            self.chances += 1
            if self.chances == len(self.images) - 1:
                print("You lose!")
                print(self.images[len(self.images) - 1])
                raise "You lose!"
    

hangman = Game()
