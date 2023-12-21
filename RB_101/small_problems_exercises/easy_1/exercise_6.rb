# my_solution
def triangle(number)
  starter = ''
  while starter.size != number
    starter += '*'
    puts starter.rjust(number)
  end
end

triangle(5)

# LS solution
# def triangle(num)
#   spaces = num - 1
#   stars = 1

#   num.times do |n|
#     puts (' ' * spaces) + ('*' * stars)
#     spaces -= 1
#     stars += 1
#   end
# end


# Try modifying your solution so it prints the triangle upside down from its current orientation. 
# def triangle(number)
#   spaces = number
#   while number != 0
#     puts "#{'*' * number}".rjust(spaces)
#     number -= 1
#   end
# end

# triangle(5)

# Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.
# def triangle(number, angle)
#   starter = ''
#   case angle
#   when 'right'
#     while starter.size != number
#       starter += '*'
#       puts starter.rjust(number)
#     end
#   when 'left'
#     while starter.size != number
#       starter += '*'
#       puts starter.ljust(number)
#     end
#   when 'upright'
#     spaces = number
#     while number != 0
#       puts "#{'*' * number}".rjust(spaces)
#       number -= 1
#     end
#   when 'upleft'
#     spaces = number
#     while number != 0
#       puts "#{'*' * number}".ljust(spaces)
#       number -= 1
#     end
#   end
# end

# triangle(9, 'left')