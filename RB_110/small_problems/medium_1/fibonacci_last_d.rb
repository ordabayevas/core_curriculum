# def fibonacci_last(nth)
#   first, last = [1, 1]
#   3.upto(nth) do
#     first, last = [last, first + last]
#   end

#   last % 10
# end

# fibonacci_last(15)

# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181.

def fibonacci_last(num)
  f1 = 1
  f2 = 1
  f3 = 0
  (num - 2).times do |_|
    f3 = (f1 % 10) + (f2 % 10)
    f1 = f2 % 10
    f2 = f3 % 10
  end
  f3 % 10
end

p fibonacci_last(51)

# LS solution
# def fibonacci_last(nth)
#   last_2 = [1, 1]
#   3.upto(nth) do
#     last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
#   end

#   last_2.last
# end



# if the last digit of nth is a 5 the nth num will be 5 or 0
# if 1 -> 1, 9, 6,  except 1 which is 0
# if 2 ->

