# def add(arg)
#   arg = arg + 4
# end

# x = 4
# puts add(x)
# puts x

# def my_method(a, b = 2, c = 3, d)
#   p [a, b, c, d]
# end

# my_method(4, 5, 6)

# a = [1, 4, 8, 11, 15, 19]
# puts a.bsearch {|x| x > 8 }

# puts a.select { |x| x > 8 }

# puts a.find { |x| x > 8}

# a = %w(a b c d e) 
# puts a.fetch(7) # => error
# puts a.fetch(7, 'beats me') # => 'beats me'
# puts a.fetch(7) { |index| index**2 } # => 49
# num = 5
# while num != 0
#   num -= 1
#   puts num
# end

# s = 'string'
# p s[0]

#sum = (1..integer.to_i).to_a.sum

# prod = 1
# (1..5).to_a.each do |num|
#   prod *= num
# end

# p prod

# p 22.to_s == '22'.reverse

# greeting = 'Hello'
# p greeting.object_id

# loop do
#   greeting = 'Hi'
#   p greeting.object_id
#   break
# end

# puts greeting
# p greeting.object_id

# def replace(str, value)
#   loop do
#     break
#   end
#   str = value
# end

# greet = 'Hey!'
# replace(greet, 'Hello')
# puts greet

# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# new_array = arr.select do |n|
#    n = n + 1
#    puts n
# end

# p new_array


# selected_foods = [['apple', 'kiwi'], ['artichoke', 'broccoli']].select do |arr|
#   puts selected_foods.object_id
#   arr.select do |food|
#     food.start_with?('a')
#   end
# end

# p selected_foods
# puts selected_foods.object_id

# def append(s)
#   d = s.upcase!
# end

# t = 'abc'
# puts append(t)
# puts t

# first_name = 'Winston'
# last_name = 'Churchill'
# lower_case_name = first_name + last_name
# upper_case_name = lower_case_name.upcase
# puts "This is lowercase #{lower_case_name}"
# puts "This is uppercase #{upper_case_name}"

# def string(string)
#   if string.size >= 80
#     puts string[0...80]
#   end
# end

# string('The code range can be used to quickly disqualify strings known not to match, such as those with the')
# a = ['a', 'b', 'c']

# k = a.select do |letter| 
#       a.delete_at(-1) 
#       a.include?(letter)
#     end
# k = k.size

# p k

# def say(words='hello')
#   puts words + '.'
# end

# say()
# say("hi")
# say("how are you")
# say("I'm fine")

# def some_method
#   a = 1
#   b = 0
#   5.times do
#     puts a
#     b = 2
#   end

#   puts a
#   puts b
# end

# some_method     # => NameError: undefined local variable or method `b' for main:Object

# def sum(num1, num2)
#   sum = num1 + num2
# end

# a = 3
# b = 5
# p sum(a, b) # 8
# p a # 3
# p b # 5

arr = [1, 2, 3, 4]
# odds = arr.select do |n|
# 	n + 1
# 	puts n
# end

# # => []
# p odds

# incremented = arr.map do |n|
#   "hi"
# end

# p incremented

# def repeat(string, number)
#   number.times do # 3.times do
#     puts string # puts 'Hello'
#   end
# end

# repeat('Hello', 3)

# def stringy(size)
#   numbers = []

#   size.times do |index|
#     number = index.even? ? 1 : 0
#     numbers << number
#   end

#   numbers.join
# end

# puts stringy(6) == '101010'

num = 1

loop do |num|
  puts num
  num = 2
  break
end

puts num # => 1