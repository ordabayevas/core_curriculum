class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Further Exploration
# class Pet

#   # Add a third, default parameter that will only come into play and create
#   # an instance variable for color if one is provided with instantiation
#   def initialize(name, age, color=false)
#     @name = name
#     @age = age
#     @color = color if color
#   end
# end

# class Cat < Pet
#   attr_reader :name, :age, :color

#   def initialize(name, age, color)

#     # `Cat` can now just call #super with no arguments or parentheses to
#     #  pass all of its arguments to the `Pet` #initialize
#     super
#   end

#   def to_s
#     "My cat #{name} is #{age} years old and has #{color} fur"
#   end
end