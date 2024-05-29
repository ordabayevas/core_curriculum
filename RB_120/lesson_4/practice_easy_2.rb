# 1
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
oracle.predict_the_future

# =================================
# "You will eat a nice lunch" (random choice every time)

# 2
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

# =================================
# "You will visit Vegas" (random choice from Road Trip)

# 3
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# =================================
# class_name.ancestors
# Orange, Taste
# HotSauce, Taste

# 4
class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

# What could you add to this class to simplify it and remove two methods 
# from the class definition while still maintaining the same functionality?

# =================================
# attr_accessor :type

# 5
excited_dog = "excited dog" # => local variable
@excited_dog = "excited dog" # => instance variable
@@excited_dog = "excited dog" # => class variable

# =================================
# by prefix, if two dog signs then class, if 1 then instance

# 6
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end


self.manufacturer is a class method, prefix `self` in method definition
to call a class method, use the class name and then calling the method

# 7
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# =================================
# Cat.cats_count

# Variable @@cats_count is initialized on a class level. It increments by 1 every time when 
# new Cat object is initialized. So it stores the total count of initialized Cat class objects.
# Class method cats_count returns the value of @@cats_count and to output it we need to call
# for class method cats_count.

# 8
class Game
  def play
    "Start the game!"
  end
end

class Bingo
  def rules_of_play
    #rules of play
  end
end

# =================================
# class Bingo < Game

# 9
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# =================================
# we will override it

#10
What are the benefits of using Object Oriented Programming in Ruby? 
Think of as many as you can.

# =================================
To organize the code and avoid repetition
To build larger programs
To maintain