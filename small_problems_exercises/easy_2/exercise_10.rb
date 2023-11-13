def negative(num)
  if num < 0
    return num
  elsif num == 0
    return 0
  else
    return num / (-1)
  end
end

puts negative(-5)
puts negative(0)
puts negative(3)

# LS solution
# def negative(number)
#   number > 0 ? -number : number
# end

# def negative(number)
#   -number.abs
# end