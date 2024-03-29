# Description
# Given an unordered array and the information that exactly one value in the array 
# occurs twice (every other value occurs exactly once), 
# how would you determine which value occurs twice? 
# Write a method that will find and return the duplicate value that is known 
# to be in the array.

# P
# Input: array with one element duplicate
# Output: array with all unique elements
# Explicit:
# - given array has one duplicate of one element
# - find and return this duplicate
# Implicit: assume that input always valid

# E
# find_dup([1, 5, 3, 1]) == 1
# find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# D
# Since we know that there is only one duplicate in array, we do not need 
# to create new one to hold duplicates

# A
# - write a method that takes 1 argument
# - iterate over given arg array
#   - count the number of elements in array, if 1, then skip  
#   - iterate till any element will counted twice in array
# - end the iteration and return the element which count is 2

# C
def find_dup(array)
  array.each do |element|
    if array.count(element) == 2
      return element
    else
      next
    end
  end
end

find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# def find_dup(array)
#   array.find { |element| array.count(element) == 2 }
# end

# Further exploration
# def find_dup(array)
#   new_arr = []
#   array.each do |el|
#     if new_arr.include?(el)
#       return el
#     else
#       new_arr << el
#     end
#   end
# end
