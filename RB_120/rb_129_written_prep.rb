# 1
# What is output and why? What does this demonstrate about instance 
# variables that differentiates them from local variables?
# class Person
#   attr_reader :name
  
#   def set_name
#     @name = 'Bob'
#   end
# end

# bob = Person.new
# p bob.set_name
# p bob.name

# The output is nil.
# On line 12 we instantiated object of Person class and assign it to variable `bob`.
# attr_reader :name is a shortcut of a getter variable which displays the value of instance variable.
# since @name wasn't initialized inside the constructor method, the value of @name is nil.
# because it wasn't assigned to anything yet. To assign it to 'Bob', we need to call for 
# set_name instance method.
# Instance variables are tied to a specific instance of a class. This means that 
# their values are kept throughout the lifetime of that instance, and they can be 
# accessed by any method within the class. 
# Local variables are limited in scope to the block of code in which they are declared. 
# Typically, they exist only within a method or a loop, and they are not accessible 
# outside of that block or method. This means that once the execution leaves the block 
# or method where the local variable is defined, the local variable is destroyed, and 
# its value is lost unless it's explicitly returned or passed on.
# This demonstrates that instance variables are meant for storing data that needs 
# to persist for the life of an object, differentiating them from local variables, 
# which are temporary and scope-bound.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 2
# What is output and why? What does this demonstrate about instance variables?

# module Swimmable
#   def enable_swimming
#     @can_swim = true
#   end
# end

# class Dog
#   include Swimmable

#   def swim
#     "swimming!" if @can_swim
#   end
# end

# teddy = Dog.new
# p teddy.swim

# The output is nil.
# On line 53 we instanciated new object of Dog class and assigned to 'teddy'.
# On the next line we call for instance method of Dog class 'swim' on 'teddy'. Inside this 
# method we put the condition which calls for instance variable of module Swimmable.
# @can_swim returns nil because method wasn't called, so @can_swim wasn't assigned yet.
# nil is falsy, that is why condition is not true and since if wasn't implemented it returns
# nil.
# we need to call enable_swimming first to instantiate @can_swim.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 3
# What is output and why? What does this demonstrate about constant scope? 
# What does `self` refer to in each of the 3 methods above?

# module Describable
#   def describe_shape
#     "I am a #{self.class} and have #{SIDES} sides."
#   end
# end

# class Shape
#   include Describable

#   def self.sides
#     self::SIDES
#   end
  
#   def sides
#     self.class::SIDES
#   end
# end

# class Quadrilateral < Shape
#   SIDES = 4
# end

# class Square < Quadrilateral; end

# p Square.sides 
# p Square.new.sides 
# p Square.new.describe_shape

# The output is 4, 4 and error.
# On line 92 we call class method 'sides' on Square class. Inside the Square class we do not see 
# method 'sides', so we look for superclass of Square which is Quadrilateral. We couldn't find it there 
# So we go to it's superclass Shape and search there. here we find class method 'sides'. 
# Inside the method only one line which calls for SIDES constant in self. Self here is the 
# initial calling class - Square. We search in Square for constant and it's not there and go up to Quadrilateral.
# In Quadrilateral we find constant Sides which is 4. And this outputs first.

# Next we call for instance method 'sides' on object of Square class. Again we do not find 
# it in class Square and go to search in Quadrilateral. We do not find it in Quadrilateral 
# and go up further searching in Shape. We find it in Shape. Inside of the method we again refer 
# to constant SIDES in self.class. Self here is calling object Square.new, class of this object is
# is Square. We repeat out method lookup and find constant in Quadrilateral. And it outputs 4.

# Lastly, we call for instance method describe_shape on instance of Square. We look again
# in Square->Quadrilateral->Shape and inside the shape we find the module Describable which includes 
# the describe_shape method. Inside of the method we see string interpolation which calls for
# self.class which is Square and constant Sides. But we do not pass lookup path for this 
# constant and ruby searches for this constant inside the module. Since it is not there
# it throws an error 'Uninitialized constant'.
# Constant can be inhereted from superclass.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 4
# What is output? Is this what we would expect when using `AnimalClass#+`? 
# If not, how could we adjust the implementation of `AnimalClass#+` to be more in 
# line with what we'd expect the method to return?

# class AnimalClass
#   attr_accessor :name, :animals
  
#   def initialize(name)
#     @name = name
#     @animals = []
#   end
  
#   def <<(animal)
#     animals << animal
#   end
  
#   def +(other_class)
#     animals + other_class.animals
#   end
# end

# class Animal
#   attr_reader :name
  
#   def initialize(name)
#     @name = name
#   end
# end

# mammals = AnimalClass.new('Mammals')
# mammals << Animal.new('Human')
# mammals << Animal.new('Dog')
# mammals << Animal.new('Cat')
# #p mammals

# birds = AnimalClass.new('Birds')
# birds << Animal.new('Eagle')
# birds << Animal.new('Blue Jay')
# birds << Animal.new('Penguin')

# some_animal_classes = mammals + birds

# p some_animal_classes

# The output is array of Animal class objects.
# We have two similar names of two different classes AnimalClass and Animal. They do not correlated.

# On line 152 we instantiated AnimalClass class object with string argument 'mammals' and assigned to 'mammals'.
# Inside the class the argument binds to @name variable.

# Next we instantiated the Animal object with argument 'Human'. Argument binds to @name variable and can be accessed
# through getter method. We call shovel method which defined inside AnimalClass we add
# this animal object to mammals. Every AnimalClass object has @animals array obj. Shovel operator by definition
# adds everything that passed in to the @animals array. So Animal object with argument 'Human'
# added to @animals of mammals variable's object.
# The same repeats with Animal.new('Dog') and Animal.new('Cat').

# We again instanciated obj of AnimalClass and assigned to birds. Then we added to @animals
# array 3 objects of Animal class -> Animal.new('Eagle'), Animal.new('Blue Jay'), Animal.new('Penguin').

# On line 163 we call for + method on AnimalClass objects -> mammals and birds.
# By definition it adds two @animal arrays and returns in a new array.
# When we define + method to add two objects we expect as a result the new object of the same class.
# In our case we add mammals and birds that AnimalClass objects. The output should be the AnimalClass
# object with combined @animals array from both objects.

  # def +(other_class)
  #   combined = AnimalClass.new("#{self} and #{other_class}")
  #   combined.animals = animals + other_class.animals
  #   combined
  # end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 5
# We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches tall.”` 
# Why does our `change_info` method not work as expected?

# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#   end

