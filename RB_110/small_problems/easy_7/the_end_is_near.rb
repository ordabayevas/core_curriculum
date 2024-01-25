# Description
# Write a method that returns the next to last word in the String passed 
# to it as an argument.
# Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two words.

# P
# Input: sentence string
# Output: the pre-last word in sentence
# Explicit:
# - take a string with words and return the word before the last
# - word is characters without blanks
# - assume that input string has at least 2 words.

# E
# penultimate('last word') == 'last'
# penultimate('Launch School is great!') == 'is'

# D
# Split and convert to array.

# A
# - write a method that takes 1 argument
# - convert string to array of words
# - define the length of array
# - and call for the element by index --> length of array - 2
#   - if size of array is 4, the last element will be indexed as 3.
#   - it means we need the element that is under 2 index.
# - return this element

# C
def penultimate(string)
  array_of_words = string.split(' ')
  index = array_of_words.size - 2
  array_of_words[index]
end

penultimate('last word')

# Further exploration
# Write a method that returns the middle word of a phrase or sentence. 
# It should handle all of the edge cases you thought of.

def penultimate(string)
  array_of_words = string.split(' ')
  if array_of_words.empty?
    return string
  elsif array_of_words.size.even?
    index = array_of_words.size.to_f / 2
    [array_of_words[index - 1], array_of_words[index]]
  else
    index = array_of_words.size.to_f / 2
    array_of_words[index]
  end
end

penultimate('') == ''
penultimate(' ') == ' '
penultimate('word') == 'word'
penultimate('r e a') == 'e'
penultimate('r e a f') == ['e', 'a']