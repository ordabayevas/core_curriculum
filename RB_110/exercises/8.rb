# Substring fun

=begin
Complete the function that takes an array of words.
You must concatenate the nth letter from each word to construct a new word which 
should be returned as a string, where n is the position of the word in the list.

Note: Test cases contain valid input only - i.e. a string array or an empty array; 
and each word will have enough letters.
=end

# P
# Input: string of words
# Output: string word, from other strings 
# Explicit: 
# - take an array of strings
# - take a letter from every word, from 1st word take the first letter, from 2nd, take the second letter
# - concatenate all letters in a word
# - return this word
# - all inputs are valid

# E
# For example:

# ["yoda", "best", "has"]  -->  "yes"
#   ^        ^        ^
#   n=0     n=1     n=2

# D
# Create an empty string.

# A
# - write a method that takes 1 argument
# - create an empty string to hold new string Output
# - iterate over array with index num
# - by every iteration push the letter on the index num position to empty string
# - after iteration
# - return the string Output

# C
def nth_char(array)
  string = ''
  array.each_with_index do |word, i|
    string << word[i]
  end
  string
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'
