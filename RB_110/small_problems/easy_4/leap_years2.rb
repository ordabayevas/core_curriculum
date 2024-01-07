# Description
# A continuation of the previous exercise.
# The British Empire adopted the Gregorian Calendar in 1752, 
# which was a leap year. Prior to 1752, the Julian Calendar was used. 
# Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

# Using this information, update the method from the previous 
# exercise to determine leap years both before and after 1752.

# P
# Input: integer
# Output: boolean
# Explicit requirements:
#   - add another condition for Julian Calendar, 
#   i.e. define two global conditions for years: before 1752 use Julian, after - Gregorian.
#   - years before 1752 should be even by 4, to be a leap year.
#   - use code from previous assignment.

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
# leap_year?(1700) == true
# leap_year?(1) == false
# leap_year?(100) == true
# leap_year?(400) == true

# D
# the input is a positive integer.
# to calculations we will use integer data type.
# to return boolean value we will use conditional statement.

# A
# 1. Define two main if, else conditions:
#   - if 'year' < 1752
#   - else if 'year' >= 1752
# 2. If 'year' < 1752:
#   - 'year' % 4 == 0 ---> if this expression is 'true' for given 'year' it returns 'true'
# 3. Else:
#   - use the code from previous assignment.

# C
def leap_year?(year)
  if year < 1752
    year % 4 == 0
  elsif year >= 1752
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    else
      year % 4 == 0
    end
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true