# equilateral All 3 sides are of equal length -> (3, 3, 3)
# isosceles 2 sides are of equal length, while the 3rd is different -> (3, 3, 1.5)
# scalene All 3 sides are of different length -> (3, 4, 5)
# invalid -> (0, 3, 3)

# To be a valid triangle, the sum of the lengths of the two shortest
# sides must be greater than the length of the longest side, and all sides
# must have lengths greater than 0: if either of these conditions is not satisfied,
# the triangle is invalid.

# - 2 shortest sides should be greater than 3 side -> (1, 1, 3) -> 1 + 1 = 2, 2 > 3 -> false
# - all sides must be greater than 0 -> (0, 3, 3)

# Input: 3 integers 
# Output: :equilateral or :isosceles or :scalene or :invalid

# D

# A
# - if all sides are equal to each other, then it is equilateral:
#   - if 2 sides are equal
#   - check the 2 and 3rd for equilaty
#   - if false:
#     - if sorted first two are in sum are the bigger than the 3rd then its a :isosceles
# - we need to find the two shortest sides of triangle
#   - place the integers of sides into array
#   - sort the array if two first elements are in sum greater than the 3rd, then it is valid

# C
def valid?(first, second, third)
  if first == 0 || second == 0 || third == 0
    false
  else
    array = [first, second, third].sort
    (array[0] + array[1]) > array[2] ? true : false
  end
end

def triangle(first, second, third)
  if valid?(first, second, third)
    if first == second
      second == third ? :equilateral : :isosceles
    else
      :scalene
    end
  else
    :invalid
  end
end

p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5) #== :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid


