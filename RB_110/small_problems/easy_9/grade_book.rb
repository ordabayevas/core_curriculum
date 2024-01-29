# Write a method that determines the mean (average) of the three scores passed to it, 
# and returns the letter value associated with that grade.
# Tested values are all between 0 and 100. 
# There is no need to check for negative values or values greater than 100.

# def get_grade(score1, score2, score3)
#   mean = (score1 + score2 + score3) / 3
#   case mean
#   when 90..100
#     'A'
#   when 80..90
#     'B'
#   when 70..80
#     'C'
#   when 60..70
#     'D'
#   else
#     'F'
#   end
# end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"
# p get_grade(100, 100, 100) == 'A'

# Further
def get_grade(score1, score2, score3, bonus)
  mean = (score1 + score2 + score3) / 3
  total = mean + bonus
  case total
  when 0..60
    'F'
  when 60..70
    'D'
  when 70..80
    'C'
  when 80..90
    'B'
  else
    'A'
  end
end

p get_grade(100, 100, 100, 10) == 'A'
p get_grade(50, 50, 95, 10)