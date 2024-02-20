# Write Number in Expanded Form

=begin
You will be given a number and you will need to return it as a string in Expanded Form. 

For example:
expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'
NOTE: All numbers will be whole numbers greater than 0.

If you liked this kata, check out part 2!!
=end

# P
# Input: integer
# Output: string of the sum of whole nums equal to given integer

# E
# expanded_form(70304); # Should return '70000 + 300 + 4'

# D
# Use integer for calculations.
# Use string interpolation.

# # A
# - write a method with 1 int arg
# - loop:
#   - divmod num by 10 -> 70304.divmod(10) = [7030, 4]
#     - the remainder add to empty arr
#     - the whole num divide by 10 -> 7030.divmod(10) = [703, 0]
#     - repeat till whole num is equal to 0
# - iterate the array with remainders:
#   - [4, 0, 3, 0 , 7] every num multiply by 1, 10, 100 and so on
#   - remove 0
#   - convert to string

# p expanded_form(12) == '10 + 2'
# p expanded_form(42) == '40 + 2'
# p expanded_form(70304) == '70000 + 300 + 4'

# 4 * 1
# 0 * 10
# 3 * 100
# 0 * 1000
# 7 * 10000

# 4 + 0 + 300 + 0 + 70000

# C
def expanded_form(integer)
  remainders = []
  loop do 
    integer, remainder = integer.divmod(10)
    remainders << remainder
    break if integer == 0
  end

  last_arr = []
  remainders.each_with_index do |num, i|
    last_arr << (num * 10**i) if (num * 10**i) > 0
  end
  
  last_arr.reverse.join(' + ')
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'