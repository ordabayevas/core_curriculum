# Description
# The time of day can be represented as the number of minutes before or after midnight. 
# If the number of minutes is positive, the time is after midnight. 
# If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format 
# and returns the time of day in 24 hour format (hh:mm). 
# Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

# P
# Input: negative or positive number
# Output: time in 24 hour format (hh:mm) as string
# Explicit:
#  - Method that converts minutes to hours and minutes.
#  - Without using Date and Time classes.
#  - Work with any integer input (negative or positive).
#  - If negative number, then time is before midngiht. (12:01 -- 00:00)
#  - If positive number, then time is after midnight. (00:01 -- 12:00)
#  - Use 24 hour format.( 23:04, 13:08, ...)
#  - Disregard Daylight Savings and Standard Time and other complications.
# Implicit:
#  - If input is 0, return 00:00.
#  - Assume that the input is always an integer.

# E
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

# if positive number or 0, but < 1440
#   number.divmod(60)
#   first num is an hour, the second num is minutes
#   800.divmod(60) ---> '13:20'
#   35.divmod(60) ---> '00:35'
#   0.divmod(60) --->
# if positive number, but > 1440
#   number.divmod(1440) 
#   second num.divmod(60)
#   3000.remainder(1440) --> (120 --> 120.divmod(60) --> '02:00') treat as positive num < 1440
# if number is negative and the positive value of it is < 1440
#   number.divmod(60)
#   24 + first number is an hour, and the second number is minutes
#   -3.divmod(60) --> [-1, 57] --> 24 + (-1) = 23 --> '23:57'
#   -1437.divmod(60) --> [-24, 3] --> 24 + (-24) = 0 --> '00:03'
# if number is negative and the positive value of it is > 1440
#   number.divmod(1440)
#   second number.divmod(60)
#   -4231.remainder(1440) --> (-1357 --> -1357.divmod(60)--> [-23, 29] --> 24+(-23) = 1 --> '01:29')

# D
# Use outputs for calculations and string interpolation to convert to '00:00'
# Use if, else statements.

# A
# 1. write a method that takes an integer pos and negative
# 2. if number is positive or 0 but its value is < 1440, 
# then divide this num to 60 and the quotient is an hour and remainder is a minute.
# 3. if number is positive and > 1440, then divide this num to 1440 and find the remainder
# and repeat the previous step with remainder.
# 4. if number is negative and its pos value is < 1440, then divide this num by 60
# and add the 24 to the negative quotient to calculate the hour, the remainder use as minutes.
# 5. if number is negative and its pos value is > 1440, then divide this num by 1440
# and repeat the previous step with the negative remainder.
# 6. use string interpolation to convert integers to string format of time.

# C
def time_of_day(integer)
  num = integer % 1440
  hour, minute = num.divmod(60)
  time = "#{"%.2i" % hour}:#{"%.2i" % minute}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Further Exploration
# Problem 1

# It's possible to write a single calculation with % that performs 
# the entire normalization operation in one line of code. Give it a try, 
# but don't spend too much time on it.

# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# def normalize_minutes_to_0_through_1439(minutes)
#   minutes % MINUTES_PER_DAY
# end

# def time_of_day(delta_minutes)
#   delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hours, minutes)
# end

# Problem 2
# How would you approach this problem if you were allowed to use ruby's Date and Time classes?

