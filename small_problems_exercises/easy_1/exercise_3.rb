# # my solution
# def stringy(number)
#   string = ''
#   if number.even? && number >= 0
#     (number/2).times do
#       string << '1'
#       string << '0'
#     end
#   else number.odd? && number >=0
#     (number/2).times do
#       string << '1'
#       string << '0'
#     end
#     if string.end_with?('1')
#       string << '0'
#     else
#       string << '1'
#     end
#   end
#   string
# end

# # LS solution
# def stringy(size)
#   numbers = []

#   size.times do |index|
#     number = index.even? ? 1 : 0
#     numbers << number
#   end

#   numbers.join
# end

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# Further Exploration
# Modify stringy so it takes an additional optional argument that defaults to 1. 
# If the method is called with this argument set to 0, the method should return 
# a String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy(size, start=1)
  numbers = []

  if start == 1
    size.times do |index|
      number = index.even? ? 1 : 0
      numbers << number
    end
  else
    size.times do |index|
      number = index.even? ? 0 : 1
      numbers << number
    end
  end

  numbers.join
end

puts stringy(6, 0)
puts stringy(7, 0)