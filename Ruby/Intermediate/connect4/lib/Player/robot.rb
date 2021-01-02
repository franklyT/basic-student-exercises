# frozen_string_literal: true

require_relative 'player'

# ai from player abstract class
class Robot < Player
  def initialize
    super
    @piece = 'W'
    @name = %w[Jeeves Jarvis Alfred Martin].sample
  end
end
