require 'pry'
require 'pry-byebug'

# 1. Example from article.

# Given the following classes, implement the necessary methods to get the expected output.
# class DataBase
#   attr_reader :things
#   def initialize
#     @things = []
#   end

#   def <<(other)
#     if things.none? {|student| student.id == other.id }
#       self.things << other
#     end
#   end

#   def show_things
#     things.each do |student|
#       puts "A Student: #{student.name}"
#     end
#   end
    
# end

# class Student
#   attr_reader :id, :name

#   def initialize(name, id)
#     @name = name
#     @id = id
#   end

#   def ==(other)
#     self.id == other.id
#   end
# end

# jill1 = Student.new('Jill', 12345)
# jill2 = Student.new('Jill', 67890)
# jill3 = Student.new('Jill', 12345)

# p jill1 == jill2              # false => jill1.==(jill2) => #== method is defined in BasicObject class, which is common for all classes
# p jill1 == jill3              # true

# kids = DataBase.new

# kids << jill1
# kids << jill2
# kids << jill3               # => That student is already in the database

# kids.show_things
#   # => A Student: Jill
#   # => A Student: Jill

# The concept demonstrated here is the fake operators.

# ================================================================

# 2. Problem by Natalie Thompson
# class Person
#   def initialize(name, job)
#     @name = name
#     @job = job
#   end

#   def to_s; "My name is #{@name} and I am a #{@job}"; end
# end

# roger = Person.new("Roger", "Carpenter")
# puts roger

# Add 1 line of code for the person class
# and 1 line of code in the initalize method. 

# Other than that don't change Person.

# Output:
# "My name is Roger and I am a Carpenter"

# ================================================================

# 3. Problem received from Raul Romero
# class Human 
#   attr_reader :name

#   def initialize(name="Dylan")
#     @name = name
#   end

#   def hair_colour(colour)
#     "Hi, my name is #{name} and I have #{colour} hair."
#   end

#   def self.hair_colour(colour)
#     if colour.empty?
#       colour = 'blonde'
#     end

#     "Hi, my name is Dylan and I have #{colour} hair."
#   end
# end

# puts Human.new("Jo").hair_colour("blonde")  
# # Should output "Hi, my name is Jo and I have blonde hair."

# puts Human.hair_colour("")              
# # Should "Hi, my name is Dylan and I have blonde hair."

# ================================================================

# 4. Problem received from Raul Romero
class Human  
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def equal?(other)
    name == other.name
  end

  def +(other)
    "anna" + other.name
  end
end

gilles = Human.new("gilles") 
anna = Human.new("gilles") 

puts anna.equal?(gilles) # should output true
puts anna + gilles # should output annagilles

# ================================================================

# 5. Describe what the code below outputs and why from Joseph Ochoa

# module Attackable
#   def attack
#     "attacks!"
#   end
# end

# class Characters
#   attr_accessor :name, :characters 
  
#   def initialize(name) 
#     #
#     self.name 
#     @characters = [] 
#   end
  
#   def display
#     name
#   end
  
#   protected 
#   attr_reader :name
#   attr_writer :name
# end

# class Monster < Characters
#   include Attackable
  
#   def initialize(name)
#     super
#   end
# end

# class Barbarian < Characters
#   def ==(other)
#     if(super.self == super.self) # 
#       super.self == super.self
#     end
#   end
# end

# conan = Barbarian.new('barb') # 
# rob = Monster.new('monst')
# conan.characters << rob # [Monster.new('monst')]
# p conan.display

# On line 180 we initialize object of Barbarian and passed the 'barb' as an argument.
# But we didin't bind this information to instance variable. So we do not have a connection bertween
# argument and 'name' method.
# Inside the 'initialize' method we actually instanciated 'name' instance variable, but
# did not assign to argument. So if variable was not assigned to anything it points to nil.

# ================================================================

# 6. From Joseph Ochoa
# give class Barbarian the functionality of the Monster instance attack method:
  # If you used class inheritance, now try doing it without class inheritance directly.
  # If you used modules, now try not using modules
  # If you used duck typing, now don't use duck typing 

  # class Barbarian
  #   def initialize
  #     @my_monster = Monster.new
  #   end
  
  #   def fight
  #     @my_monster.attack
  #   end
  # end
  
  # b = Barbarian.new
  # puts b.fight  # Still outputs "attacks!"

# ================================================================

# 7. Without adding any methods below, implement a solution; originally by Natalie Thompson, 
# this version by Oscar Cortes
# class ClassA 
#   attr_reader :field1, :field2
  
#   def initialize(num)
#     @field1 = "xyz"
#     @field2 = num
#   end
# end

# class ClassB 
#   attr_reader :field1

#   def initialize
#     @field1 = "abc"
#   end
# end

# obj1 = ClassA.new(50)
# obj2 = ClassA.new(25)
# obj3 = ClassB.new

# p obj1.field2 > obj2.field2
# p obj2.field1 > obj3.field1

# ========================================================================
# 8. Unknown
# class BenjaminButton 
  
#   def initialize
#   end
  
#   def get_older
#     self.appearance_age = appearance_age - 1
#     self.actual_age += 1
#   end
  
#   def look_younger
#   end
  