#   def change_info(n, h, w)
#     name = n
#     height = h
#     weight = w
#   end

#   def info
#     "#{name} weighs #{weight} and is #{height} tall."
#   end
# end

# sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info # => Spartacus weighs 10 lbs and is 12 inches tall.

# We instantiated  GoodDog class object and assigned to sparky. We passed name, height and weight as string objects.
# We then call for sparky.change_info method and passed another arguments to reassign the
# initial values. But on line 223 the output didn't changed.
# This is because we need to add self to set the values.
# def change_info(n, h, w)
#   self.name = n
#   self.height = h
#   self.weight = w
# end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 6

# In the code above, we hope to output `'BOB'` on `line 16`. 
# Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`? 

# class Person
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
  
#   def change_name
#     name = name.upcase
#   end
# end

# bob = Person.new('Bob')
# p bob.name 
# p bob.change_name
# p bob.name

# Firstly we passed name Bob and then want to change it to all uppercase letters.
# For this we need to reassign value of name, i.e. set a new value. 
However we didn't pass self before name and ruby recognizes it like a local variable of
change_info method. This is a variable shadowing. Even if name.upcase returns right value BOB
it assigned to name local variable, which is locked inside the method.
# For setting name we need to refer the name method with self, which is calling object.
#   def change_name
#     self.name = name.upcase
#   end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 7
# What does the code above output, and why? What does this demonstrate about class 
# variables, and why we should avoid using class variables when working with inheritance?

# class Vehicle
#   @@wheels = 4

#   def self.wheels
#     @@wheels
#   end
# end

# p Vehicle.wheels # 4   

# class Motorcycle < Vehicle
#   @@wheels = 2
# end

# p Motorcycle.wheels # 2          
# p Vehicle.wheels # 2

# class Car < Vehicle; end

# p Vehicle.wheels # 2
# p Motorcycle.wheels # 2                 
# p Car.wheels # 2

# The superclass and subclass have the shared scope for class variables. And in our case 
# it was initialized in superclass Vehicle, but then was reassigned in Motorcycle.
# The specific about class variables that class has only one copy and once it was initialized,
# it can be reassigned from everywhere and it will affect on your expecting result.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 8
# What is output and why? What does this demonstrate about `super`?

# class Animal
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# class GoodDog < Animal
#   def initialize(color)
#     super
#     @color = color
#   end
# end

# bruno = GoodDog.new("brown")       
# p bruno

# The output is GoodDog class object with @name = brown and @color =brown.
# When inside the initialize method of GoodDog class we call for super we called for
# initialize method in Animal. Since we didn't specified the argument for super it inherits all
# given arguments which is in our case is 'brown' that bound to 'color' parameter.
# Thus initialize method in Animal also takes 1 argument and binds 'brown' to @name.
# Then 'brown' as parameter color is passed to @color variable.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 9
# What is output and why? What does this demonstrate about `super`? 

# class Animal
#   def initialize
#   end
# end

# class Bear < Animal
#   def initialize(color)
#     super
#     @color = color
#   end
# end

# bear = Bear.new("black")  
# p bear

# The output is an error.
# When we initialized object of Bear class we passed 'black' as an arument and bind to color parameter.
# Inside the method we call for super and didn't specify the argument, thus all args are
# passed to initialize method of Animal superclass. But initialize in Animal does not accept
# any args. And we passed one. This is the reason of raising error.
# To not pass any arg we should define empty brackets after super -> super()

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 10
# What is the method lookup path used when invoking `#walk` on `good_dog`?

# module Walkable
#   def walk
#     "I'm walking."
#   end
# end

# module Swimmable
#   def swim
#     "I'm swimming."
#   end
# end

# module Climbable
#   def climb
#     "I'm climbing."
#   end
# end

# module Danceable
#   def dance
#     "I'm dancing."
#   end
# end

# class Animal
#   include Walkable

#   def speak
#     "I'm an animal, and I speak!"
#   end
# end

# module GoodAnimals
#   include Climbable

#   class GoodDog < Animal
#     include Swimmable
#     include Danceable
#   end
  
#   class GoodCat < Animal; end
# end

# good_dog = GoodAnimals::GoodDog.new
# p good_dog.walk

# puts GoodAnimals::GoodDog.ancestors
# The method lookup path is:
# GoodAnimals::GoodDog -> Danceable -> Swimmable -> Animal -> Walkable

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 11

# What is output and why? How does this code demonstrate polymorphism? 

# class Animal
#   def eat
#     puts "I eat."
#   end
# end

# class Fish < Animal
#   def eat
#     puts "I eat plankton."
#   end
# end

# class Dog < Animal
#   def eat
#      puts "I eat kibble."
#   end
# end

# def feed_animal(animal)
#   animal.eat
# end

# array_of_animals = [Animal.new, Fish.new, Dog.new]
# array_of_animals.each do |animal|
#   feed_animal(animal)
# end

# The output is I eat.
                # I eat plankton.
                # I eat kibble.
# On line 443 we initialize the array with 3 objects of classes: Animal, Fish, Dog.
# Next we loop over this array and pass every object as argument to feed_animal method.
# feed_animal method calls for method 'eat' on every object. Since all objects have this method inside the
# class it implements for every object.
# Here different class objects respond to one polymorphic method 'feed_animal(animal)'.
# it shows that despite the actual object types, they all can be treated through the same 
# interface (eat), showcasing polymorphism.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 12
# We raise an error in the code above. Why? What do `kitty` and `bud` represent 
# in relation to our `Person` object?
# class Person
#   attr_accessor :name, :pets

#   def initialize(name)
#     @name = name
#     @pets = []
#   end
# end

# class Pet
#   def jump
#     puts "I'm jumping!"
#   end
# end

# class Cat < Pet; end

# class Bulldog < Pet; end

# bob = Person.new("Robert")

# kitty = Cat.new
# bud = Bulldog.new

# bob.pets << kitty
# bob.pets << bud                     

# bob.pets.jump

# The output is error because the return value of bob.pets is an array object with kitty and bud.
# Since the array does not have method 'jump' it throws an error.
# To fix the problem we need to iterate over array and give every object to 'jump' method.
# bob.pets.each {|pet| pet.jump}

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 13
# What is output and why?

# class Animal
#   def initialize(name)
#     @name = name
#   end
# end

# class Dog < Animal
#   def initialize(name); end

#   def dog_name
#     "bark! bark! #{@name} bark! bark!"
#   end
# end

# teddy = Dog.new("Teddy")
# puts teddy.dog_name  

