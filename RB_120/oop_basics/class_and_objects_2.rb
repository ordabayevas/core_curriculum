# Ex_1
# class Cat
#   def self.generic_greeting
#     puts "Hello! I'm a cat!"
#   end
# end

# kitty = Cat.new
# Cat.generic_greeting # Hello! I'm a cat!
# kitty.class.generic_greeting # kitty.class returns Cat

# Ex_2
# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def rename(new_name)
#     self.name = new_name
#   end
# end

# kitty = Cat.new('Sophie')
# puts kitty.name
# kitty.rename(new_name) => kitty.name = new_name => @name = new_name
# kitty.rename('Chloe')
# puts kitty.name

# Ex_3
# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def identify
#     self
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.identify 

# Ex_4
# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def self.generic_greeting
#     puts "Hello! I'm a cat!"
#   end

#   def personal_greeting
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')

# Cat.generic_greeting
# kitty.personal_greeting

# Ex_5
# class Cat
#   @@total = 0

#   def initialize
#     @@total += 1
#   end

#   def self.total
#     puts @@total
#   end
# end

# kitty1 = Cat.new
# kitty2 = Cat.new
# Cat.total

# Ex_6
# class Cat
#   COLOR = 'purple'
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name} and I'm a #{COLOR} cat!!"
#   end
# end


# kitty = Cat.new('Sophie')
# kitty.greet

# Ex_7
# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     "I'm #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# puts kitty

# Ex_8
# class Person
#   attr_accessor :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# puts person1.secret # Shh.. this is a secret!

# Ex_9
# class Person
#   attr_writer :secret

#   def share_secret
#     puts secret
#   end

#   private

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# person1.share_secret

# Ex_10
# class Person
#   attr_writer :secret

#   def compare_secret(person2)
#     secret == person2.secret
#   end

#   protected

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'

# person2 = Person.new
# person2.secret = 'Shh.. this is a different secret!'

# puts person1.compare_secret(person2)

class MeMyselfAndI
  self

  def self.me
    self
  end

  def myself
    self
  end
end

p i = MeMyselfAndI.new

