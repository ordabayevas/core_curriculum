# Description
# Given a string of words separated by spaces, write a method that takes this 
# string of words and returns a string in which the first and last letters of 
# every word are swapped.

# You may assume that every word contains at least one letter, and that 
# the string will always contain at least one word. You may also assume that 
# each string contains nothing but words and spaces.

# Questions: what does it mean swapped? Changed places

# P
# Input: string of word or words.
# Output: string with swapped first-last letters of every word.
# Explicit: 
# - Swap first and last letter of every word in input string. 
# - Word is a characters separated by spaces. 
# - All words and spaces should be on their places.
# - Assume that input as not an empty. 
# - If only 1 letter is given as output, return this letter.
# - Input string doesn't contain numbers or digits.
# Implicit: the letters cases should be saved.

# E
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

# D
# To determine every word, split every word by spaces. 
# Store them in array.
# After modifying convert into string again with spaces.

# A
# 1. Write a method that takes a string.
# 2. Split string by spaces and assign to a new variable.
# 3. If input size is 1, return input, if not:
# 4. Iterate through every word and change the first and last letters.
#   - if word is 1 letter, return a letter, else:
  #   - by indexes of the first and last char:
    #   - fetch first item and store
    #   - fetch the last char and store
    #   - slice the second and pre-last chars from word
    #   - concatenate the last, main and first
# 4. Convert array with modified words to string with spaces.

# C
def swap(string)
  array_of_words = string.split(' ')
  new = array_of_words.map do |word|
    first_last(word)
  end
  new.join(' ')
end

def first_last(word)
  # a, b = b, a ---> changes two items, a short way
  if word.size == 1
    word
  else
    bone = word.slice(1..-2)
    word[-1] + bone + word[0]
  end
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
