# Write a method that returns a list of all substrings of a string that are palindromic. 
# That is, each substring must consist of the same sequence of characters forwards 
# as it does backwards. The return value should be arranged in the same sequence as 
# the substrings appear in the string. Duplicate palindromes should be included 
# multiple times.
# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and 
# pay attention to case; that is, "AbcbA" is a palindrome, 
# but neither "Abcba" nor "Abc-bA" are. In addition, assume 
# that single characters are not palindromes.

# code from previous
def leading_substrings(string)
  temp_var = ''
  new_array = []
  string.each_char do |letter|
    temp_var += letter
    new_array << temp_var
  end
  new_array
end

def substrings(string)
  array = []
  first_element = 0
  last_element = first_element
  while first_element != string.size && last_element != string.size
    array << string[first_element..last_element]
    last_element += 1
    if last_element == string.size
      first_element += 1
      last_element = first_element
    end
  end
  array
end
# def substrings(string)
#   results = []
#   (0...string.size).each do |start_index|
#     this_substring = string[start_index..-1]
#     results.concat(leading_substrings(this_substring))
#   end
#   results
# end

# P
# Input: string 
# Output: all palindrome substrings from string in array
# Explicit:
# - take a string and find all palindromes
# - return all palindromes as strings in array
# - all palindromes are case sensitive
# - 1 letter is not a palindrome
# - if some palindrome occurs twice, add it twice
# - the substrings of palindrome should be in the sequence as they appear in a string
# - use a method from previous task
# Implicit:
# - if no palindromes are found, return empty array.

# E
# palindromes('abcd') == []
# palindromes('madam') == ['madam', 'ada']
# palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]
# k, kn, kni, knit, knitt, knitti, knitting, knitting , 

# D
# Create a new array to hold substrings.
# Create a new array to hold palindromes.

# A
# First model:
# - take a string and iterate
# - one by one add letters and find all substrings that are strart from the first letter
# - then find all substrings that starts from the second letter
# - repeat till you find all subs that starts from all subsequent letters
# - all these substrings should be placed in array
# - then check every word if it is palindrome:
#   - iterate every substring
#   - every substring reverse
#   - if they equal add to a new array of palindromes
#   - if not go to the next
# - return the array of palindromes.

# C
def palindromes(string)
  array_of_substrings = substrings(string)
  array_of_palindromes = array_of_substrings.select do |sub|
    if sub.size > 1
      sub == sub.reverse
    end
  end
end

p palindromes('Madam')
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]

# Further exploration
# Can you modify this method (and/or its predecessors) to ignore 
# non-alphanumeric characters and case? Alphanumeric characters 
# are alphabetic characters(upper and lowercase) and digits.

# - write another method that process an input string and deletes all non-alphanumeric 
# characters.
# - add in select part downcase method, but return the original.

# 1
# def modify_string(string)
#   new_string = ''
#   string.each_char do |char|
#     if char =~ /[a-z]/i
#       new_string << char
#     elsif char =~ /[1-9]/
#       new_string << char
#     else
#       next
#     end
#   end
#   new_string
# end

# 2
# if sub.size > 1
#   sub.downcase == sub.reverse.downcase
# end
    