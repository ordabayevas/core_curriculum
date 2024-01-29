# Write a method which takes a grocery list (array) of fruits with 
# quantities and converts it into an array of the correct number of each fruit.

# buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]

def buy_fruit(array_of_arrays)
  new_arr = []
  array_of_arrays.each do |sub|
    new_arr += [sub[0]] * sub[1]
  end
  new_arr
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]