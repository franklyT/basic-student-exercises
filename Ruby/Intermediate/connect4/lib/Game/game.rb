# frozen_string_literal: true

require_relative '../Board/board'
require_relative '../Player/robot'
require_relative '../Player/human'

# connect4 game class
class Game
  attr_reader :board, :human, :robot
  def initialize
    @board = Board.new
    @human = Human.new
    @robot = Robot.new
  end

  def winner
    return false unless winner_row_column || winner_diagonals
    winner_row_column || winner_diagonals
  end

  def winner_row_column
    four_in_a_row(@board.matrix.transpose, @board.matrix[0].length) || four_in_a_row(@board.matrix, @board.matrix.length)
  end

  def winner_diagonals
    four_in_a_row(diagonals, @board.matrix.length) || four_in_a_row(diagonals(rotate90), @board.matrix.length)
  end

  def diagonals(grid = @board.matrix)
    return (0..grid.size - 4).map { |i|
      (0..grid.size - 1 - i).map { |j|
        grid[i + j][j]
      }
    }.concat((1..grid.first.size - 4).map { |j|
      (0..grid.size - j - 1).map { |i|
        grid[i][j + i]
      }
    })
  end

  def rotate90
    ncols = @board.matrix.first.size
    @board.matrix.each_index.with_object([]) do |i,a|
      a << ncols.times.map { |j|
        @board.matrix[j][ncols - 1 - i]
      }
    end
  end

  def four_in_a_row(direction, len)
    direction.each do |col_or_row|
      # this can be made more efficient
      len.times do |index|
        test_range = col_or_row[index..index + 3]
        next if test_range == nil || test_range.length != 4 || test_range.include?('0') || test_range.uniq.length > 1

        return @human.name if test_range.uniq[0] == @human.piece
        return @robot.name if test_range.uniq[0] == @robot.piece
        raise "Error: Can't get winner's piece."
      end
    end
    false
  end
end
