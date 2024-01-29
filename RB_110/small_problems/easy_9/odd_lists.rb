# Write a method that returns an Array that contains every other element of an Array 
# that is passed in as an argument. The values in the returned list should be those 
# values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# def oddities(array)
#   array[(0..).step(2)]
# end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []
# p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

# Further
# def oddities(array)
#   new_arr = []
#   array.each_index do |index|
#     if index.odd?
#       new_arr << array[index]
#     end
#   end
#   new_arr
# end

def oddities(array)
  factor = true
  array.each_with_object([]) do |num, array|
    if factor # true
      array << num # [] << 2
    end
    factor = !factor # false
  end
end

oddities([2, 3, 4, 5, 6])