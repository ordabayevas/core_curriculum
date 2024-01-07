# Description:
# Write a method that takes a year as input and returns the century. 
# The return value should be a string that begins with the century number, 
# and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. 
# So, the years 1901-2000 comprise the 20th century.

# Questions: 
# What is a data type of year in context?
# Can we assume that input will always be of one data type?

# P
# Input: integer
# Output: string
# Explicit requirements: writing a method called which is:
#   - takes one parameter of integer year and calculates which century it is;
#   - one century includes years from 1 to 100, for example year 256 is a third century;
#   - the return value should be converted to string and have an endings st, nd, rd, or th.
#   - for example if number of century ends with 1 or 2 or 3: 1st, 2nd, 3rd
#   - and for other numbers 0, 4, 5, 6, 7, 8, 9 is th.
# Implicit requirements:
#   - year is an integer data.
#   - if year is divided by 100 without remainder the century will be just year / 100.
#   - if year is divided by 100 with a remainder the century will be year / 100 + 1.
#   - if century ends with 11, 12, 13 those will be with endings 'th'. They are exceptions.

# E
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

# D
# input data is an integer object, output is a string object.
# method should convert the integer to string with a built-in function.

# A
# 1. Define a method called "century()" with 1 integer parameter "year".
# 2. Calculate the century from 'year':
#   - if 'year' modulo by 100 is 0:
#     - year divided by 100, for example: (2000 / 100) = 20;
#   - else:
#     - year divided by 100 and to the quotient add 1, 
#     for example: (11201 / 100) + 1 = 113;
# 3. Initialize the new variable "century" and assign to the expressions from step 2.
# 4. Invoke method "endings()" with 1 parameter "century".
# 5. Pass the value of variable "century" as an argument to method "endings()".
# 6. Return the value.
# 
# 1. Define method "endings()" with one parameter "century", which is an integer object.
# 2. Initialize new variable "string_century" and convert the integer value of parameter to string.
# 3. Initialize if, else conditional statements:
#   - if length of "string_century" is equal to 1:
#     - when 1 --> add ending "st" to "string_century"
#     - when 2 --> add ending "nd" to "string_century"
#     - when 3 --> add ending "rd" to "string_century"
#     - else --> add ending "th" to "string_century"
#   - if length of "string_century" is equal to 2:
#     - initialize the variable "last_num" to the last string digit of "string_century"
#     - initialize the variable "num_before_last" to the string digit before "last_num"
#     - if "last_num" is 1 or 2 or 3 and "num_before_last" not equal to 1 
#       (i.e. the last two digits are not '11', '12', '13')
#       - when "last_num" is 1 --> add ending "st" to "string_century"
#       - when "last_num" is 2 --> add ending "nd" to "string_century"
#       - when "last_num" is 3 --> add ending "rd" to "string_century"
#     - else --> add ending "th" to "string_century"
#   - return the value.

# C
def endings(century)
  string_century = century.to_s
  if string_century.length == 1
    case string_century
    when '1'
      string_century + 'st'
    when '2'
      string_century + 'nd'
    when '3'
      string_century + 'rd'
    else
      string_century + 'th'
    end
  elsif string_century.length >= 2
    last_num = string_century.slice(-1)
    num_before_last = string_century.slice(-2)
    if last_num == '1' && num_before_last != '1'
      string_century + 'st'
    elsif last_num == '2' && num_before_last != '1'
      string_century + 'nd'
    elsif last_num == '3' && num_before_last != '1'
      string_century + 'rd'
    else
      string_century + 'th'
    end
  end
end

def century(year)
  if year % 100 == 0
    century = year / 100
  else
    century = year / 100 + 1
  end
  endings(century)
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'