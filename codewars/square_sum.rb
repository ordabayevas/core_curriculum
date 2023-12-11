def square_sum(numbers)
  sum = 0
  numbers.each do |num|
    square = num ** 2
    sum += square
  end
  sum
end

p square_sum([1, 2, 2])

# other solution
# def squareSum(numbers)
#   numbers.sum {|x| x * x}  
# end