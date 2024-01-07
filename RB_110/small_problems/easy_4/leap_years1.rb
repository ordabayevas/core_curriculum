# Description
# In the modern era under the Gregorian Calendar, 
# leap years occur in every year that is evenly divisible by 4, 
# unless the year is also divisible by 100. 
# If the year is evenly divisible by 100, 
# then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. 
# Write a method that takes any year greater than 0 as input, 
# and returns true if the year is a leap year, or false if it is not a leap year.

# P
# Input: integer
# Output: boolean
# Explicit requirements:
# 1. Leap year occurs every 4 years.
# 2. But if year % 100 == 0, the year is not a leap.
# 3. But if year % 100 && year / 400 == 0, the year is leap.
# 4. This is a rule for years that greater then 0.
# 5. Write a method that takes 1 parameter and returns boolean value.
# 6. Assume that the passed argument is always positive integer.

# E
# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == false
# leap_year?(1) == false
# leap_year?(100) == false
# leap_year?(400) == true

# D
# the input is a positive integer.
# to calculations we will use integer data type.
# to return boolean value we will use conditional statement.

# A
# 1. Define a method called "leap_year?()" with one parameter "year".
# 2. If the value of "year" is divided by 4 without a remainder:
#   then we check if "year" % 100 != 0 is true, then return true;
#   if "year" % 100 == 0, we should check if it also divided by 400 without a remainder.
#   If it is true - return true. Otherwise, if "year" divided by 4 and 100 
#   without a remainder, return false.
# 3. Otherwise, if 'year' does not divided by 4 without a remainder, return false too.

# C
def leap_year?(year)
  if year % 4 == 0
    if year % 100 != 0
      true
    elsif year % 100 == 0 && year % 400 == 0
      true
    else
      false
    end
  else
    false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# code from Launch school
# def leap_year?(year)
#   if year % 100 == 0
#     false
#   elsif year % 400 == 0
#     true
#   else
#     year % 4 == 0
#   end
# end