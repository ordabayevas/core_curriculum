def is_square(x)
  odd_num = 1
  
  while x >= odd_num
    x = x - odd_num
    odd_num += 2
  end
  
  if x == 0
    true
  else
    false
  end
end

p is_square(144)

# other solution
# def is_square(x)
# return false if x < 0
# (x ** 0.5) % 1 == 0
# end