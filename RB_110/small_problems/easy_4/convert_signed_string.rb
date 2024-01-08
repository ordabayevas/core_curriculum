# Description
# Write a method that takes a String of digits, and returns the 
# appropriate number as an integer. The String may have a leading + or - sign; 
#  - if the first character is a +, your method should return a positive number; 
#  - if it is a -, your method should return a negative number. 
#  - If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, 
# such as String#to_i, Integer(), etc. 
# You may, however, use the string_to_integer method from the previous lesson.

DIGITS = {
    '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
    '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
  }

  def string_to_integer(string)
    digits = string.chars.map { |char| DIGITS[char] }
  
    value = 0
    digits.each { |digit| value = 10 * value + digit }
    value
  end

def string_to_signed_integer(string_number)
  if string_number.start_with?('-', '+')
    integer = string_to_integer(string_number[1..-1])
  else
    integer = string_to_integer(string_number)
  end
  
  if string_number[0] == '-'
    integer * (-1)
  else
    integer
  end
end

p string_to_signed_integer('4321') #== 4321
p string_to_signed_integer('-570') #== -570
p string_to_signed_integer('+100') #== 100