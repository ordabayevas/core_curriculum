# Description
# Write a method that takes an Array of Integers between 0 and 19, 
# and returns an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, 
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# P
# Input: array of integers between 0 and 19
# Output: sorted array based on the English words
# Explicit: take an array of integers from 0 to 19, then return the english word for every num,
# and sort based on it, but return the integers.
# Implicit: new array or the same?

# E
# alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

# D
# Create a hash with keys of numbers from 0 to 19, and values of string words of every
# key.
# Also works with array with matching word and index.

# A
# - create a hash with number keys and word values or array with mathing indices and words.
# - write a method that takes an array with integers
# - sort this array by:
#   - iterate through every number and return the english word for every number from array
# - return array of the same size of numbers, but sorted by pattern

# C
def alphabetic_number_sort(numbers)
  eng_numbers = %w[zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
  sorted = numbers.sort_by do |index|
    eng_numbers[index]
  end
end

a = (0..19).to_a
alphabetic_number_sort(a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# non-mutating sort_by is Enumerable method
# Further exploration
# def alphabetic_number_sort(numbers)
#   eng_numbers = %w[zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
#   sorted = numbers.sort do |a, b|
#     eng_numbers[a] <=> eng_numbers[b]
#   end
# end