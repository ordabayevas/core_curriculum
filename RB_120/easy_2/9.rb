# module Walkable
#   def walk
#     "#{name} #{gait} forward"
#   end
# end

# class Noble
#   def name
#     @title + ' ' + @name
#   end

#   include Walkable

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end

#   private

#   def gait
#     "strut"
#   end
# end

# class Person
#   attr_reader :name
#   include Walkable

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Cat
#   attr_reader :name
#   include Walkable

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   attr_reader :name
#   include Walkable

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "runs"
#   end
# end

# byron = Noble.new("Byron", "Lord")
# puts byron.walk

# Further Exploration

class Animals
  attr_reader :name

  def walk
    "#{name} #{gait} forward"
  end

  def initialize(name)
    @name = name
  end
end

class Person < Animals
  private

  def gait
    "strolls"
  end
end

class Noble < Person
  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    @title + ' ' + super
  end

  private

  def gait
    "strut"
  end
end

class Cat < Animals
  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  private

  def gait
    "runs"
  end
end


byron = Noble.new("Byron", "Lord")
puts byron.walk
# => "Lord Byron strut forward"

mike = Person.new("Mike")
puts mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
puts kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
puts flash.walk
# => "Flash runs forward"