# The output is "bark! bark! bark! bark!" because @name is nil.
# When we passed an argument 'Teddy' to `initialize` method in class Dog, we didn't save it
# to instance variable. THen we called `dog_name` method on `teddy` where inside the method
# we call for @name instance variable. Since we didn't specified this variable in class Dog
# it will search in Animal superclass. We found @name in Animal's `initialize` method, but we
# override `initialize` method for Dog class. This is why Animal's `initialize` method wasn't
# assigned to anything and it is still `nil`.


# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 14
# In the code above, we want to compare whether the two objects have the same name. 
# `Line 11` currently returns `false`. How could we return `true` on `line 11`? 

# Further, since `al.name == alex.name` returns `true`, does this mean the `String` 
# objects referenced by `al` and `alex`'s `@name` instance variables are the same object? 
# How could we prove our case?

# class Person
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end
# end

# al = Person.new('Alexander')
# alex = Person.new('Alexander')
# p al.name == alex.name # => true
# p al === alex

# The last line of code compares two different objects id's if they are the same. This is the reason for false.
# Since `al` and `alex` are both objects of class Person but have different id, they are not 
# the same obj. We didn't specified `==` method in our class. Thus it uses the default 
# implementation which is the equivalent for method `equal?` and compares if two objects the same?

# To return true we need to refer for `al.name` and `alex.name` with `==` method. 
# Then it will check for 'Alexander' == 'Alexander' and returns true because the implementation
# for String objects is specified. It only checks for values equality.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 15
# What is output on `lines 14, 15, and 16` and why?

# class Person
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     "My name is #{name.upcase!}."
#   end
# end

# bob = Person.new('Bob')
# puts bob.name
# puts bob
# puts bob.name

# The outputs are: Bob, My name is BOB., BOB
# Firstly, we call the method `name` on `bob` object. And since we do have accessor method for
# this method, we fetch 'Bob'.
# Secondly, we call for method `puts` and pass just `bob` object itself. We defined our own to_s
# method, that is why it calls for value of method `name`, which is 'Bob' and invokes the destructive
# method `upcase!` it affected on passed argument itself.
# This is the reason for the third output 'BOB'.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 16
# Why is it generally safer to invoke a setter method (if available) vs. 
# referencing the instance variable directly when trying to set an instance variable 
# within the class? Give an example

# Using setter method gives us more room for additional features. 
# 1. We may want to use only part of the information or change before setting.

# 2. Also it is easier to debug, and change the way we want store information.
# Only the setter method needs to be updated, not the numerous places the variable 
# might be set directly.
# class Person
#   attr_reader :full_name, :first_name

#   def initialize(full_name)
#     @full_name = full_name
#   end

#   def first_name
#     @first_name = full_name.split(' ')[0]
#   end
# end

# lisa = Person.new ('Lisa Dobberteen')
# puts lisa.first_name

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 17
# Give an example of when it would make sense to manually write a custom getter 
# method vs. using `attr_reader`.

# We can use directly the instance variable to retrieve the value, but using 
# getter method allow us to process the raw data to easier the further using.
# Ex 1
# class BankAccount
#   def initialize(balance)
#     @balance = balance
#   end

#   def balance
#     @balance.to_f
#   end
# end

# account = BankAccount.new(1000)
# puts account.balance

# Ex 2
# class Rectangle
#   def initialize(width, height)
#     @width = width
#     @height = height
#   end

#   def area
#     @width * @height
#   end
# end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 18
# What can executing `Triangle.sides` return? What can executing `Triangle.new.sides` 
# return? What does this demonstrate about class variables?
# class Shape
#   @@sides = nil

#   def self.sides
#     @@sides
#   end

#   def sides
#     @@sides
#   end
# end

# class Triangle < Shape
#   def initialize
#     @@sides = 3
#   end
# end

# class Quadrilateral < Shape
#   def initialize
#     @@sides = 4
#   end
# end

# puts Triangle.sides # => nil
# puts Triangle.new.sides # => 3

# the first output is nil. When we invoke 'sides' class method on Triangle, we didn't 
# initialized the instance, therefore @@sides is nil yet. We go up to the superclass
# and find 'sides' class method which calls for @@sides class variable which is nil.

# The second output is 3. Because this time we initialized new instance of triangle, thus 
# @@sides assigned to 3. And then in instance method of Shape it returns the @@sides value.

# It tells us about that class variables share scope within superclass and subclasses.
# Using class variables like @@sides in a superclass shared by different subclasses 
# (like Triangle and Quadrilateral) can lead to unintended side effects and 
# hard-to-track bugs. This is because the value of @@sides can be altered by any 
# instance of any subclass, affecting all other instances of the superclass and 
# its other subclasses.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 19
# What is the `attr_accessor` method, and why wouldn’t we want to just add 
# `attr_accessor` methods for every instance variable in our class? Give an example.

# `attr_accessor` method is a shorthand representation of getter and setter methods of instance
# variable. It takes an argument as a symbol version of instance variable.
# We do not want to expose all information about internal object's state and not only 
# give full access to all object's states, but also changing them from outside of the class.

# class Citizen
#   attr_reader :name
#   attr_accessor :address

#   def initialize(name, id, address)
#     @name = name
#     @id = id
#     @address = address
#   end
# end

# joe = Citizen.new("Joe")
# joe.name

# In this example we want name and address to be accessed, but name shouldn't be
# changed from the outside, while address can be changed by sitizen itself.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 20
# What is the difference between states and behaviors?

# The state of the object is it's characteristics like name, color, age, weight and etc.
# The behavior is what object can do, it's functionality like vehicle rides, fish swims and etc.
# The data of every object's state can vary, while behavior will be the same.
# All vehicles ride, but they can have different models.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 21
# What is the difference between instance methods and class methods?

# The instance methods are methods that can be called only on instance of some class.
# The class methods are called on class and we do not have to instantiate the object.
# When defining class method we shoulf always prepend self.

# We can have class Employee which has class methods like total employees. And we can have
# every object which represents one separate employee and he has own methods like position, 
# job responsibilities.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 22
# What are collaborator objects, and what is the purpose of using them in OOP? 
# Give an example of how we would work with one.

# While creating new class we use objects of other class objects. For example,
# creating Person class uses string objects for defining it's name or integer to define the age.
# It calls collaborators objects. Collaborators can be from Ruby built-in classes or
# from customized classes too, like we used Desk class in Tic Tac Toe class.
# They are represents connections between different classes and objects.
# When working on program it is important to consider which colaborators are the best for you.

