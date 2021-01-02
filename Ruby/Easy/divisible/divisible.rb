# frozen_string_literal: true

def str_anagram(str1, str2)
    str1.length == str2.length && (str1.split('') - str2.split('')).empty?
  end
  
  print(str_anagram('beat', 'tabe'))