# Write a method that takes an Array as an argument, and sorts that Array using 
# the bubble sort algorithm as just described. Note that your sort will be "in-place"; 
# that is, you will mutate the Array passed as an argument. 
# You may assume that the Array contains at least 2 elements.

# P
# Input: array with at least 2 elements
# Output: the same sorted array with the elements

# E
# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# D
# Create a variable to determine swapping.

# A
# - write a method that takes an array
# - swapped = true
# - loop while swapped == true
# - swapped = false
#   - array length - 1 times loop through the array:
#     - if array[index] > array[index + 1]:
#       - array[index], array[index+1] = array[index+1], array[index]
#       - swapped = true
#     - end
# end
# - return array

# C
def bubble_sort!(array)
  swapped = true
  counter = 1
  while swapped == true
    swapped = false
    (array.length - counter).times do |index|
      if array[index] > array[index + 1]
        array[index], array[index+1] = array[index+1], array[index]
        swapped = true
      end
    end
    counter += 1
  end
  array
end

array = [5, 3]
p bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)



