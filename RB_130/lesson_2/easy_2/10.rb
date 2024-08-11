require 'pry'
require 'pry-byebug'

def each_cons(array, n)
  array.each_index do |index|
    binding.pry
    break if index + n - 1 >= array.size
    yield(*array[index..(index + n - 1)])
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash #== { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash #== { 1 => 3, 3 => 6, 6 => 10 }