# searching 101
puts '==> Enter the 1st number:'
first_num = gets.chomp.to_i

puts '==> Enter the 2nd number:'
second_num = gets.chomp.to_i

puts '==> Enter the 3rd number:'
third_num = gets.chomp.to_i

puts '==> Enter the 4th number:'
fourth_num = gets.chomp.to_i

puts '==> Enter the 5th number:'
fifth_num = gets.chomp.to_i

puts '==> Enter the last number:'
last_num = gets.chomp.to_i

num_arr = [first_num, second_num, third_num, fourth_num, fifth_num]

if num_arr.include?(last_num)
  puts "The number #{last_num} appears in #{num_arr}"
else
  puts "The number #{last_num} does not appear in #{num_arr}"
end