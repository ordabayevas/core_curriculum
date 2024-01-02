# 1. even or odd?

# count = 1

# loop do
#   if count.odd?
#     puts "#{count} is odd!"
#   else
#     puts "#{count} is even!"
#   end
#   count += 1
#   break if count > 5
# end

# 2. catch the number

# loop do
#   number = rand(100)
#   if number <= 10 && number >= 0
#     break
#   else
#     puts number
#   end
# end

# 3. conditional loop

# process_the_loop = [true, false].sample

# if process_the_loop
#   loop do
#     puts 'The loop was processed'
#     break
#   end
# else
#   puts "The loop wasn't processed!"
# end

# 4. get the sum

# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
  
#   if answer == 4
#     puts "That's correct!"
#     break
#   else
#     puts "Wrong answer. Try again!"
#   end

# end

# 5. insert numbers

# numbers = []

# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
#   numbers << input
  
#   if numbers.size == 5
#     break
#   end

# end
# puts numbers

# 6. empty the array

# names = ['Sally', 'Joe', 'Lisa', 'Henry']

# loop do
#   puts names.pop
#   break if names.empty?
# end

# 7. stop counting

# 5.times do |index|
#   puts index
#   break if index == 2
# end

# 8. only even

# number = 0

# until number == 10
#   number += 1
  
#   if number.even?
#     puts number
#   else
#     next
#   end

# end

# 9. first to five

# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   if number_a == 5 || number_b == 5
#     puts "5 was reached!"
#     break
#   else
#     next
#   end

# end

# 10. greeting

def greeting
  puts 'Hello!'
end

number_of_greetings = 2
number = 0

while number != number_of_greetings
  greeting
  number += 1
end