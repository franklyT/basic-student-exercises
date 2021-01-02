# frozen_string_literal: true

require_relative 'codemaker'

# Extends codemaker
class CodemakerHuman < Codemaker
  def set_code
    code_input_message

    @code = gets.chomp.split('')
    until @code.length == 4 && code_validator(@code)
      @code = ''
      puts 'Error: Invalid code.'
      code_input_message

      @code = gets.chomp.split('')
    end

    puts "Code is set to #{@code}. Good luck!"
  end
end
