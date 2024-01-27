# Write a method that takes one argument, a string, 
# and returns a new string with the words in reverse order.

# P
# Input: string
# Output: string with reverse word order
# Explicit: take a string with words, and reverse the order of words in a string.
# Implicit: 
# - if string is empty? return empty
# - if string has 1 word? return word
# - if string has empty spaces, return empty array
# - the same or new string? new

# E
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# D
# Create new string to hold return values.

# A
# - take a string with words
# - create a new array
# - word is separated by white spaces
# - convert string to array of words
# - add words from the end to a new array, to accomplish that: 
#   - while the new array's length is not equal to array of word's length.
#   - add word starting from index -1 and till negative array of word's length to the new array.
# - return the new array and convert to string.

# C
def reverse_sentence(string)
  new_array = []
  arr_of_words = string.split(' ')
  index = -1
  while new_array.size != arr_of_words.size
    new_array << arr_of_words[index]
    index -= 1
  end
  new_array.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
