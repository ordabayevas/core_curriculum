class Rectangle
  include Comparable
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def area
    width * height
  end

  def <=>(other)

  end
end

rect1 = Rectangle.new(6, 4)
rect2 = Rectangle.new(5, 5)

p rect2 > rect1 # true
p rect1 < rect2 # true

# What would happen if we ran this code now? Why? 
# How do we fix it? 

######

class Parent
  def hello(subject="World")
    puts "Hello, #{subject}"
  end
end

class Child < Parent
  def hello(subject)
    puts "How are you today?"
  end
end

child = Child.new
child.hello('Bob')
# What will be output if we run this code?
# How can we get it to output the following?
# Hello, Bob
# How are you today?

####