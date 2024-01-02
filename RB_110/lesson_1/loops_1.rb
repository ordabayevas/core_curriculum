# 1. runaway loop

# loop do
#   puts 'Just keep printing...'
#   break
# end

# 2. loopception

# loop do
#   puts 'This is the outer loop.'

#   loop do
#     puts 'This is the inner loop.'
#     break
#   end
#   break
# end

# 3. control the loop

# iterations = 1

# loop do
#   puts "Number of iterations = #{iterations}"
#   iterations += 1
#   break if iterations > 5
# end

# puts 'This is outside all loops.'

# 4. loop on command

# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
#   break if answer == 'yes'
# end

# 5. say hello

# say_hello = true
# counter = 0

# while say_hello
#   puts 'Hello!'
#   counter += 1
#   if counter == 5
#     say_hello = false
#   end
# end

# 6. print while

# numbers = []

# while numbers.length != 5
#   number = rand(0..99)
#   numbers << number
# end

# puts numbers

# 7. count up

# count = 1

# until count > 10
#   puts count
#   count += 1
# end

# 8. print until

# numbers = [7, 9, 13, 25, 18]
# until numbers.size == 0
#   puts numbers.shift
# end

# 9. that's odd

# for i in 1..100
#   puts i if i.odd?
# end

# 10. greet your friends

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for name in friends
  puts "Hello, #{name}!"
end