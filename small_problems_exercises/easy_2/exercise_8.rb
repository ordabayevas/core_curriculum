# puts '>> Please enter an integer greater than 0:'
# integer = gets.chomp

# puts ">> Enter 's' to compute the sum, 'p' to compute the product."
# operation = gets.chomp

# if operation == 's'
#   sum = 0
#   (1..integer.to_i).to_a.each do |num|
#     sum += num
#   end
#   puts "The sum of the integers between 1 and #{integer} is #{sum}."
# else operation == 'p'
#   prod = 1
#   (1..integer.to_i).to_a.each do |num|
#     prod *= num
#   end
#   puts "The product of the integers between 1 and #{integer} is #{prod}."
# end

# The compute_sum and compute_product methods are simple and should be familiar. 
# A more rubyish way of computing sums and products is with the Enumerable#inject method. 
# inject is a very useful method, but if you've never used it before, it can be difficult to understand.
# Take some time to read the documentation for #inject. 
# (Note that all Enumerable methods can be used on Array.) Try to explain how it works to yourself.
# Try to use #inject in your solution to this problem.

# Note that #inject is an alias for #reduce. 
# The two methods work identically. 
# We mostly use #reduce in our curriculum, but it's worth noting that the documentation uses #inject.

puts '>> Please enter an integer greater than 0:'
integer = gets.chomp

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = (1..integer.to_i).inject (:+)
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
else operation == 'p'
  prod = 1
  prod = (1..integer.to_i).inject (:*)
  puts "The product of the integers between 1 and #{integer} is #{prod}."
end