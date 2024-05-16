# Ex_1
puts "Hello".class
puts 5.class
puts [1, 2, 3].class

# Ex_2
class Cat 
end

# Ex_3
class Cat 
end

kitty = Cat.new

# Ex_4
class Cat 
  def initialize
    puts "I'm a cat!"
  end
end

kitty = Cat.new

# Ex_5

class Cat 
  def initialize(name)
    @name = name
    puts "Hello! My name is #{@name}!"
  end

end

kitty = Cat.new("Sophie")

# Ex_6
class Cat 
  def name
    @name
  end

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new("Sophie")
kitty.greet

# Ex_7
class Cat 
  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end

end

kitty = Cat.new("Sophie")
kitty.greet
kitty.name=('Luna')
kitty.greet

# Ex_7
class Cat 
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end

end

kitty = Cat.new("Sophie")
kitty.greet
kitty.name=('Luna')
kitty.greet

# Ex_8
module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end

end

kitty = Cat.new("Sophie")
kitty.greet
kitty.walk