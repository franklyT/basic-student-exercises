# frozen_string_literal: true

require_relative 'player'

# human from player abstract class
class Human < Player
  def initialize
    super
    @piece = 'B'
    @name = 'human!'
  end
end
