# You have a bank of switches before you, numbered from 1 to n. 
# Each switch is connected to exactly one light that is initially off. 
# You walk down the row of switches and toggle every one of them. 
# You go back to the beginning, and on this second pass, 
# you toggle switches 2, 4, 6, and so on. On the third pass, 
# you go back again to the beginning and toggle switches 3, 6, 9, and so on. 
# You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, 
# and returns an Array that identifies which lights are on after n repetitions.

# P
# Input: integer - total num of switches
# Output: array with nums of switches that in position On
# Explicit:
# - take total a num of switches, for example 10.
# - switches have two positions: Off and On
# - 10 switches are off, start 10 loops
# Off: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] On:[]
# - 1 loop -> change the position of every switch means every 1 switch: multiples of 1
# Off: [] On:[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# - 2 loop -> change the position of 2, 4, 6, 8 and 10 inclusively: multiples of 2
# Off: [2, 4, 6, 8, 10] On:[1, 3, 5, 7, 9]
# - 3 loop -> change the position of 3, 6, 9: multiples of 3
# Off: [2, 3, 4, 8, 9, 10] On: [1, 5, 6, 7]
# - 4 loop -> change the position of 4, 8: multiples of 4
# Off: [2, 3, 9, 10] On: [1, 4, 5, 6, 7, 8]
# - 5 loop -> change the position of 5, 10: multiples of 5
# Off: [2, 3, 5, 9] On: [1, 4, 6, 7, 8, 10]
# - 6 loop -> change the position of 6: multiples of 6
# Off: [2, 3, 5, 6, 9] On: [1, 4, 7, 8, 10]
# - 7 loop -> change the position of 7: multiples of 7
# Off: [2, 3, 5, 6, 7, 9] On: [1, 4, 8, 10]
# - 8 loop -> change the position of 8: multiples of 8
# Off: [2, 3, 5, 6, 7, 8, 9] On: [1, 4, 10]
# - 9 loop -> change the position of 9: multiples of 9
# Off: [2, 3, 5, 6, 7, 8] On: [1, 4, 9, 10]
# - 10 loop -> change the position of 10: multiples of 10
# Off: [2, 3, 5, 6, 7, 8, 10] On: [1, 4, 9]
# - the return value is [1, 4, 9]

# E
# Example with n = 5 lights:

# round 1: every light is turned on # all
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on # 2, 4, 6
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on # 3, 6, 9
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on # 4, 8, 12
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on # 5, 10, 15
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

# D
# Create two arrays for On and Off position numbers.
# Create an array of numbers of switches.

# A
# - write a method with 1 argument
# - create an array from 1 to this number and call it Off
# - create an array for On
# - argument times do:
#   - move all swithes from array Off, that divides by (index + 1) = 1, to array On
#   - move nums that divides by (index + 1), from array where they are contained to another array
#   - so on...
# - return the array On

# C
# def lights(total_number)
#   off = (1..total_number).to_a # create an array of all switches
#   on = {} # initialize new hash to hold switch and number of toggle
#   total_number.times do |iterator| # argument times do loop; iterator starts from 0
#     multiples = off.select { |num| num % (iterator + 1) == 0 } # by every iteration return an array with multiples of iterator + 1: 1, 2, 3...
#     multiples.each do |n| # every num of selected array
#       if !on.key?(n) # if 'on' hash hasn't key of iterating num
#         on[n] = 1 # add this num as a key and assign to 1
#       else # if 'on' hash has key of iterating num
#         on[n] += 1 # add to its value + 1 and reassign
#       end
#     end
#   end
#   on_arr = [] # initialize return array
#   on.each { |k, v| on_arr << k if v.odd? } # iterate the hash, if its value is odd, add its key
#   on_arr # return array with nums
# end

# LS's solution

# def initialize_lights(number_of_lights)
#   lights = Hash.new
#   1.upto(number_of_lights) { |number| lights[number] = "off" }
#   lights
# end
# # return list of light numbers that are on
# def on_lights(lights)
#   lights.select { |_position, state| state == "on" }.keys
# end

# # toggle every nth light in lights hash
# def toggle_every_nth_light!(lights, nth)
#   lights.each do |position, state|
#     if position % nth == 0
#       lights[position] = (state == "off") ? "on" : "off"
#     end
#   end
# end

# def toggle_lights(number_of_lights)
#   lights = initialize_lights(number_of_lights)
#   1.upto(lights.size) do |iteration_number|
#     toggle_every_nth_light!(lights, iteration_number)
#   end

#   on_lights(lights)
# end

# p lights(1000)

# Further exploration

def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end
# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light!(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

def joinor(array, sign=', ', word='and')
  new_string = ''
  if array.size == 1
    return array[0].to_s
  elsif array.size == 2
    new_string << "#{array[0]} #{word} #{array[1]}"
  else
    new_array = array.slice(0..-2)
    last_element = "#{word} #{array[-1]}"
    new_array.each { |num| new_string << "#{num}#{sign}" }
    new_string << last_element
  end
end

def display_result(lights, iteration_number)
  off = []
  on = []
  lights.each do |k, v|
    break if k == iteration_number
    off << k if v == 'off'
    on << k if v == 'on'
  end

  puts "lights #{joinor(off)} are now off; #{joinor(on)} are on"

end

def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light!(lights, iteration_number)
    display_result(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(10)