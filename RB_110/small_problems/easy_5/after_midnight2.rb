# Description
# Write two methods that each take a time of day in 24 hour format, 
# and return the number of minutes before and after midnight, respectively. 
# Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

# P
# Input: string time in 24 hours
# Output: time in minutes as integer
# Explicit: 
#  - write two methods that takes time in string format of 24 hours ('13:24','23:45')
#  - first method calculates the time before midnight and the second takes time after midnight.
#  - Method should return positive number in range 0-1439.
# Implicit:
#  - It should also takes time as '24:00' for both methods it should return 0.
#  - Assume that the input is always a valid input.

# E
# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0

# D
# Convert string time to integer:
#  - firstly convert to an array with two elements --> hour and minute
#  - convert every element to integer for calculations

# A
# 1. First method is after_midnight(string_time):
# - convert string_time to an array with two integers: hour and minutes
#   - write a convertation method, return an array of 2 integers
# - first integer of hour multiply by 60 minutes
# - second integer of minutes add to result of previous calculation
# - if time is 00:00, result will be 0 as it should
# - if time is 24:00, result will be 1440 which is out of range, the max is 1439. 
# Everything out of range should return 0.

# 2. Second method is before_midnight(string_time)
# - use a convertation method, return an array of 2 integers
# - first integer of hour multiply by 60 minutes
# - second integer of minutes add to result of previous calculation
# - 1440 subtract the result of previous step
# - if time is 00:00, result will be 0 as it should
# - if time is 24:00, result will be 0.

# C
def convert_to_num_arr(string_time)
  str_arr = string_time.split(':')
  num_arr = str_arr.map {|num| num.to_i}
  if num_arr[0] == 24
    num_arr[0] = 0
  end
  num_arr
end

def after_midnight(time)
  hour_minutes = convert_to_num_arr(time)
  minutes_total = hour_minutes[0] * 60 + hour_minutes[1]
end

p after_midnight('00:00') == 0
p after_midnight('12:34') == 754
p after_midnight('24:00') == 0

def before_midnight(time)
  if after_midnight(time) != 0
    minutes_total = 1440 - after_midnight(time)
  else
    after_midnight(time)
  end
end

p before_midnight('00:00') == 0
p before_midnight('12:34') == 686
p before_midnight('24:00') == 0

# Further exploration someone's code:
# Using Time class
# require 'time'
# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

# def after_midnight(time)
#   time = Time.parse(time)
#   (time.hour * MINUTES_PER_HOUR) + time.min
# end

# def before_midnight(time)
#   delta = after_midnight(time)
#   (MINUTES_PER_DAY - delta) % MINUTES_PER_DAY
# end