# frozen_string_literal: true

class TicTacToe
  attr_reader :board, :player1, :player2, :player_turn

  def initialize
    @game_over = false
    @board = Board.new
    @active_player = @board.player1

    puts @board.display
    thread
  end

  def thread
    loop do
      if @board.check_draw
        puts "It's a draw!"
        break
      end

      if @game_over == true
        puts "Game over. #{@active_player == @board.player1 ? @board.player2.name : @board.player1.name} is victorious."
        break
      end

      puts "#{@active_player.name}, choose your move."
      @move = gets.chomp
      if @board.display.include?(@move)
        @board.move_count += 1
        @board.move(@active_player, @move.to_i)
        @game_over = @board.check_win(@active_player)
        @active_player = (@active_player == @board.player1 ? @board.player2 : @board.player1)
      else
        puts 'Please input a valid position.'
      end
    end
  end
end

class Player
  attr_accessor :name, :number, :combinations, :player_symbol
  @@number = 0

  def initialize
    @name = ''
    @combinations = []
    @@number += 1
    @player_symbol = Player.get_class_var == 1 ? 'X' : 'O'

    name_player
  end

  def self.get_class_var
    @@number
  end

  def name_player
      puts "Player #{Player.get_class_var}, enter your name:"
      @name = gets.chomp
      puts "Player #{Player.get_class_var} is now #{@name}."
  end
end

class Board
  attr_accessor :display, :player1, :player2, :draw, :move_count

  def initialize
    @winning_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    @display = "|1|2|3|\n|4|5|6|\n|7|8|9|"
    @player1 = Player.new
    @player2 = Player.new
    @move_count = 0
  end

  def move(player, location)
    player.combinations.push(location)
    @display = @display.sub(/#{location}/, player.player_symbol)
    puts @display
  end

  def check_win(player)
    @winning_combinations.each do |combination|
      return true if (combination - player.combinations).empty?
    end
    false
  end

  def check_draw
    return true if @move_count == 9

    false
  end
end

# game_instance = TicTacToe.new
