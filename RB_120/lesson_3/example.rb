# class Animal
#   @@total_animals = 0

#   def initialize
#     @@total_animals += 1
#   end
# end

# class Dog < Animal
#   def initialize
#   end

#   def total_animals
#     @@total_animals
#   end
# end

# spike = Dog.new
# puts spike.total_animals                           # => 1

# class Person
#   attr_accessor :name, :age

#   def initialize(name, age)
#     @name = name
#     @age = age
#   end

#   def to_s
#     "#{name}, #{age}"
#   end
# end

# class Team
#   attr_accessor :name, :members

#   def initialize(name)
#     @name = name
#     @members = []
#   end

#   def <<(person)
#     members.push person
#   end

#   def +(other_team)
#     temp_team = Team.new("Temporary Team")
#     temp_team.members = members + other_team.members
#     temp_team
#   end

#   def to_s
#     members.each {|member| puts member}
#   end

#   def [](idx)
#     members[idx]
#   end

#   def []=(idx, obj)
#     members[idx] = obj
#   end
# end

  
# cowboys = Team.new("Dallas Cowboys")
# cowboys << Person.new("Troy Aikman", 48)
# cowboys << Person.new("Emmitt Smith", 46)
# cowboys << Person.new("Michael Irvin", 49)

# #p cowboys.members # object team
# #puts cowboys[1] #undefined method

# niners = Team.new("San Francisco 49ers")
# niners << Person.new("Joe Montana", 59)
# niners << Person.new("Jerry Rice", 52)
# niners << Person.new("Deion Sanders", 47)

# dream_team = cowboys + niners
# dream_team.name = "Dream Team"

# puts dream_team[4]
# dream_team[5] = Person.new("JJ", 72)

# puts dream_team

module Describable
  def describe_shape
    "I am a #{self.class} and have #{self.class::SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
  # def sides
  #   SIDES
  # end
end

class Square < Quadrilateral; end

puts Square.sides # => 4
puts Square.new.sides # => 4
puts Square.new.describe_shape # => "I am a Square and have 4 sides."