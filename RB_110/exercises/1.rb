# Basically, given a string or array, return every combination of 
# the each character/element with every other element, in a new array.

# Input: [1, 2, 3, 4, 5]

# Output: [
# [1,2], [1,3], [1, 4], [1, 5], 
# [2, 3], [2, 4], [2, 5], 
# [3, 4], [3, 5], 
# [4, 5]
# ]

require 'pry'
require 'pry-byebug'

def every_element(array)
  new_array = []
  position = 0
  counter = 0
  while position != (array.size - 1)
    loop do
      new_array << [array[position], array[counter + 1]]
      counter += 1
      break if counter == (array.size - 1)
    end
    position += 1
    counter = position
    # binding.pry
  end
  new_array
end

p every_element([1, 2, 3, 4, 5])