# frozen_string_literal: true

require_relative 'codemaker'

# Extends codemaker
class CodemakerAi < Codemaker
  def initialize
    super
  end

  def set_code
    4.times do
      @code += colors_key.sample
    end

    puts "Debug: Code is #{code}"
    puts "#{@name} has set the code."
  end
end
