# Description
# Write a method that counts the number of occurrences of each element in a given array.

# P
# Input: array of elements
# Output: the count of every element with this word in a hash
# Explicit: count every element in array, result write in a hash where key is an element and 
# count is a value.
# elements are case-sensitive.

# E
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)

# Output
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# D
# Create new hash to hold values.

# A
# - write a method that takes 1 arg
# - create an empty hash
# - iterate over every element in array:
# - count the occurrences of element and add the element as a key:
#   - if hash already has this element as a key, skip it
#   - else, add it
# - return the hash

# C
def how_many(array)
  hash = {}
  array.each do |element|
    count = array.count(element)
    if hash.include?(element)
      next
    else
      hash[element] = count
    end
  end

  hash.each do |element, count|
    puts "#{element} => #{count}"
  end
end

how_many(vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
])

# Further exploration
# def count_occurrences(array)
#   occurrences = {}
#   down = array.map {|item| item.downcase}
#   array.uniq.each do |element|
#     if occurrences.include?(element) || occurrences.include?(element.downcase)
#       next
#     else
#       occurrences[element] = down.count(element.downcase)
#     end
#   end

#   occurrences.each do |element, count|
#     puts "#{element} => #{count}"
#   end
# end

# count_occurrences(vehicles = [
#   'car', 'CAR', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ])