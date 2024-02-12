# P
# Input: integer
# Output: integer, multiple of seven, odd, bigger than argument, without repetitive digits

# E

# D
# integer

# A
# - write a method with 1 argument
# - argument divides by 7
# - if result is odd: + 2
# - else: + 1 to first, + 2 to other
# - while is_not_featured?: + 2 * 7
# - if loop is ended, return integer from is_not_featured

# C
def featured(integer)
  if integer >= 9_876_543_210
    raise "There is no possible number that fulfills those requirements"
  end
  quotient = integer / 7
  start = quotient.odd? ? (quotient + 2) : (quotient + 1)
  result = start * 7
  while is_repeating?(result)
    result += 14
  end
  result
end

def is_repeating?(result)
  result.to_s.chars.uniq.join != result.to_s
end

# p featured(12) #== 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
