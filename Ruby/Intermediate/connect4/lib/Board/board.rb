# frozen_string_literal: true

# board class holder
class Board
  attr_reader :matrix

  COLUMN_NUM = 7
  ROW_NUM = 6

  def initialize
    form_matrix
  end

  def form_matrix
    @matrix = Array.new(COLUMN_NUM) { Array.new(ROW_NUM) { '0' } }
  end

  def display
    return @matrix.transpose.map { |row| row.join('') + "\n"}.join('')
  end

  def add(col, str)
    return false unless @matrix[col].include?('0')

    @matrix[col] = @matrix[col].reverse.join('').sub(/0/, str).reverse.split('')
  end
end
