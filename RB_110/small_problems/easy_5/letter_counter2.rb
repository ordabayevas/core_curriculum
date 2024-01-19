# Description
# Modify the word_sizes method from the previous exercise to exclude 
# non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

# P
# Input: string with words
# Output: string with words but without digits
# Explicit: 
# - modify the previous method
# - convert string with digits to the same string with words and 
# spaces but eliminate the digits.
# Implicit:
# Can we write extra method for converting string?

# def word_sizes(string)
#   string = deleted_digits(string) # modified row
#   arr_words = string.split
#   word_sizes = arr_words.map do |word|
#     word.size
#   end
#   copy = word_sizes.dup
#   unique_num = copy.uniq
#   hash = {}
#   unique_num.each do |num|
#     value = word_sizes.count(num)
#     hash[num] = value
#   end
#   hash
# end

# E
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# word_sizes('') == {}

# D
# - Create a string with uppercased and lowercased alphabetic letters.
# - Create a new empty string.
# - Iterate over input string.
# - Return new string.

# A
# - create a constant string with uppercased and lowercased alphabetic letters.
# - write an extra method for converting input string to string without digits.
# - create a new variable with empty string.
# - iterate over every character in a string.
#   - if character is not a letter or space, then go to the next.
#   - if character is a letter or space add to the new string.
# - return new string.

# C
ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'

def deleted_digits(string)
  new_string = ''
  string.each_char do |char|
    if ALPHABET.include?(char) || char == ' '
      new_string << char
    else
      next
    end
  end
  new_string
end

def word_sizes(string)
  string = deleted_digits(string) # modified row
  arr_words = string.split
  word_sizes = arr_words.map do |word|
    word.size
  end
  copy = word_sizes.dup
  unique_num = copy.uniq
  hash = {}
  unique_num.each do |num|
    value = word_sizes.count(num)
    hash[num] = value
  end
  hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}