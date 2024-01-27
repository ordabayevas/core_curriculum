# Write a method that returns a list of all substrings of a string that start 
# at the beginning of the original string. The return value should be arranged 
# in order from shortest to longest substring.

# P
# Input: string
# Output: array of substrings
# Explicit: 
# - take a string and divide by substrings, by each substring add 1 next letter.
# - return the array of all substrings in array from shortest to longest.

# E
# leading_substrings('abc') == ['a', 'ab', 'abc']
# leading_substrings('a') == ['a']
# leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# D
# Create a new array to hold substrings.

# A
# Mental model:
# - number of substrings is equal to number of letters in a string.
# - create a temporary variable to hold updated substring.
# - create a new empty array
# - iterate over elements of string
# - add every element of string
# - assign temp variable to new substring
# - push every updated substring to empty string

# C
def leading_substrings(string)
  temp_var = ''
  new_array = []
  string.each_char do |letter|
    temp_var += letter
    new_array << temp_var
  end
  new_array
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']