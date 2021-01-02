# frozen_string_literal: true

# node to be consumed in binary search tree
class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end
