# frozen_string_literal: true

# The board class, deals with board state
class Board
  attr_reader :display

  def initialize(turns)
    @TURNS = turns
    initialize_board
  end

  def initialize_board
    @display = ''
    @TURNS.times do
      @display += "|_|_|_|_|\n"
    end
  end

  public def display_board
    puts @display
  end

  def write_turn(guess)
    4.times do |index|
      @display = @display.sub('_', guess[index])
    end
  end
end
