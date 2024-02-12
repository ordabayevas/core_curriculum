# A triangle is classified as follows:

# - right One angle of the triangle is a right angle (90 degrees)
# - acute All 3 angles of the triangle are less than 90 degrees
# - obtuse One angle is greater than 90 degrees.

# To be a valid triangle, the sum of the angles must be exactly 180 degrees, 
# and all angles must be greater than 0: if either of these conditions is not satisfied, 
# the triangle is invalid.
# Write a method that takes the 3 angles of a triangle as arguments, 
# and returns a symbol :right, :acute, :obtuse, or :invalid depending on 
# whether the triangle is a right, acute, obtuse, or invalid triangle.
# You may assume integer valued angles so you don't have to worry about floating 
# point errors. You may also assume that the arguments are specified in degrees.

# P
# Input: 3 integers - angles of triangle
# Output: :right, :acute, :obtuse, or :invalid

# D

# A
# - write a method that firstly checks for validness
# - write a main method that checks if 1 of angles is 90, if yes then return :right
# - if not, sorted max side is > 90, then :obtuse, if not :acuse

# C
def valid?(ang1, ang2, ang3)
  if ang1 == 0 || ang2 == 0 || ang3 == 0
    false
  else
    (ang1 + ang2 + ang3) == 180 ? true : false
  end
end

def triangle(ang1, ang2, ang3)
  if valid?(ang1, ang2, ang3)
    if [ang1, ang2, ang3].max == 90
      :right
    else
      [ang1, ang2, ang3].max > 90 ? :obtuse : :acute
    end
  else
    :invalid
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

# LS solution
# def triangle(angle1, angle2, angle3)
#   angles = [angle1, angle2, angle3]

#   case
#   when angles.reduce(:+) != 180, angles.include?(0)
#     :invalid
#   when angles.include?(90)
#     :right
#   when angles.all? { |angle| angle < 90 }
#     :acute
#   else
#     :obtuse
#   end
# end