# def print_odd_numbers(range)
#   array = range.to_a
#   array.select do |num|
#     if num.odd?
#       puts num
#     end
#   end
# end

# print_odd_numbers(1..99)

# LS solution
value = 1
while value <= 99
  puts value
  value += 2
end

# Repeat this exercise with a technique different from the one you just used, 
# and different from the solution shown above. 
# You may want to explore the use Integer#upto or Array#select methods, or maybe use Integer#odd?

1.upto(99) do |num| 
  if num % 2 != 0
    puts num
  end
end