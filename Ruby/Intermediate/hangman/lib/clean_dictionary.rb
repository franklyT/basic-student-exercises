# frozen_string_literal: true

# the data is parsed prior to running the program
def clean_dictionary
  clean_words = []

  File.open('5desk.txt', 'r') { |file|
    until file.eof?
      line = file.readline
      clean_words << line if line.length > 5 && line.length < 12
    end
  }

  File.open('5desk.txt', 'w') { |file|
    clean_words.each { |word|
      file.puts word
    }
  }
end

# the data has already been parsed, but this function will clean the original dictionary
# clean_dictionary
