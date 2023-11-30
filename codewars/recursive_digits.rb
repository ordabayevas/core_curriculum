# def digital_root(n)
#   new_n = n.to_s.split('')
#   if new_n.size == 1
#     return n
#   elsif new_n.size == 2
#     nums_array = new_n.map { |num| num.to_i}
#     digits_sum = nums_array.sum
#     if digits_sum >= 10
#       return digital_root(digits_sum)
#     else
#       return digits_sum
#     end
#   else new_n.size > 2
#     nums_array = new_n.map { |num| num.to_i}
#     digits_sum = nums_array.sum
#     digital_root(digits_sum)
#   end
# end



# best solution from Codewars

def digital_root(n)
  n < 10 ? n : digital_root(n.digits.sum)
end

puts digital_root(16)
puts digital_root(134)
puts digital_root(1567)
puts digital_root(132189)