require 'pry'
require 'pry-byebug'

# def n_factorial(num) # 5
#   #binding.pry
#   if num == 0 || num == 1
#     1
#   else
#     num * n_factorial(num - 1)
#   end
# end

# n_factorial(5)

factorial = Enumerator.new do |y|
  a = 0
  b = 1
  loop do
    y << b
    a = a + 1
    b = a * b
  end
end

factorial.take(6)
