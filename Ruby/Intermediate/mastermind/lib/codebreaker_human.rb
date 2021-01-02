# frozen_string_literal: true

require_relative 'codebreaker'

# Extends codebreaker
class CodebreakerHuman < Codebreaker
  def initialize
    super

    @is_human = true
  end

  def turn
    puts 'Please input your guess now.'
    @guess = gets.chomp.split('')

    until @guess.length == 4 && code_validator(@guess)
      puts 'Error: Invalid code.'
      code_input_message

      @guess = gets.chomp.split('')
    end
  end
end
