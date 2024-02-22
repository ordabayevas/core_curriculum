# Title Case
=begin
A string is considered to be in title case if each word in the string is either (a) 
capitalised (that is, only the first letter of the word is in upper case) or (b) 
considered to be an exception and put entirely into lower case unless it is the 
first word, which is always capitalised.

Write a function that will convert a string into title case, given an optional 
list of exceptions (minor words). The list of minor words will be given as a 
string with each word separated by a space. Your function should ignore the case 
of the minor words string -- it should behave in the same way even if the case of 
the minor word string is changed.
=end

# P
# Input: two strings
# Output: the first string with uppercased first letter in each word, excluding those in a second

# Explicit:
# - take two strings
# - ignore all cases in first and in the second string
# - capitalize all first letters of words in a first string
# - if word is in a second string too, convert to downcase
# - if word is in a second string but also is a first word in a first string, capitalize it

# Implicit:
# - if no second arg is given, capitalize every word

# E
# 'THE WIND IN THE WILLOWS', 'The In' -> 
# -> 'The(first word) Wind in the(not a first word and in the second) Willows'

# D
# Array to contain words.

# A
# - write a method with 2 args, if second is not given, default value is empty string
# - convert 1 string to array of words
# - iterate over array of words with index, 
#   - if word is not in a second string or the index of word is 0:
#     - downcase this word and capitalize
#   - elsif word is in a second string:
#     - downcase this word
# - return this array of modified words
# - convert array to string

# C
# 1st model didn't pass the random test

# def title_case(string, exceptions='')
#   arr_of_words = string.split(' ')
#   result = []
#   arr_of_words.each_with_index do |word, idx|
#     if idx == 0 || !exceptions.downcase.include?(word.downcase)
#       result << word.downcase.capitalize
#     else
#       result << word.downcase
#     end
#   end
  
#   result.join(' ')
# end

# 2nd model passed
def title_case(string, exceptions='')
  arr_of_words = string.split(' ')
  exc_arr = exceptions.split(' ')
  
  exceptions = exc_arr.map do |word|
    word.downcase
  end

  result = []
  arr_of_words.each_with_index do |word, idx|
    if idx == 0 || !exceptions.include?(word.downcase)
      result << word.downcase.capitalize
    else
      result << word.downcase
    end
  end
  
  result.join(' ')
end
      
p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
p title_case("First a of in", "an often into")
