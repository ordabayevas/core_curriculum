numbers = [1, 2, 3, 4, 5]

p numbers.delete_at(1) # deletes an element by given index, mutates the original array. Returns the deleted element.
# p numbers # => [1, 3, 4, 5]

p numbers.delete(1) # deletes a given element of array, mutates the original array. Returns the deleted element.
# gp numbers # => [2, 3, 4, 5]