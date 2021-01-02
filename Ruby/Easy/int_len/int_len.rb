# frozen_string_literal: true

def int_len(int)
  raise TypeError, 'provide only integer input' if int.is_a?(String)

  count = 0
  int.to_s.gsub('-', '').split('').each { count += 1 }

  return count
end

puts(int_len(-1000))
puts(int_len(+1000))
puts(int_len(1000))

puts(int_len('a'))