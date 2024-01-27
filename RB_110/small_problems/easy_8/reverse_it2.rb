# Write a method that takes one argument, a string containing one or more words, 
# and returns the given string with words that contain five or more characters reversed. 
# Each string will consist of only letters and spaces. 
# Spaces should be included only when more than one word is present.

# P
# Input: string of words
# Output: string with the reversed letters in words, that are equal or longer than 5 letters
# Explicit: take a string with 1 or more words, and define which is equal or longer than 5 characters.
# Reverse letters of those words. Leave all other words unchanged.

# E
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# D
# New array of words, array of characters of words that are longer or equal to 5.

# A
# - take a string and convert to array of words
# - iterate through words:
#   - if word length is >= 5:
#     - convert word to an array of letters -> reverse -> convert to string -> return
#   - else
#     - return the word
# - return the array
# - convert to string

# C
def reverse_words(string)
  array_of_words = string.split(' ')
  new_arr = array_of_words.map do |word|
    if word.size >= 5
      word.chars.reverse.join
    else
      word
    end
  end
  new_arr.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School') 