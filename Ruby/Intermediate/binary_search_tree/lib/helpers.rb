# frozen_string_literal: true

# helpers module containing some function implementations of language methods
module Helpers
  def trim_duplicates(arr)
    new_arr = []
    arr.each do |elm|
      new_arr << elm unless new_arr.include?(elm)
    end
    return new_arr
  end

  def merge_sort(arr)
    return arr if arr.length < 2

    mid = (arr.length / 2).floor
    right = merge_sort(arr[0..mid - 1])
    left = merge_sort(arr[mid..arr.length])

    merge(left, right)
  end

  def merge(left, right)
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left.first < right.first
      [left.first] + merge(left[1..left.length], right)
    else
      [right.first] + merge(left, right[1..right.length])
    end
  end
end
