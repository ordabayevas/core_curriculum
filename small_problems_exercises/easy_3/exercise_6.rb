def xor?(arg1, arg2)
  if arg1 == true && arg2 == false
    return true
  elsif arg1 == false && arg2 == true
    return true
  elsif arg1 == false && arg2 == false
    return false
  else arg1 == true && arg2 == true
    return false
  end
end


p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# LS solution
# def xor?(value1, value2)
#   return true if value1 && !value2
#   return true if value2 && !value1
#   false
# end

# def xor?(value1, value2)
#   !!((value1 && !value2) || (value2 && !value1))
# end

# || and && are so-called short circuit operators in that the second operand is not evaluated 
# if its value is not needed. Does the xor method perform short-circuit evaluation of its operands?
# Why or why not? Does short-circuit evaluation in xor operations even make sense?