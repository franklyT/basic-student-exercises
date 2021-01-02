# frozen_string_literal: true

def one_char_diff?(str1, str2)
  return false if str1.length != str2.length

  str1 = str1.downcase
  str2 = str2.downcase

  wrong_chars = 0

  (0..str1.length).each_with_index do |_, index|
    wrong_chars += 1 if str1[index] != str2[index]

    return false if wrong_chars > 1
  end

  return true
end

puts(one_char_diff?('bar', 'bar'))
puts(one_char_diff?('bar', 'Baz'))
puts(one_char_diff?('Food', 'fold'))
puts(one_char_diff?('A', 'b'))
puts('-----------')
puts(one_char_diff?('a', ''))
puts(one_char_diff?('Bar', 'Bark'))
puts(one_char_diff?('Bar', 'art'))
puts(one_char_diff?('Food', 'fled'))
puts(one_char_diff?('ab', ''))
puts(one_char_diff?('giraffe', 'girazfe'))