# class Movie
#   attr_accessor :name, :duration
#   def initialize(n, d)
#     @name = n
#     @duration = d
#   end
# end

# class MovieTheater
#   def initialize
#     @all_shows = []
#   end

#   def add(movie)
#     @all_shows << movie
#   end

#   def shows
#     @all_shows.map {|show| show.name}
#   end
# end

# movie1 = Movie.new('Dune 2', 210)
# movie2 = Movie.new('Inside Out', 90)
# amc = MovieTheater.new
# amc.add(movie1)
# amc.add(movie2)

# puts amc.shows

# In this example the objects of Movie class are collaborators for MovieTheater, and name of the 
# movies are String objects and collaborators to Movie class, and duration of movies is represented
# by integers that collaborator to Movie class.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 23
# How and why would we implement a fake operator in a custom class? Give an example.

# In Ruby we have real operators like ||, && and methods that look like operators like +, ==.

# Fake operators need to be overriden or customizing for every new class, otherwise it will
# raise an error like NoMethodError or will work not in that way you expect.

# class Movie
#   attr_accessor :name, :duration
#   def initialize(n, d)
#     @name = n
#     @duration = d
#   end
# end

# class MovieTheater
#   def initialize
#     @all_shows = []
#   end

#   # def <<(movie)
#   #   @all_shows.push(movie.name)
#   # end

#   def shows
#     puts @all_shows
#   end
# end

# movie1 = Movie.new('Dune 2', 210)
# movie2 = Movie.new('Inside Out', 90)
# amc = MovieTheater.new
# amc << movie1
# amc << movie2

# amc.shows

# In this example we override the `<< ` method. Because if we use it without customizing
# it throws undefined method `<<' for MovieTheater class. To avoid this, we need to direct
# where we want add items and what kind of item.

# When customizing fake operators we should follow the conventions.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 24
# What are the use cases for `self` in Ruby, and how does `self` change based on 
# the scope it is used in? Provide examples.

# `self` can be defined within the class in two scopes: inside the instance variable and 
# outside of the instance variable before class method's name.
# Inside the instance method it uses for referencing to calling object, for example 
# for setting value.
# Outside of the instance method it uses for referencing name of class before class method's name.

# class MovieTheater
#   attr_accessor :duration

#   def initialize(d)
#     @duration = d
#   end

#   def change_duration
#     self.duration = 180
#   end
# end

# amc = MovieTheater.new(120)
# puts amc.change_duration

# class MovieTheater
#   @@total_shows = 0
#   attr_accessor :name

#   def initialize(n)
#     @name = n
#     @@total_shows += 1
#   end

#   def self.total
#     @@total_shows
#   end
# end

# puts MovieTheater.total

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 25
# What does the above code demonstrate about how instance variables are scoped?

# class Person
#   def initialize(n)
#     @name = n
#   end
  
#   def get_name
#     @name
#   end
# end

# bob = Person.new('bob')
# joe = Person.new('joe')

# puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
# puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">

# p bob.get_name # => "bob"

# States of object are information that associated with object and stores with instance variables.
# Here we initialized two objects of the same class, but passed different names.
# Instance variables are created when object is created. With Every object instantiation we create
# new instance variable name, that stores object's name. Thus this information does not lost
# and does not override.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 26
# How do class inheritance and mixing in modules affect instance variable scope? 
# Give an example.

# When a class inherits from another class, it gains access to the methods of the 
# superclass. Instance variables, however, are not inherited directly, but the subclass 
# will have access to any instance variable if it's used by inherited methods or is 
# initialized within the subclass itself. 

# In this example the method 'display_color' was inhereted, and subclass Sedan has an access
# to @color in Vehicle, since it inherits the initialize method too.

# class Vehicle
#   def initialize
#     @color = 'green'
#   end

#   def display_color
#     @color
#   end
# end

# class Sedan < Vehicle
# end

# sedan = Sedan.new
# car = Vehicle.new

# puts car.display_color # => 'green'
# puts sedan.display_color # => 'green'

# Methods defined in a module and included in a class can operate on instance variables as if they were defined in the class.
# Modules do not contain instance variables directly; any instance variables accessed by 
# module methods depend on those variables being appropriately initialized in the class 
# instances.

# module Speeding
#   def accelerate_speed
#     @speed += 10
#   end
# end

# class Vehicle
#   include Speeding

#   attr_reader :speed
  
#   def initialize
#     @speed = 0
#   end
# end

# car = Vehicle.new
# car.accelerate_speed
# puts car.speed

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 27
# How does encapsulation relate to the public interface of a class?

# In terms of protecting data we can hide some information or implementation inside the class.
# For that purpose we can use method access control. Using protected or private methods
# will prevent unwillingly exposing data. 

# class Vehicle
#   attr_reader :model
#   def initialize(plate, model)
#     @plate = plate
#     @model = model
#   end

#   def display
#     puts "The car: #{model}, unique number: ....#{plate.slice(4, 2)}"
#   end

#   private
#   attr_reader :plate
# end

# car = Vehicle.new('123456', 'Kia')
# # car.plate
# car.display
# # puts car.model

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 28
# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age  = a * DOG_YEARS
#   end

#   def to_s
#     @name
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# puts sparky

# What is output and why? How could we output a message of our choice instead?

# The output is the object of class GoodDog with id number.
# To customize what will be the output, we can define our own 'to_s' method.
# When we call puts sparky, we call for sparky.to_s.
# to_s method is a built in to every class in Ruby. By default, the to_s method returns 
# the name of the object's class and an encoding of the object id. 
# And we can override it to return the message by our choice. But we should keep in mind that
# the return value of 'to_s' is the String.
# If it does not return a string, #to_s won't work as expected in places 
# where #to_s is implicitly invoked like puts and interpolation. Instead of 
# printing (or inserting) the value returned by #to_s, Ruby will ignore the 
# non-string value and look in the inheritance chain for another version of 
# #to_s that does return a string. In most cases, it will use the value returned 
# by Object#to_s instead.

# How is the output above different than the output of the code below, and why?

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     @name = n
#     @age  = a * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# p sparky

# When we call 'p sparky' we call for method 'inspect' on 'sparky' object.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 29
# When does accidental method overriding occur, and why? Give an example.

# Accidental method overriding occurs when a method in a subclass or included module 
# has the same name as a method in the superclass or another included module, leading to 
# the original method being replaced without intent. The result can be unexpected behavior, as the original functionality intended 
# by the method in the superclass or one of the modules gets unintentionally hidden or 
# replaced.

