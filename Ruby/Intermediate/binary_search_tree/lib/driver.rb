# frozen_string_literal: true

require_relative 'tree'

new_bst = Tree.new(Array.new(15) { rand(1..100) })

puts new_bst.balanced?

puts new_bst.preorder
puts new_bst.postorder
puts new_bst.level_order

index = 100

while index < 110
  new_bst.insert(index)
  index += 1
end

puts new_bst.balanced?

new_bst.rebalance

puts new_bst.balanced?

puts new_bst.preorder
puts new_bst.postorder
puts new_bst.level_order
