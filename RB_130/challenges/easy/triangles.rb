# P
# To be a valid triangle, each side length must be greater than 0.
# To be a valid triangle, the sum of the lengths of any two sides 
# must be greater than the length of the remaining side.
# An equilateral triangle has three sides of equal length.
# An isosceles triangle has exactly two sides of the equal length.
# A scalene triangle has three sides of unequal length (no two sides have equal length).

class Triangle
  attr_reader :s1, :s2, :s3
  def initialize(s1, s2, s3)
    raise ArgumentError unless is_triangle?(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end

  def is_triangle?(s1, s2, s3)
    [s1, s2, s3].min > 0 &&
    (s1 + s2) > s3 &&
    (s2 + s3) > s1 &&
    (s3 + s1) > s2
  end

  def is_equilateral?
    s1 == s2 && s2 == s3
  end

  def is_isosceles?
    (s1 == s2) || (s2 == s3) || (s1 == s3)
  end

  def kind
    if is_equilateral?
      'equilateral'
    elsif is_isosceles?
      'isosceles'
    else
      'scalene'
    end
  end
end