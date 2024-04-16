=begin
P
Input: integer
Output: next biggest num from the same digits

Rules:
- takes positive integer
- returns the next bigger integer from the same digits
- if no bigger nums can be formed from these digits, return -1

E
12 --> 21
513 --> 531
123456789 ---> 123456798
1243 --> 1324

D
begin: integer
middle: string
end: integer

A
- start loop with n = 2
  - sort last n- digits by descending order
    - if they already sorted, then consider last n + 1 digits
    - else
      - find a digit in the sorted, that stands before the first digit from the initial
        - put this digit from sorted, as first in the sequence of the last 3 digits
        - other digits are placed in ascending order
        - break the loop and return modified sequence of last digits
- add the first not modified part of digits to the last n- digits:
  - subtract the size of returned from loop sequence from initial input size
  - slice input digit from zero indexed element till the num from the previous
  - concatenate first part and second part
  - convert to integer and return
=end

# C
# def next_biggest(integer)
#   n = 2
#   last_part = ''
#   other_digits = ''
#   next_biggest = nil

#   loop do
#     n_last_digits = integer.to_s.chars[integer.to_s.size - n, n]
#     sorted_in_descend = n_last_digits.sort {|a, b| b <=> a }
#     if n_last_digits == sorted_in_descend
#       n += 1
#       next
#     else
#       sorted_in_descend.each_with_index do |digit, i|
#         if last_part.empty? && (digit == n_last_digits[0])
#           # other_digits = ['4', '3']
#           # digit = '2'
#           # last_part = ''
#           other_digits = other_digits[0..-2]
#           other_digits << digit
#           last_part << sorted_in_descend[i - 1]
#         else
#           other_digits << digit
#         end
#       end

#       last_part << other_digits.chars.sort.join
#       length = integer.to_s.size - last_part.size
#       first_part = integer.to_s[0, length]
#       next_biggest = (first_part + last_part).to_i
#       break
#     end
#   end
#   next_biggest
# end

# p next_biggest_num(123456789)

def next_biggest(integer)
  integer_arr = integer.to_s.chars
  max_num = integer_arr.sort {|a, b| b <=> a }.join.to_i

  if integer == max_num
    return -1
  end

  (integer + 1).upto(max_num) do |num|
    if num.to_s.chars.sort == integer.to_s.chars.sort
      return num
    end
  end
  -1
end

# def next_biggest_perm(integer)
#   integer_arr = integer.to_s.chars
#   arr = []
#   integer_arr.permutation do |comb|
#     new_comb = comb.join.to_i
#     if (new_comb - integer) > 0
#       arr << new_comb
#     end
#   end
#   arr.min
# end

# def next_biggest(integer)
#   integer_arr = integer.to_s.chars
#   max_num = integer_arr.sort {|a, b| b <=> a }.join.to_i

#   if integer == max_num
#     return -1
#   end

#   integer_arr.permutation.map { |comb| comb.join.to_i }.sort.each do |num|
#     if num > integer
#       return num
#     end
#   end
#   -1
# end

# p next_biggest(135)
# p next_biggest(12)
# p next_biggest(1243)
p next_biggest(1798876543)




