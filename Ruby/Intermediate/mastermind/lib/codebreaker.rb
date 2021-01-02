# frozen_string_literal: true

require_relative 'helpers'

# Codebreaker role logic
class Codebreaker
  include Helpers
  attr_accessor :code, :name, :is_human
  attr_reader :code_broken, :feedback, :guess

  def initialize
    @code_broken = false
    @feedback = []
    @guess = []
  end

  private def check_index_guess(index)
    return @feedback << '2' if @code[index] == @guess[index]
    return @feedback << '1' if @code.include?(@guess[index])
    return @feedback << '0'
  end

  public def compare_guess_to_code
    4.times do |index|
      check_index_guess(index)
    end

    read_feedback
    check_win
  end

  private def read_feedback
    puts @feedback.join('')
    # reset feedback for next iteration
    @feedback = []
  end

  private def check_win
    # array/string agnostic
    @guess.each_with_index do |letter, index|
      return if letter != @code[index]
    end
    @code_broken = true
  end
end
