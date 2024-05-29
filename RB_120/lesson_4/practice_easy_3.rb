# 1
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi
# =========================
# Hello

hello = Hello.new
hello.bye
# =========================
# undefined method

hello = Hello.new
hello.greet
# =========================
# no argument error

hello = Hello.new
hello.greet("Goodbye")
# =========================
# Goodbye

Hello.hi
# =========================
# undefined method error

# 2
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# =========================
# def self.hi
#   greeting = Greeting.new
#   greeting.greet("Hello")
# end

# 3
class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# =========================
# cat1 = AngryCat.new(12, 'Lola')
# cat2 = AngryCat.new(1, 'Alex')

# 4
class Cat
  def initialize(type)
    @type = type
  end
end

# =========================
# def to_s
#   "I am a #{@type} cat"
# end

# 5
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model

# =========================
# error
# empty (nil)

# empty (nil)
# error

# 6
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# =========================
# @age += 1

# 7
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# =========================
# return