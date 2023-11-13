# Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.
# 1.upto(99) do |num| 
#   if num % 2 == 0
#     puts num
#   end
# end

# LS solution
# value = 1
# while value <= 99
#   puts value if value.even?
#   value += 1
# end

# students solution
(1..49).each {|i| puts 2 * i}