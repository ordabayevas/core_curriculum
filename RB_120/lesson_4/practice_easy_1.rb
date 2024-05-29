# 1
Which of the following are objects in Ruby? If they are objects, 
how can you find out what class they belong to?

true
"hello"
[1, 2, 3, "happy days"]
142

All of them. #class

# 2
If we have a Car class and a Truck class and we want to be able to go_fast, 
how can we add the ability for them to go_fast using the module Speed? 
How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Include Speed. call for car.go_fast

# 3
In the last question we had a module called Speed which contained 
a go_fast method. We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

>> small_car = Car.new
>> small_car.go_fast
I am a Car and going super fast!

First Ruby searches for Car class instance method, then it is searches for module. 
Then implements the method like if it was in the class Car, and calls self.class
which is equal to small_car.class which is Car.

# 4
If we have a class AngryCat how do we create a new instance of this class?

The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

AngryCat.new

# 5
Which of these two classes would create objects that would have an instance 
variable and how do you know?

  class Fruit
    def initialize(name)
      name = name
    end
  end
  
  class Pizza
    def initialize(name)
      @name = name
    end
  end

class Pizza. Instance variables have dog sign in the word.

# 6
What is the default return value of to_s when invoked on an object? 
Where could you go to find out if you want to be sure?

Default return value is object id 
Go tot the object's class

# 7
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

You can see in the make_one_year_older method we have used self. 
What does self refer to here? 

Refers to calling object.

# 8
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

self is the class name

# 9
class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

Bag.new('blue', 'leather')