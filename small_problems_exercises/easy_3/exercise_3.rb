puts 'Please write word or multiple words:'
input = gets.chomp

input_to_array = input.split(' ')
input_to_string = input_to_array.join
puts "There are #{input_to_string.size} characters in \"#{input}\"."
