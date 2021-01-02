# frozen_string_literal: true

def str_cmp(str1, str2)
    str1.downcase == str2.downcase
  end
  
  print(str_cmp('aaaa', 'AAAA'))