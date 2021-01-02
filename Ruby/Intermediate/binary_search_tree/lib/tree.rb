# frozen_string_literal: true

require_relative 'node'
require_relative 'helpers'

# binary search tree class
class Tree
  include Helpers

  attr_reader :root

  def initialize(arr)
    arr = merge_sort(trim_duplicates(arr))
    @root = build_tree(arr)
  end

  def build_tree(arr)
    return if arr.empty?

    center = arr.length / 2
    node = Node.new(arr[center])
    node.left = build_tree(arr[0...center])
    node.right = build_tree(arr[center + 1..-1])
    node
  end

  def find(val)
    comparator_node = @root

    until comparator_node.nil? || comparator_node.data == val
      if val > comparator_node.data
        comparator_node = comparator_node.right
      elsif val < comparator_node.data
        comparator_node = comparator_node.left
      end
    end

    comparator_node || false
  end

  def find_parent(value, node = @root)
    return node if node.left.data == value || node.right.data == value

    if value > node.data
      find_parent(value, node.right)
    elsif value < node.data
      find_parent(value, node.left)
    end
  end

  def insert(value, comparator_node = @root)
    return 'Error: Duplicate node found.' if value == comparator_node.data

    if value > comparator_node.data
      comparator_node.right ? insert(value, comparator_node.right) : comparator_node.right = Node.new(value)
    elsif value < comparator_node.data
      comparator_node.left ? insert(value, comparator_node.left) : comparator_node.left = Node.new(value)
    end
  end

  def delete(value)
    node = find(value)
    return if node.nil?

    parent = find_parent(value)
    # need condition for parentless node aka root with 2 children
    remove(node, parent)
  end

  private def remove(node, parent)
    if node.left && node.right
      remove_with_both_children(node)
    elsif node.left
      return parent.left.data == node.data ? parent.left = node.left : parent.right = node.left
    elsif node.right
      return parent.left.data == node.data ? parent.left = node.right : parent.right = node.right
    else
      return parent.left.data == node.data ? parent.left = nil : parent.right = nil
    end
  end

  def remove_with_both_children(node)
    min_node = find_min(node.right)
    replace_node(min_node, node)
  end

  def find_min(node)
    if node.left.nil?
      min_node = node
      return min_node
    else
      find_min(node.left)
    end
  end

  def replace_node(min_node, node)
    node.data = min_node.data
  end

  def level_order(&block)
    return false if @root.nil?

    queue = [@root]
    result = []

    until queue.empty?
      current_node = queue.first
      block_given? ? block.call(current_node) : result << current_node.data

      queue.shift
      queue.push(current_node.left) if current_node.left
      queue.push(current_node.right) if current_node.right
    end

    return result
  end

  def inorder(&block)
    root = @root
    result = []
    stack = []

    until stack.empty? && root.nil?
      while root
        stack.push(root)
        root = root.left
      end

      root = stack.pop
      block_given? ? block.call(root) : result << root.data
      root = root.right
    end
    result
  end

  def preorder(node = @root, result = [], &block)
    return result if node.nil?

    block_given? ? block.call(node) : result << node.data

    preorder(node.left, result)
    preorder(node.right, result)
  end

  def postorder(node = @root, result = [], &block)
    return result if node.nil?

    postorder(node.left, result)
    postorder(node.right, result)

    block_given? ? block.call(node) : result << node.data
  end

  def depth(node)
    return false if node.nil?

    left_depth = find_depth(node.left)
    right_depth = find_depth(node.right)

    left_depth >= right_depth ? left_depth : right_depth
  end

  def find_depth(node)
    return 0 if node.nil?

    depth_index = -1
    stack = []
    stack << node

    while stack.length.positive?
      depth_index += 1
      current_node = stack.last
      stack.pop
      stack << current_node.left if current_node.left
      stack << current_node.right if current_node.right
    end

    return depth_index
  end

  def balanced?
    (depth(@root.left) - depth(@root.right)).abs <= 1
  end

  def rebalance
    return puts 'Already balanced.' if balanced?

    @root = build_tree(merge_sort(level_order))
    puts 'Tree rebalanced.'
  end
end