# module Emergency
#   def alert
#     "Activating emergency systems!"
#   end
# end

# class Vehicle
#   def alert
#     "General vehicle alert!"
#   end
# end

# car = Vehicle.new
# car.alert # => "General vehicle alert!"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 30

# How is Method Access Control implemented in Ruby? Provide examples 
# of when we would use public, protected, and private access modifiers.

# Access control is a concept present in several programming languages, including 
# Ruby, where it's primarily managed through access modifiers. These modifiers are 
# used to control the visibility of methods within a class, allowing developers to 
# restrict or permit access to certain functionalities depending on the intended scope 
# of usage. In Ruby, this helps ensure that only the appropriate parts of a class are 
# exposed for external interaction, safeguarding the internal logic and promoting 
# encapsulation.

# The way that Method Access Control is implemented in Ruby is through the use of the 
# public, private, and protected access modifiers.

# class Card
#   attr_accessor :number, :type # => public interface

#   def initialize(number, type)
#     @number = number
#     @type = type
#   end
# end

# card = Card.new('1234567890', 'Visa')
# puts card.type # => Visa
# puts card.number # => 1234567890

Sometimes you'll have methods that are doing work in the class but don't need to 
be available to the rest of the program. These methods can be defined as private. 
To define private methods we use the private method call in our program and 
anything below it is private.

# class Card
#   def initialize(number, type)
#     @number = number
#     @type = type
#   end

#   def display_card
#     puts "Use for transaction card: **** **** **** #{card_num.slice(-4, 4)}, #{type}?"
#   end

#   private

#   def card_num
#     @number
#   end

#   def type
#     @type
#   end
# end

# card = Card.new('1234567890', 'Visa')
# card.display_card

# Public and private methods are most common, but in some less common situations, 
# we'll want an in-between approach. For this, we can use the protected method to 
# create protected methods. Protected methods are similar to private methods in 
# that they cannot be invoked outside the class. The main difference between them 
# is that protected methods allow access between class instances, while private methods 
# do not.

# class Card
#   def initialize(number, type, owner)
#     @number = number
#     @type = type
#   end

#   def same_owner?(other_owner)
#     owner == other_owner
#   end

#   protected

#   attr_reader :owner

# end

# card1 = Card.new('1234567890', 'Visa', 'Lisa Dobberteen')
# card2 = Card.new('0987654321', 'MasterCard', 'Lisa Novak')

# puts card1.same_owner?(card2) # false
# puts card1.owner # error

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 31
# Describe the distinction between modules and classes.

Classes are blueprints for creating objects. 
Class holds all information about object: states and behaviors. 
Can instantiate an object.
# Classes support inheritance, allowing one class to inherit the properties and methods of another.

