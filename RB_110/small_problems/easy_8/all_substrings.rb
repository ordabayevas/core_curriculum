# Write a method that returns a list of all substrings of a string. 
# The returned list should be ordered by where in the string the substring begins. 
# This means that all substrings that start at position 0 should come first, 
# then all substrings that start at position 1, and so on. 
# Since multiple substrings will occur at each position, 
# the substrings at a given position should be returned in order from shortest to longest.
# You may (and should) use the leading_substrings method you wrote in the previous exercise

# P
Input: string
Output: array of all substrings in ordered way
Explicit: take a string, and write all subsequent substrings that starts from the 
first letter, then from the second and so on. Sort the substrings of every letter from shortest to longest.
Implicit: 
Number of substrings which begin from the first substring is equal to number of all letters.
Then this number is going to descend to 1:
('abcde') -> ['a', 'ab', 'abc', 'abcd', 'abcde', 'b', 'bc', 'bcd', 'bcde',...]

# E
# substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# D
Create a variable index to hold indices of the first letter of substring series.
Create a variable to hold the number of substrings.-> num_of_sub = string size -> num_of_sub -= 1
# A
Mental model:
iterate over every letter in a string.
to empty array add every letter and form a subsequent substring while substring numbers are 
not equal to num_of_sub. Then num_of_sub -= 1.
when it equals, increase the index of the first letter and iterate again. Then num_of_sub -= 1.
repeat while num_of_sub != 0.

Mental model 2:
#   'a', 'ab', 'abc', 'abcd', 'abcde', -> array[0], [0..1], [0..2], [0..3], [0..4]
#   'b', 'bc', 'bcd', 'bcde', -> array[1], [1..2], [1..3], [1..4],
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'

write a method
iterate over elements
first element = 0
last element = first
push to array

first = 0
last = 1
push to array
if last == array.size - 1
  first += 1
  last = first



# C
# def substrings(string)
# index = 0
# num_of_sub = string.size # 5
# total_array = []
# temp_array = []
# temp_var = ''
#   string.chars.each do |char|
#     temp_var += char
#     temp_array << temp_var
#     if temp_array.size == num_of_sub
#       temp_array = []
#       temp_var = ''
#       num_of_sub -= 1
#     end
#   end
#   total_array
# end

def substrings(string)
  array = []
  first_element = 0
  last_element = first_element
  while first_element != string.size && last_element != string.size
    array << string[first_element..last_element]
    p array
    last_element += 1
    if last_element == string.size
      first_element += 1
      last_element = first_element
    end
  end
  array
end

substrings('abc')


