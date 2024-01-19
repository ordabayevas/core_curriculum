# Description
# Write a method that takes a floating point number that represents an angle 
# between 0 and 360 degrees and returns a String that represents that angle 
# in degrees, minutes and seconds. You should use a degree symbol (°) to 
# represent degrees, a single quote (') to represent minutes, and a double quote 
# (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

# P
# Input: float number
# Output: this number in degree, minutes and seconds
# Explicit: 
# - method that takes floating point number and coverts it to degree, minutes and 
# seconds between 0 and 360. 
# - a degree has 60 minutes and represented by symbol (°)
# - a minute has 60 seconds and represented by single quote (')
# - a second represented by double quote (")
# - minutes and seconds should contain two numbers each, with leading zero
# - use DEGREE = "\xC2\xB0" for symbol (°)
# Implicit:
# - all floats are positive

# E
# All test cases should return true
# puts dms(30) == %(30°00'00")
# puts dms(76.73) == %(76°43'48") 
# puts dms(254.6) == %(254°36'00")
# puts dms(93.034773) == %(93°02'05")
# puts dms(0) == %(0°00'00")
# puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# 76.73 -> 76 degree -> 0.73 * 60 -> 43.8 -> 43 minutes -> 0.8 * 60 -> 48 seconds
# [76, 43, 48]
# 254.6 -> 254 deg -> 0.6 * 60 -> 36.0
# [254, 36, 0]
# 93.034773 -> 93 deg -> 0.034773 * 60 -> 2.08638 -> 2 min -> 5.1828 -> 5 sec

# D
# Use Kernel format for formatting minutes and seconds --> "%.2i" %
# Use empty array to store degree, minute and seconds while calculating?

# A
# - write a method that takes a positive float
# - separate the whole number of float and decimal by dividing by integer 1
# - add whole number to array
# - calculate the minutes:
#   - use decimal and multiply it by 60
#   - repeat separation of whole number and decimal
#   - add whole number to array
# - calculate the seconds:
#   - use decimal and multiply it by 60
#   - repeat separation of whole number and decimal
#   - add whole number to array
# - use array elements and format it by string interpolation

# C
DEGREE = "\xC2\xB0"

def format(array)
  deg, min, sec = array
  "#{deg}#{DEGREE}#{"%.2i" % min}'#{"%.2i" % sec}\""
end

# def dms(angle)
#   arr = []
#   deg = angle.divmod(1)
#   arr << deg[0]
#   min = (deg[1] * 60).divmod(1)
#   arr << min[0]
#   sec = (min[1] * 60).divmod(1)
#   arr << sec[0]
#   format(arr)
# end

# puts dms(30) == %(30°00'00")
# puts dms(76.73) == %(76°43'48") 
# puts dms(254.6) #== %(254°36'00")
# puts dms(93.034773) == %(93°02'05")
# puts dms(0) == %(0°00'00")
# puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# p dms(400) == %(400°00'00")
# p dms(-40) == %(320°00'00")

# DEGREE = "\xC2\xB0"
# MINUTES_PER_DEGREE = 60
# SECONDS_PER_MINUTE = 60
# SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE # 3600

# def dms(degrees_float)
#   total_seconds = (degrees_float * SECONDS_PER_DEGREE).round # 254.6 * 3600 = 916560
#   degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE) # [254, 2160]
#   minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE) # [36, 0]
#   format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end

# puts dms(254.6) #== %(254°36'00")

# Further exploration
def dms(angle)
  arr = []
  if angle < 0
    while angle < 0
      angle += 360
    end
  else
    angle
  end
  deg = angle.divmod(1)
  arr << deg[0]
  min = (deg[1] * 60).divmod(1)
  arr << min[0]
  sec = (min[1] * 60).divmod(1)
  arr << sec[0]
  format(arr)
end

p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")