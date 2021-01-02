# frozen_string_literal: true

# Fits errant helper functions
module Helpers
  def code_input_message
    puts "Please input your code now.\n" \
    "Code must contain any combination of 5 available colors\n" \
    'B = Blue, G = Green, O = Orange, P = Purple, Y = Yellow'
  end

  def code_validator(var)
    var.each do |letter|
      return false if letter != 'G' && letter != 'B' && letter != 'O' && letter != 'P' && letter != 'Y'
    end
    return true
  end

  def colors_key
    return %w[B G O P Y]
  end

  def newline
    puts ''
  end
end