#   def die
#     loop do
#       break if actual_age == 100
#       get_older
#     end

#     self.appearance_age = appearance_age - 1
#   end
# end

# class BenjaminButton
#   attr_accessor :actual_age, :appearance_age

#   def initialize
#     @actual_age = 0
#     @appearance_age = 100
#   end
# end

# benjamin = BenjaminButton.new
# p benjamin.actual_age # => 0
# p benjamin.appearance_age # => 100

# benjamin.actual_age = 1
# p benjamin.actual_age

# benjamin.get_older
# p benjamin.actual_age # => 2
# p benjamin.appearance_age # => 99

# benjamin.die
# p benjamin.actual_age # => 100
# p benjamin.appearance_age # => 0

# ========================================================================

# 9. Originally by Natalie Thompson, this version by James Wilson
# class Wizard
#   attr_reader :name, :hitpoints
  
#   def initialize(name, hitpoints)
#     @name = name
#     @hitpoints = hitpoints
#   end  
  
#   def fireball
#     "casts Fireball for 500 damage!"
#   end
  
# end

# class Summoner < Wizard
#   attr_reader :souls
  
#   def initialize(name, hitpoints)
#     super
#     @souls = []
#   end
  
#   def soul_steal(character)
#     @souls << character
#   end
# end

# gandolf = Summoner.new("Gandolf", 100)
# p gandolf.name # => "Gandolf"

# valdimar = Wizard.new("Valdimar", 200)
# p valdimar.fireball #=> "casts fireball for 500 damage!"

# p gandolf.hitpoints #=> 100

# p gandolf.soul_steal(valdimar) #=> [#<Wizard:0x000055d782470810 @name="Valdimar", @hitpoints=200>]

# p gandolf.souls[0].fireball #=> "casts fireball for 500 damage!"

# ========================================================================

# 10. LS Man...legend says LS Man first appeared in SPOT.
module Flightable
  def fly
    "I am #{@name}, I am a superhero, and I can #{ability.description}!"
  end
end

class Superhero    
  attr_accessor :ability
  include Flightable
  
  def self.fight_crime
    lsman = self.new(self)
    puts "I am #{self}!"
    lsman.announce_ability
  end
  
  def initialize(name)
    @name = name
    @ability = Ability.new('fly')
  end
  
  def announce_ability
    puts "I fight crime with my #{ability.description} ability!"
  end
end

class LSMan < Superhero
  def initialize(name)
    super
    @ability = Ability.new('coding skills')
  end
end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

superman = Superhero.new('Superman')

p superman.fly # => I am Superman, I am a superhero, and I can fly!

LSMan.fight_crime 
=> I am LSMan!
=> I fight crime with my coding skills ability!

# ========================================================================

# 11
# class Rectangle
#   include Comparable
#   attr_reader :width, :height

#   def initialize(width, height)
#     @width = width
#     @height = height
#   end

#   def area
#     width * height
#   end

#   def <=>(other)
#     area <=> other.area
#   end
# end

# rect1 = Rectangle.new(6, 4)
# rect2 = Rectangle.new(5, 5)

# p rect2 > rect1 # true
# p rect1 < rect2 # true

# What would happen if we ran this code now? Why? 
# How do we fix it? 

# Error happens because even if we included Comparable module and defined '<=>' method,
# we didn't provide the body of this method. Means we didn't define what to compare.
# '<=>' is a fake operator, and should be customized for every new class. When we define
# '<=>' means we defined all comparison 'fake operators'.
# Thus to fix it we need to define the body for this method, assuming that for 'true' outputs
# we need to compare areas.

class Parent
  def hello(subject="World")
    puts "Hello, #{subject}"
  end
end

class Child < Parent
  def hello(subject)
    super
    puts "How are you today?"
  end
end

child = Child.new
child.hello('Bob')
# What will be output if we run this code?
# How can we get it to output the following?
# Hello, Bob
# How are you today?

# The output will be "How are you today?". Because we invoked the method that in Child class
# directly. Even if this method takes an argument, it does not uses it.
# Since we have the same method name with desired implementation, we can inherit it with
# keyword 'super' without any parenthesis.

# ========================================================================

module Chageable
  def change_color(new_color)
	  @color = new_color
    "Color changed!"
  end
end

module Movable
	def move
		'Moving!'
	end
end

class Car
  include Changeable
  include Movable

  def initialize(car_color)
	  @color = car_color
  end
end

class Girl
	include Changeable
	include Movable
	
	def initialize(hair_color)
		@color = hair_color
	end
end

# ========================================================================

# class IceCreamScoop
#   @@total_scoops = 0

#   def initialize(flavor, double=false)
#     @flavor = flavor
#     @double = double
#     @@total_scoops += 1
#     update_total_scoops
#   end

#   def make_it_a_double_scoop
#     self.double = true
#     update_total_scoops
#   end

#   def self.total_scoops
#     @@total_scoops
#   end

#   private

#   attr_accessor :double

#   def update_total_scoops
#     @@total_scoops += 1 if double == true
#   end
# end

# my_scoops = IceCreamScoop.new('strawberry')
# my_scoops.make_it_a_double_scoop
# p IceCreamScoop.total_scoops # 2