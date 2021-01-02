# frozen_string_literal: true

def product(list)
    return list.reduce(:*)
  end
  
  puts(product([1, 4, 21]))
  puts(product([-4, 2.3e12, 77.23, 982, 0b101]))