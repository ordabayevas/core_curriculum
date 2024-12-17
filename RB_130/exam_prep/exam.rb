require 'pry'
require 'pry-byebug'
def fetch(select_string)
  employees = [
    { name: 'Alice', location: 'Oregon', type: 'Manager', salary: 50000 },
    { name: 'Bob', location: 'Oregon', type: 'Staff', salary: 30000 },
    { name: 'Charlie', location: 'California', type: 'Manager', salary: 55000 }
  ]
  
  if select_string.include?('employee_type')
    employees.select { |employee| employee[:type] == select_string.split('=').last.strip }
  elsif select_string.include?('employee_location')
    employees.select { |employee| employee[:location] == select_string.split('=').last.strip }
  else
    employees
  end
end

def save(data)
end

def update_data(select_string, block)
  data = fetch(select_string)
  data.each { |employee| block.call(employee) if block_given? }
  save(data)
end

def update_by_type(type) # you can update this method
  update_data("employee_type = #{type}")
end

def update_by_location(location) # you can update this method
  update_data("employee_location = #{location}")
end

# Example calls - do not modify these lines
update_by_type("Manager") do |employee|
  employee.salary *= 1.25
end

update_by_location("Oregon") do |employee|
  employee.salary *= 1.10
end

# class Rectangle
#   attr_accessor :height, :width, :color

#   def initialize
#     @height = 50
#     @width = 50
#     @color = :red
#     yield(self) if block_given?
#   end

#   def to_s
#     "#{height}x#{width} #{color} rectangle"
#   end
# end

# rect = Rectangle.new
# puts rect # => 50x50 red rectangle

# rect1 = Rectangle.new do |r|
#   r.height = 400
#   r.width = 300
#   r.color = :black
# end

# puts rect1 # => 400x300 black rectangle

# p("Hello") do
#   p "Goodbye"
# end

# Write a method that takes a string argument and a block. 
# The method should invoke the block once for each character in the string. 
# It should then concatenate all the return values from the block into a new string, 
# then return that string. 
# For instance, if the block converts each character to uppercase, 
# the method should return the original value converted to uppercase.

# For this problem, assume that the method will always be called with a block.

# def convert(string)
#   new_str = ''
#   string.chars do |char|
#     if block_given?
#       new_str << yield(char)  # Use `yield` to call the block with `char`
#     else
#       new_str << char
#     end
#   end
#   new_str  # Return the transformed string
# end

# p convert('a string')

# def convert(string)
#   new_str = ''
#   string.each_char do |char|
#     new_str << yield(char)
#   end
#   new_str
# end

# p convert('A simple string') { |char| char.upcase } # => "A SIMPLE STRING"
# p convert('xyyz') { |char| char + char }            # => xxyyyyzz
# p convert('Ready? Set. Go!') {|char| char == ' ' ? '' : char} # =
# p convert('Ready? Set. Go!') {|char| char == ' ' ? '' : char}


# def do_something_silly(word)
#   yield word
# end

# do_something_silly("hello") do |word, another_word|
#   p word
#   p another_word
# end



# + Instead of being called on an array, pass the array to the method as an argument.
# + Use an explicit block to reference the block used to decide which elements should be selected.
# + If a block is not specified in the invocation, return an empty array.
# + The method should return a new array that contains all of the elements from the array argument for which the block returns a truthy value. 
# + Elements for which the block returns a falsy value should be ignored.
# + Do not mutate the original array.
# + Do not use Array#filter or Array#select in your code.

# def filter(array, &block)
#   filtered = []

#   return filtered if !block_given?

#   array.each do |item|
#     filtered << item if block.call(item)
#   end

#   filtered
# end

# arr = [1, 2, 3, 4, 5]

# filtered_arr = filter(arr) { |el| el != 3 }
# p filtered_arr                               # [1, 2, 4, 5]
# p arr                                        # [1, 2, 3, 4, 5]

# filtered_arr = filter(arr) { |el| el <= 3 }
# p filtered_arr                               # [1, 2, 3]
# p arr                                        # [1, 2, 3, 4, 5]

# filtered_arr = filter(arr)
# p filtered_arr                               # []
# p arr                                        # [1, 2, 3, 4, 5]

# name = "Alice"

# def another
#   name = 'Louis'
# end

# def run
#   name = "Cassidy"
#   yield(name)
# end

# puts run { "Hey there #{name}"}
# name = "Bill"

# def sandwich_maker
#   puts "I'm making a sandwich!\nStart with a slice of bread."
#   yield
#   puts "Finish off with another slice of bread!\nYum!"
# end

# mustard_sandwich = <<~SANDWICH1
#   Spread Mustard.
#   Add Lettuce.
#   Add Sliced Ham.
#   Add Cheese.
#   Spread Mayo.
# SANDWICH1

# sandwich_maker {puts mustard_sandwich}

# peanut_butter_sandwich = <<~SANDWICH2
#   Spread Peanut Butter.
#   Spread Jelly.
#   Add Sliced Banana.
# SANDWICH2

# sandwich_maker {puts peanut_butter_sandwich}
# I'm making a sandwich!
# Start with a slice of bread.
# Spread Mustard.
# Add Lettuce.
# Add Sliced Ham.
# Add Cheese.
# Spread Mayo.
# Finish off with another slice of bread!
# Yum!

# I'm making a sandwich!
# Start with a slice of bread.
# Spread Peanut Butter.
# Spread Jelly.
# Add Sliced Banana.
# Finish off with another slice of bread!
# Yum!