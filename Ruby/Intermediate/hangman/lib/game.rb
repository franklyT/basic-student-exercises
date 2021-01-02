# frozen_string_literal: true

# Game class
class Game
  attr_accessor :choice, :debug, :display_word, :guesses, :guessed_letters, :guess_word, :wrong_answers
  def initialize
    @guesses = 5
    @debug = true

    @guessed_letters = []
    @display_word = []
    @guess_word = []
    @wrong_answers = 0
    @guess = ''

    introduction_text
    introduction_options
    load_or_new
  end

  def introduction_text
    print "---------------------------------------------------------------------------------------------------\n" \
          "Welcome to hangman!\n" \
          "Please observe the following rules:\n" \
          "You have #{@guesses} before our intrepid friend, the hangman, meets his untimely end.\n" \
          "Piece together the secret word by guessing the appropriate letters before you run out of guesses.\n" \
          "Good luck!\n" \
          "---------------------------------------------------------------------------------------------------\n"
  end

  def introduction_options
    puts 'Press 1 to start a new game. Press 2 to load a saved game.'

    loop do
      @choice = gets.chomp.to_i

      break if [1, 2].include?(@choice)
      puts 'Error: invalid input.'
      puts 'Press 1 to start a new game. Press 2 to load a saved game.'
    end
  end

  def load_or_new
    # 1 for a new game, 2 to load a game
    if @choice == 1
      new_game
    elsif @choice == 2
      pick_save
    end
  end

  def new_game
    set_word
    thread
  end

  def save_game
    index = 0
    index += 1 while File.exist?("saves/save#{index}.txt")

    File.open("saves/save#{index}.txt", 'w') { |file|
      Marshal.dump(self, file)
    }
  end

  def load_game(index)
    File.open("saves/save#{index}.txt", 'r') { |file|
      new_instance = Marshal.load(file)

      @guesses = new_instance.guesses
      @display_word = new_instance.display_word
      @guess_word = new_instance.guess_word
      @wrong_answers = new_instance.wrong_answers

      puts 'Save loaded. Enjoy!'
      thread
    }
  end

  def list_saves
    @valid_saves = []
    Dir.glob('saves/*.txt').each_with_index do |file, index|
      @valid_saves << index
      puts "#{index}. Location: #{file}"
    end
  end

  def pick_save
    list_saves
    puts "Please pick the save you'd like to load now."
    chosen_save = gets.chomp.to_i

    loop do
      break if @valid_saves.include?(chosen_save)
      puts 'Error: invalid input.'
      list_saves
      puts "Please pick the save you'd like to load now."
      chosen_save = gets.chomp.to_i
    end
    load_game(chosen_save)
  end

  def set_word
    possible_words = []

    File.open('5desk.txt', 'r') { |file|
      possible_words << file.readline until file.eof?
    }

    @guess_word = possible_words.sample.split('')

    (@guess_word.length - 1).times do
      @display_word << '_'
    end
    puts "Secret word: #{@guess_word.join('')}" if @debug == true
  end

  def check_win
    puts 'You lost!' if @wrong_answers > 4
    puts 'You won!' if (@guess_word - @display_word).length == 1
  end

  def get_guess
    puts 'Please input your guess now:'
    puts 'Alternately, type "save" to save your game.'

    @guess = gets.chomp

    until (/[A-Z]/i.match?(@guess) && !@guessed_letters.include?(@guess) && @guess.length == 1) || @guess == 'save'
      puts 'Error: Invalid input.'
      puts 'Please input your guess now:'
      puts 'Alternately, type "save" to save your game.'

      @guess = gets.chomp
    end

    if @guess == 'save'
      puts 'Game saved!'
      save_game
      return get_guess
    end

    @guessed_letters << @guess.clone
  end

  def compare_guess_to_word
    bad_guess = true

    @guess_word.each_with_index do |letter, index|
      if @guess.downcase == letter.downcase
        @display_word[index] = letter
        bad_guess = false
      end
    end

    wrong_guess if bad_guess == true

    puts @display_word.join(' ')
  end

  def wrong_guess
    @wrong_answers += 1
    puts 'You messed up!'
    puts "Wrong answers: #{@wrong_answers}"
  end

  def list_guesses
    puts "Guessed letters: #{@guessed_letters}"
  end

  def thread
    until @wrong_answers == @guesses || (@guess_word - @display_word).length == 1
      get_guess
      compare_guess_to_word
      list_guesses
      check_win
    end
  end
end

hangman_instance = Game.new
