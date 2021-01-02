# frozen_string_literal: true

require_relative 'board'
require_relative 'codebreaker_human'
require_relative 'codebreaker_ai'
require_relative 'codemaker_human'
require_relative 'codemaker_ai'
require_relative 'helpers'

# The main class to be instantiated, passes all of the data
class Mastermind
  include Helpers
  attr_reader :board, :codebreaker, :codemaker, :turn

  def initialize
    @TURNS = 12
    @board = Board.new(@TURNS)

    @turn = 0

    introduction
    pick_role
    initialize_players
    initialize_game
    display_ui
    thread_game
  end

  private def display_ui
    newline
    @board.display_board
  end

  private def initialize_players
    name_player
    name_ai
  end

  private def initialize_game
    @codemaker.set_code
    @codebreaker.code = @codemaker.code
    newline
  end

  private def introduction
    puts "Welcome to a ruby CLI implementation of Mastermind!\n" \
          "-------------------------------------------------------------------------------------------------\n" \
          'The rules are simple: one player must guess the other player\'s secret code, ' \
          "comprised of four different colors.\n" \
          'At the end of a turn, a player will receive a 2 for every correctly colored ' \
          "peg in the correct slot, and a 1\n" \
          "for every peg that is correctly colored but not in the correct slot. 0 indicates a miss.\n" \
          "-------------------------------------------------------------------------------------------------\n" \
          'Press enter to continue.'
    gets
  end

  private def name_ai
    ai_name = %w[Edward Barnabus Dominic Frederick Harrison Leopold Oliver Sebastian Theodore Vincent].sample
    @codebreaker.is_human ? @codemaker.name = ai_name : @codebreaker.name = ai_name
    puts "Your opponent's name is #{ai_name}."
  end

  private def name_player
    puts 'Enter your name: '
    human_name = gets.chomp
    @codebreaker.is_human ? @codebreaker.name = human_name : @codemaker.name = human_name
    puts "Your name is now #{human_name}."
  end

  private def pick_role
    puts 'Please choose your role.'
    puts 'Type \'1\' for codebreaker, \'2\' for codemaker.'

    @chosen_role = gets.chomp.to_i
    until @chosen_role == 1 || @chosen_role == 2
      puts 'Invalid input. Please type \'1\' for codebreaker, \'2\' for codemaker.'
      @chosen_role = gets.chomp.to_i
    end

    write_roles
  end

  private def write_roles
    # 1 = codebreaker, 2 = codemaker
    if @chosen_role == 1
      puts 'You are the codebreaker.'
      @codemaker = CodemakerAi.new
      @codebreaker = CodebreakerHuman.new
    elsif @chosen_role == 2
      puts 'You are the codemaker.'
      @codemaker = CodemakerHuman.new
      @codebreaker = CodebreakerAI.new
    end
  end

  private def thread_game
    while @codebreaker.code_broken == false && @turn < @TURNS
      @codebreaker.turn
      @codebreaker.compare_guess_to_code
      @board.write_turn(@codebreaker.guess)
      @board.display_board
      @turn += 1
    end
    check_winner
  end

  private def check_winner
    puts @codebreaker.code_broken ? "#{@codebreaker.name} won. Good game!" : "#{@codemaker.name} won. Good game!"
  end
end

game_instance = Mastermind.new
