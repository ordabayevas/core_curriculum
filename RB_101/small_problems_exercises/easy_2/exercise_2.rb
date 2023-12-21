# SQMETERS_TO_SQFEET = 10.7639

# def room_size
#   puts 'Enter the length of the room in meters:'
#   length = gets.chomp

#   puts 'Enter the width of the room in meters:'
#   width = gets.chomp

#   size_meters = (length.to_f * width.to_f).round(2)
#   size_feet = (size_meters * SQMETERS_TO_SQFEET).round(2)

#   puts "The area of the room is #{size_meters} square meters (#{size_feet} square feet)."
# end

# room_size

# Modify this program to ask for the input measurements in feet, 
# and display the results in square feet, square inches, and square centimeters.
SQFEET_TO_SQINCHES = 144
SQFEET_SQCM = 0.092903 * 10000

def room_size
  puts 'Enter the length of the room in feet:'
  length = gets.chomp

  puts 'Enter the width of the room in feet:'
  width = gets.chomp

  size_feet = (length.to_f * width.to_f).round(2)
  size_inches = (size_feet * SQFEET_TO_SQINCHES).round(2)
  size_cm = (size_feet * SQFEET_SQCM).round(2)

  puts "The area of the room is #{size_feet} square feet (#{size_inches} square inches, #{size_cm} square cm)."
end

room_size