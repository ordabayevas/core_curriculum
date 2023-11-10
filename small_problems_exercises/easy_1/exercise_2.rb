# my_solution
# def is_odd?(integer)
#   if integer % 2 == 0
#     return false
#   else
#     return true
#   end
# end

# solution by remainder
def is_odd?(int)
  if int.remainder(2) == 0
    return false
  else
    return true
  end
end

# LS solution
# def is_odd?(number)
#   number % 2 == 1
# end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true