Modules contain only behavior. They cannot instantiate an object.
Modules provide a namespace, helping to prevent name clashes between 
different areas of a program. This is useful when defining methods or constants 
that might have common names but different implementations across various parts of 
an application.
Modules allow for the mixin technique where a module's methods can be added 
to one or more classes. This promotes the DRY (Don't Repeat Yourself) principle 
and helps in composing behaviors.

module Drivable
  def drive
    "Driving the vehicle!"
  end
end

class Car
  include Drivable
  attr_accessor :make

  def initialize(make)
    @make = make
  end
end

# my_car = Car.new("Toyota")
# puts my_car.drive  # "Driving the vehicle!"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 32
# What is polymorphism and how can we implement polymorphism in Ruby? Provide examples.

# Polymorphism is a core concept in object-oriented programming that refers to 
# the ability of different objects to respond to the same method call
# in different ways. In other words, 
# data of different types can respond to a common interface. 
# When two or more object types have a method with the same name, we can invoke that 
# method with any of those objects. When we don't care what type of object is calling 
# the method, we're using polymorphism.

# # In Ruby, a subclass can override a method defined in its superclass. 
# This is a straightforward example of polymorphism where different classes 
# in the same inheritance hierarchy have different implementations of the same 
# method. Polymorphism through inheritance:

# class Animal
#   def speak
#   end
# end

# class Dog < Animal
#   def speak
#     "Bark!"
#   end
# end

# class Cat < Animal
#   def speak
#     "Meow!"
#   end
# end

# class Fish < Animal; end

# def make_animal_speak(animal)
#   puts animal.speak
# end

# dog = Dog.new
# cat = Cat.new
# fish = Fish.new

# make_animal_speak(dog)  # Outputs: Bark!
# make_animal_speak(cat)  # Outputs: Meow!
# make_animal_speak(fish) # nil
# This is a straightforward example of polymorphism where different classes 
# in the same inheritance hierarchy have different implementations of the same method.
 
# If an object can perform an action required by the code (i.e., it responds to 
# the appropriate method call), then it can be used interchangeably with other objects, 
# regardless of their types. Polymorphism through duck typing:

# class Dentist 
#   def clean_teeth
#     puts "Doctor cleanses patient's teeth"
#   end
# end

# class Person
#   def clean_teeth
#     puts 'Cleanses own teeth 2 times per day'
#   end
# end

# def perform_teeth_cleaning(whomever)
#   whomever.clean_teeth
# end

# dentist = Dentist.new
# perform_teeth_cleaning(dentist)

# patient = Person.new
# perform_teeth_cleaning(patient)

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 33

# What is encapsulation, and why is it important in Ruby? Give an example

# Encapsulation restricts direct access to some of an object's components, 
# which means making some of the object's methods and properties private or protected. 
# This prevents external code from directly interacting with the state of the object, 
# enforcing boundaries and promoting more secure and robust code.

# Encapsulation allows a class to maintain a controlled internal state without being 
# altered unexpectedly by external code. It ensures that object data cannot be changed 
# arbitrarily and that all changes must happen through controlled methods.

# class Vehicle
#   attr_reader :model
#   def initialize(plate, model)
#     @plate = plate
#     @model = model
#   end

#   def display
#     puts "The car: #{model}, unique number: ....#{plate.slice(4, 2)}"
#   end

#   private
#   attr_reader :plate
# end

# car = Vehicle.new('123456', 'Kia')
# # car.plate
# car.display
# # puts car.model

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 34
# What is returned/output in the code? Why did it make more sense to use a 
# module as a mixin vs. defining a parent class and using class inheritance?

# module Walkable
#   def walk
#     "#{name} #{gait} forward"
#   end
# end

# class Person
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Cat
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# mike = Person.new("Mike")
# p mike.walk # => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# p kitty.walk # => "Kitty saunters forward"

# Class Person and class Cat are not quite in the same line of inheritance. We can
# technically define superclass Mammals for both of them, but generally they are 
# conceptually different. But both objects have an ability to walk. We should use Module as a mixin
# when two different classes that cannot inherit from each other and does not have a 
# common superclass that makes sense.
# Mixins are ideal for sharing functionality across unrelated classes.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 35
# What is Object Oriented Programming, and why was it created? 
# What are the benefits of OOP, and examples of problems it solves?

# OOP helps manage complexity, which is often the biggest challenge in software 
# development. By breaking down states and behaviors into distinct objects, 
# OOP allows developers to manage and reduce complexity, making it easier to understand, 
# modify, and extend their programs.

# The benefits of OOP are:
# 1) Encapsulation - hides the internal state of data, gives a control for 
# manipulating and transforming data without external exposure. For example, when we work with
# private data like bank account or personal data.
# 2) Polymorphism - is an ability of different objects to respond on the same method invocation.
# In a logistics system, different types of transportation vehicles might be used interchangeably. 
# Each vehicle type (like Truck, Airplane, and Ship) can have its own deliver method, 
# implementing transportation-specific logic.
# 3) Inheritance - to avoid repeated code and save memory and space, to construct
# hierarchical code with clear connections between, we can define parental and subclasses that inherit
# methods.
# In a vehicle management system, you could define a base class Vehicle with properties 
# like fuel_capacity and methods like refuel. Subclasses such as Car, Truck, and 
# Motorcycle could inherit from Vehicle, allowing you to write the refueling code 
# only once in the superclass and share it among all vehicles.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 36

# What is the relationship between classes and objects in Ruby?

# Classes are blueprints for creating an object. We can create an object with method
# #new that built in to every class in Ruby and pass the name of the class and we will
# have an object with defined states and behaviors.
# This includes:

# States: The data properties (often referred to as instance variables) that will hold 
# the state of an object.
# Methods: The behaviors or functionalities that the objects can perform.

# When you define a class, you're not creating an actual object but rather a template 
# for how objects of that class should be constructed and how they should behave.

# Objects are instances of these classes, created with specific attributes and capable of performing defined methods.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 37

# When should we use class inheritance vs. interface inheritance?

The class inheritance is the classic way to inherit behaviors from parental class(superclass)
to subclasses. In that case several subclasses can be inhereted from one superclass.

Interface inheritance is a type of inheritance that uses modules as mixins.

If our data has hierarchical type of construction, like Vehicle and types of Vehicles like 
Motorcycle, Truck, then appropriate type of inheritance is through the classes.
Motorcycle and Truck both have similar characteristics that can be defined as Vehicle common 
characteristics. Vehicle is a transport that can speed up, stop, has mileage, and fuel. All
of this applied to other types of Motorcycle and Trucks.

But if some of the subclasses present a behavior that does not applied to superclass and some 
other subclasses. It makes sense to use just a separate container with behaviors and add them
to classes. For example, Truck has a lifting capability, and let's say boat too. But Vehicle and Motorcycle
does not, just like cars.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 38
# If we use `==` to compare the individual `Cat` objects in the code above, 
# will the return value be `true`? Why or why not? What does this demonstrate about 
# classes and objects in Ruby, as well as the `==` method?

# class Cat
# end

# whiskers = Cat.new
# ginger = Cat.new
# paws = Cat.new

# puts whiskers == ginger # => false

The equality operator is a fake operator. It is a method that has been defined in BasicObject class.
If it does not override in customized class, it will compare the name of the class and their
object id. If they are the same objects, it returns true. It similar to #equal? method.
But most built in classes uses this method to check the equality of two object's classes and their
values, not id.
In this example, it returns false, because we didn't define what we want to compare,
so it will use the default behavior.
To fix that we need to customize it in our Cat class.

# class Cat
#   attr_reader :name
#   def initialize(name)
#     @name = name
#   end

#   def ==(other)
#     self.class == other.class
#     self.name == other.name
#   end
# end

# whiskers = Cat.new('Whiskers')
# ginger = Cat.new('Ginger')
# whiskers2 = Cat.new('Whiskers')

# puts whiskers == ginger
# puts whiskers == whiskers2

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 39
# Describe the inheritance structure in the code above, and identify all the superclasses.

# class Thing
# end

# class AnotherThing < Thing
# end

# class SomethingElse < AnotherThing
# end

# The class Thing is superclass to class AnotherThing, class AnotherThing is superclass
# for SomethingElse. Since SomethingElse inherits behaviors of AnotherThing, and AnotherThing
# is inherited from Thing, SomethingElse inherits from Thing through AnotherThing.
# It similar structure Grandmother -> Daughter -> Granddaughter:
# 'Grandmother' class passes it's behaviors to 'Daughter'. 'Daughter' can inherit 
# all methods or override some pf them. 'Granddaughter' inherits all that in 'Daughter'.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 40

# What is the method lookup path that Ruby will use as a result of the call to the 
# `fly` method? Explain how we can verify this.

# module Flight
#   def fly; end
# end

# module Aquatic
#   def swim; end
# end

# module Migratory
#   def migrate; end
# end

# class Animal
# end

# class Bird < Animal
# end

# class Penguin < Bird
#   include Aquatic
#   include Migratory
# end

# pingu = Penguin.new
# pingu.fly

# Penguin -> Migratory -> Aquatic -> Bird -> Animal -> ...-> error

# puts Penguin.ancestors

# First Ruby searches within the class of Penguin. Inside it finds 2 modules and start to
# search in last added - Migratory module, since it is not there, it goes further to
# Aquatic module. It does not find in this module, and goes to superclass Bird, it is not there.
# Then goes to superclass Animal and it is not there to. Then it searches in common for all classes 
# and objects classes: Object, Kernel, BasicObject. Since there is no places left 
# it throws an error. To check this we can call for ancestors method and pass 
# method calling object's class -> Penguin.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 41

# class Animal
#   def initialize(name)
#     @name = name
#   end

#   def speak
#     puts sound
#   end

#   def sound
#     "#{@name} says "
#   end
# end

# class Cow < Animal
#   def sound
#     super + "moooooooooooo!"
#   end
# end

# daisy = Cow.new("Daisy")
# daisy.speak # Daisy says mooooo

# What does this code output and why?

# new(Cow class) -> initialize(from Animal) -> speak(Animal) -> sound(Cow) -> sound(Animal)

# First we initialized instance of Cow and pass the name 'Daisy'. 'Daisy' then binds to variable
# @name in inherited 'initialize' method from Animal.
# then we call for method 'speak' on daisy.
# 'speak' is also inhereted from Animal, and it calls for method 'sound' inside the Cow.
# 'sound' contains keyword 'super' which refers to the same-named method in Animal.
# 'sound' in Animal class calls for @name instance variable which we bound to 'Daisy'.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 42

# class Cat
#   def initialize(name, coloring)
#     @name = name
#     @coloring = coloring
#   end

#   def purr; end

#   def jump; end

#   def sleep; end

#   def eat; end
# end

# max = Cat.new("Max", "tabby")
# molly = Cat.new("Molly", "gray")

# Do molly and max have the same states and behaviors in the code above? 
# Explain why or why not, and what this demonstrates about objects in Ruby.

# In the provided Ruby code, both max and molly are instances of the Cat class. 
# This means they are both created from the same blueprint (Cat class) and thus 
# inherently share the same behaviors (methods) defined by their class. However, 
# their states (attributes) differ, which is a key concept in object-oriented programming.

# Each instance of a class in Ruby can maintain its unique state. Even though max and 
# molly are both Cat instances, they can have different names and coloring, demonstrating 
# that objects encapsulate their state individually.

# Despite their differences in state, all instances share functionality defined by their class. 


# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 43

# class Student
#   attr_accessor :name, :grade

#   def initialize(name)
#     @name = name
#     @grade = nil
#   end
  
#   def change_grade(new_grade)
#     grade = new_grade
#   end
# end

# priya = Student.new("Priya")
# priya.change_grade('A')
# p priya.grade

# In the above code snippet, we want to return `”A”`. What is actually returned and why? 
# How could we adjust the code to produce the desired result?

# The actual output is nil.
# This is because we must explicitly call calling object before getter method to set a new value.
# Inside the method 'change_grade' we didn't prepend self before 'grade' and Ruby decided that the 'grade'
# is the local variable. And @grade was not reassigned and still points to nil.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 44
# class MeMyselfAndI
#   p self

#   def self.me
#     self
#   end

#   def myself
#     self
#   end
# end

# i = MeMyselfAndI.new
# p MeMyselfAndI.me
# p i.myself

# What does each `self` refer to in the above code snippet?

# First self refers to class name MeMyselfAndI, because it is within the class scope and on class level.
# Second self refers to class name MeMyselfAndI, because it prepends before class method and refers calling object which is class name for class method.
# Third self refers to calling object which is class name MeMyselfAndI, becuase this self is within the class method and the caller of class method is class.
# Fourth self refers to calling object which is instance of MeMyselfAndI, because it located within instance method and the caller of instance method is the instance of class.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 45
# class Student
#   attr_accessor :grade

#   def initialize(name, grade=nil)
#     @name = name
#   end 
# end

# ade = Student.new('Adewale')
# p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">

# Running the following code will not produce the output shown on the last line. 
# Why not? What would we need to change, and what does this demonstrate about instance 
# variables?

# The initialize method in the Student class is designed to accept two parameters: 
# name and grade. However, the implementation of this method only sets the @name 
# instance variable and does not initialize the @grade instance variable with the 
# provided argument. It means 'grade' was not instantiated.
# Since it wasn't instantiated, it's not existed yet.
# To fix that we need to assign in 'initialize' instance variable 'grade'.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 46

# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{@name} is speaking."
#   end
# end

# class Knight < Character
#   def name
#     "Sir " + super
#   end
# end

# sir_gallant = Knight.new("Gallant")
# p sir_gallant.name 
# p sir_gallant.speak

# What is output and returned, and why? What would we need to change so that the 
# last line outputs `”Sir Gallant is speaking.”`? 

# In provided code, we initialized new object Knight and passed the name 'Gallant' as an argument.
# Class Knight inherits the 'initialize' method from Character class.
# Argument 'Gallant' binds to @name.

# Next, we call for method 'name' with created instance. We override the getter method 
# in Knight class and preprend 'Sir' to name. And method 'name' returns the desired output
# 'Sir Gallant'. But the problem is that in 'speak' we call for instance variable @name, not
# the method. To fix that we need to reassign the value of @name or call for getter method.
# The last will be better solution, since we don't need to change the internal state,
# we can just transform value in method and call for getter method everywhere where we want to
# output Sir Gallant.

# def speak
#   "#{name} is speaking."
# end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 47

# class FarmAnimal
#   def speak
#     "#{self.class} says "
#   end
# end

# class Sheep < FarmAnimal
#   def speak
#     super + "baa!"
#   end
# end

# class Lamb < Sheep
#   def speak
#     super + "baaaaaaa!"
#   end
# end

# class Cow < FarmAnimal
#   def speak
#     super + "mooooooo!"
#   end
# end

# p Sheep.new.speak
# p Lamb.new.speak
# p Cow.new.speak

# What is output and why? 

# The outputs:
# "#<Sheep:0x0000000104ce0400> says baa!"
# "#<Lamb:0x0000000104ce01f8> says baa!baaaaaaa!"
# "#<Cow:0x0000000104b0ffb8> says mooooooo!"

# This is because all three classes Sheep, Lamb, Cow use keyword super in 'speak' method.
# Super refers to 'speak' in FarmAnimal. Inside of this method it calls for self.
# Self inside the instance method refers to instantiated object. That is why the object
# and the object id are in output.
# To fix that we should refer to self.class.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 48

# class Person
#   def initialize(name)
#     @name = name
#   end
# end

# class Cat
#   def initialize(name, owner)
#     @name = name
#     @owner = owner
#   end
# end

# sara = Person.new("Sara")
# fluffy = Cat.new("Fluffy", sara)

# What are the collaborator objects in the above code snippet, and what 
# makes them collaborator objects?

# For class Person collaborator is 'Sara' String object.
# And for class Cat collaborators are 'Fluffy' String object and 'sara' Person object.
# Collaborator objects are objects that a class interacts with to perform functions or 
# represent relationships. These objects often make up part of a class's state
# Collaborator objects are used to set or influence the state of another object. 
# In the example, the strings 'Sara' and 'Fluffy' are used to establish names for 
# Person and Cat objects, respectively.
# The Person instance sara serves as a collaborator for the Cat instance 
# fluffy by defining a relationship (ownership).

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 49

# number = 42

# case number
# when 1          then 'first'
# when 10, 20, 30 then 'second'
# when 40..49     then 'third'
# end

# What methods does this `case` statement use to determine which `when` clause 
# is executed?

# Behind the case statement is '===' (threeequal) method. It defines if argument on the right side is
# 'belong' left side argument.
# Here 42 is right side argument, and numbers that follows after when are left side arguments.
# 1) 1 === 42: This checks if 42 is equal to 1. The === operator, when used with integers, 
# behaves like the == operator. This condition is false.
# 2) 10 === 42, 20 === 42, 30 === 42: Similarly, these check if 42 equals 10, 20, or 30. 
# All these conditions are false.
# 3) 40..49 === 42: This is where the === operator shows its utility with range objects. 
# It checks if 42 falls within the range 40..49. This condition is true because 42 is 
# indeed within this range. It returns true and the action under this 'when' is executed.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 50
# class Person
#   TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

#   @@total_people = 0

#   def initialize(name)
#     @name = name
#   end

#   def age
#     @age
#   end
# end

# What are the scopes of each of the different variables in the above code?

# The first variable is constant 'TITLE'. Constants in Ruby, typically written in all uppercase, 
# have lexical scope. They are accessible from within the class, and they can be accessed outside 
# the class via the scope operator (::), such as Person::TITLES.

The second is class variable '@@total_people'. Class variables are shared across the entire class, 
including its instances and subclasses. They are prefixed with @@.
Accessible from both class methods and instance methods. Modifying this variable 
affects all instances because it is shared across the class.

# The third and fourth are instance variables @name and @age. Instance variables are specific to an object 
# (an instance of the class). They are prefixed with @ and each instance of the class 
# maintains its own copy of the instance variable.
# Accessible only within the instance methods of the class where they are defined or 
# manipulated. They are not directly accessible from outside the instance or from class 
# methods unless accessor methods are defined.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 51
# The following is a short description of an application that lets a customer place an order for a meal:

# - A meal always has three meal items: a burger, a side, and drink.
# - For each meal item, the customer must choose an option.
# - The application must compute the total cost of the order.

# 1. Identify the nouns and verbs we need in order to model our classes and methods.
# 2. Create an outline in code (a spike) of the structure of this application.
# 3. Place methods in the appropriate classes to correspond with various verbs.

# Nouns : burger, side, drink, meal, order, total cost, option, customer.
# Verbs : place order, choose option.

# class MealItem
#   def initialize(choice)
#     @choice = choice
#     @price = self.class::OPTIONS[choice]
#   end

#   def price 
#     @price
#   end

#   def choice
#     @choice
#   end
# end

# class Burger < MealItem
#   OPTIONS = {'American' => 5.00, 'Classic' => 3.99, 'Cheeseburger' => 5.50}
# end

# class Side < MealItem
#   OPTIONS = {'Fries' => 2.00, 'Sweet potato' => 2.50, 'Onion rings' => 2.00}
# end

# class Drink < MealItem
#   OPTIONS = {'Pepsi' => 1.89, 'Coke' => 1.89, 'Lemonade' => 1.20}
# end

# class Order 
#   attr_reader :burger, :drink, :side
#   def initialize
#     @burger = nil
#     @drink = nil 
#     @side = nil 
#   end

#   def choose_option
#     puts "Choose a burger option: #{Burger::OPTIONS.keys}"
#     b = gets.chomp
#     @burger = Burger.new(b)
#     puts "Choose a side option: #{Side::OPTIONS.keys}"
#     s = gets.chomp
#     @side = Side.new(s)
#     puts "Choose a drink option: #{Drink::OPTIONS.keys}"
#     d = gets.chomp
#     @drink = Drink.new(d)
#   end

#   def cost
#     burger.price + drink.price + side.price
#   end

#   def to_s
#     "Your order: #{burger.choice} burger, #{side.choice} and #{drink.choice}."
#   end
# end

# class Cafe
#   attr_reader :order 

#   def place_order
#     @order = Order.new
#     order.choose_option
#   end

#   def order_total
#     "Your order's total: #{order.cost}"
#   end
# end

# mcdonalds = Cafe.new
# mcdonalds.place_order
# puts mcdonalds.order
# puts mcdonalds.order_total

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 52

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     self.age += 1
#   end
# end

# In the `make_one_year_older` method we have used `self`. 
# What is another way we could write this method so we don't have to use the `self` 
# prefix? Which use case would be preferred according to best practices in Ruby, and why?

# The another will be incrementing 'age' instance variable directly.
# Both ways work exactly the same, but using 'setter' is better practice in general.
# Using setter methods (like self.age=) helps maintain encapsulation. 
# Direct access to instance variables from within the class's own methods 
# exposes the internal state, which can lead to maintenance issues, especially 
# if later changes add complexity to how the variable should be handled (e.g., 
# validation, transformation).
# If you later decide that changing the age should involve additional logic 
# (such as validation, logging, or triggering other changes), using the setter method 
# (self.age=) makes this addition simpler and localized to the setter method itself. 
# For instance, you might want to ensure that the age cannot exceed a certain value or 
# that it triggers an event or logs a message:
# def age=(new_age)
#   raise "Age cannot be negative" if new_age < 0
#   @age = new_age
#   puts "Age set to #{@age}"
# end
# Using accessor methods for both reading and writing attributes ensures that 
# all interactions with an attribute go through a consistent interface, which can 
# help prevent bugs and make the code easier to understand and refactor.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 53

# module Drivable
#   def self.drive
#     'drive'
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# puts bobs_car.drive

# puts Drivable.drive


# What is output and why? What does this demonstrate about how methods need 
# to be defined in modules, and why?

# The output is 'undefined method' error.
# We call for instance method 'drive' on Car object. Inside the Car class we do not find 'drive'
# method, so we search in module 'Drivable'. Within module we see class method 'drive', not an instance.
# Since Ruby couldn't find proper method to invoke, it throws an error.
# Method 'drive' inside the module used 'self', 'self' in that case is Drivable module itself.
# When you include a module in Ruby, the instance methods of the module become 
# instance methods of the class. However, class methods of the module do not 
#   automatically become class methods of the class. Instead, they remain as methods 
#   of the module itself.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# 54
class House
  attr_reader :price

  def initialize(price)
    @price = price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more expensive

# What module/method could we add to the above code snippet to output the 
# desired output on the last 2 lines, and why?

# We need to define the '<' and '>' in House class.
# 'home1 < home2' is the same as 'home1.<(home2)'. '<' and '>' are fake operators 
# and must be defined for new classes.

# def <(other)
#   price < other.price
# end

# def >(other)
#   price > other.price
# end

# The other is defining only one method '<=>' and including Comparable module.
