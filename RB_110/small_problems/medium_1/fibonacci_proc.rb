# fibonacci without recursion

# fibonacci(20) == 6765
# fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501

def fibonacci(num)
  f1 = 1
  f2 = 1
  f3 = 0
  (num - 2).times do |_|
    f3 = f1 + f2
    f1 = f2
    f2 = f3
  end
  f3
end

# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001)

# LS solution
# def fibonacci(nth)
#   first, last = [1, 1]
#   3.upto(nth) do
#     first, last = [last, first + last]
#   end

#   last
# end