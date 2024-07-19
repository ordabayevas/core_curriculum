# 1. Classes and objects
# In Ruby we can organize code into classes and modules to write complex structural 
# code without repeating yourself.
# Classes are blueprints for creating objects. It contains the behaviours and states 
# that will be specific to instantiating object. We can define the class similar to 
# defining methods, but instead
# `def` we need to use `class` and pass the name of the class in CamelCase.
# Object is a basic unit of data that represents a real-world entity or 
# abstract concept within a program.
# Objects can be created with the name of the class passed in the `new` built-in method.

# class Employer
# end

# p Employer.new # => #<Employer:0x0000000104729b38>

# 2. States and behaviours
# Every object has the specific states and behaviours that are defined in it's class.
# States refer to the attributes of an object that capture information about it. 
# States are tracked by instance variables.
# Behaviours are the abilities of the object or what object can do. Behaviours are defined 
# in instance methods.
# States are different for each object, while behaviours are the same for all objects 
# of the same class.
# Methods can be inherited from superclass or mixin modules, instance variables are not.
# When we define states in the class, we define what kind of collection of states will have the 
# object, but each object will have the own copy of these instance variables.

# For example, consider a Car class:

# States might include color, make, model, and current_speed.
# Each instance of a Car could have different values for these attributes: 
# one might be red, a Tesla, Model S, traveling at 55 mph, while another might be blue, 
# a Ford, Escape, parked (0 mph).

# When a class inherits from another class, it gains access to the methods of the 
# superclass. Instance variables, however, are not inherited directly, but the subclass 
# will have access to any instance variable if it's used by inherited methods or is 
# initialized within the subclass itself. 

# class Car 
#   attr_reader :doors
#   def initialize
#     @doors = 4
#   end
# end

# class Sedan < Car; end

# p Sedan.new.doors

# class Employer
#   def initialize(company)
#     @company = company
#   end

#   def hire_employees
#     "#{@company} hires"
#   end
# end

# new_emp = Employer.new('McDonalds')
# p new_emp.hire_employees # => 'McDonalds hires'

# 3. Instance variables, class variables and constants
In Ruby, an instance variable is a type of variable that is associated with a particular 
instance of a class. These variables are used to hold data that is unique to 
each object created from a class. Instance variables are fundamental to the 
concept of object-oriented programming as they allow individual objects to maintain 
state independently of other objects.

Key Characteristics of Instance Variables:
Object-specific: Each object (instance of a class) has its own set of 
instance variables. Changes to an instance variable in one object do not 
  affect the instance variables in any other object.

Naming Convention: Instance variables in Ruby are prefixed with an @ symbol. 
This distinguishes them from local variables and other types of variables such 
as class variables (@@) and global variables ($).

Scope and Accessibility: Instance variables are only directly accessible within 
the instance methods of the class where they are defined, or through methods 
specifically designed to expose them (such as getter and setter methods).

Initialization: Instance variables are not required to be initialized; if an 
instance variable is referenced before it is assigned a value, it will simply 
return nil.

# class Employer
#   attr_reader :company_name
#   def initialize(name)
#     @company_name = name
#   end
# end

# p Employer.new('McDonalds').company_name

# Class Variables are the variables with @@ sign in front. They have higher scope than instance variables.
# They can be defined wherever inside the class and their value can be referenced without 
# object instantiation. To display the value of class variable we can define instance or class method.
# Class variables share their state throughout the superclass and subclasses. This means that all have only one
# copy of that variable and it can be reassigned from subclasses.

# class Employer
#   @@all_employers = []

#   def initialize(name)
#     @company_name = name
#     @@all_employers << @company_name
#   end

#   def self.display_employers
#     @@all_employers
#   end
# end

# p Employer.display_employers # => []
# Employer.new('McDonalds')
# p Employer.display_employers # => ['McDonalds']

# Constants are the variables that defined with uppercase letters and their values
# shouldn't be changed, otherwise Ruby warns you.
# Constants can be inherited from superclass. Constants have lexical scope. 
# It means that their scope is defined where they were created and up in hierarchical chain.
# Ruby first search for it within the class, then goes up by method lookup path.

# class Employer
#   CONSTANT = "Employer's constant"

#   def display_constant
#     CONSTANT
#   end
# end

# class Employee < Employer; end

# p Employee.new.display_constant

class Animal
  def display_legs
    LEGS
  end
end

class Dog < Animal
  LEGS = 4
end

p Dog.new.display_legs # error

class Animal
  LEGS = 2
  def display_legs
    LEGS
  end
end

class Dog < Animal
  LEGS = 4
end

p Dog.new.display_legs # error

When display_legs is executed, Ruby starts looking for the LEGS constant in the scope 
of the Animal class because that is where the method is defined.
Ruby then looks up the inheritance chain from Animal, not from Dog.
Since Animal does not define LEGS, and Animal's superclass (Object by default) 
also doesn't define it, Ruby raises a NameError indicating that LEGS is an uninitialized 
constant.

# 4. Getter and setter
# Because of the encapsulating nature of the classes, we cannot retrieve some state of the object, 
# unless we didn't define the method for displaying data or for changing it from the outside.
# To retrieve data we define method that calls getter:

# class Employee
#   def position
#     @position
#   end

#   def initialize(position)
#     @position = position
#   end
# end

# emp1 = Employee.new('Lawyer')
# p emp1.position

# If we want to change the internal information from outside the class, 
# we need to define specific method to set the value:

# class Employee
#   def position
#     @position
#   end

#   def position=(new_position)
#     @position = new_position
#   end

#   def initialize(position)
#     @position = position
#   end
# end

# emp1 = Employee.new('Lawyer')
# p emp1.position

# emp1.position=('Senior lawyer')
# p emp1.position

# Because these two methods are so common, Ruby has a shorthand version for them.
# If we want to add both getter and setter methods for some state, we can use `attr_accessor`.
# For adding only getter - `attr_reader`, and only for setter - `attr_writer`.
# After these keywords we pass the name of the variable turned to symbol. It will mean that 
# behind the scenes Ruby created get and set methods with this passed name.
# Setter methods always return the new setting value. If we try to return something else, it will
# just ignores this attempt.

# class Employee
#   attr_accessor :position
#   def initialize(position)
#     @position = position
#   end
# end

# emp1 = Employee.new('Lawyer')
# emp1.position = 'Senior lawyer'
# p emp1.position

# 5. Instance methods and class methods
Instance methods are methods defined within a class that operate on instances 
of that class. These methods can access and modify the instance variables of 
the objects on which they are called, effectively manipulating the object's state and 
providing behavior specific to that object.
# To work with object of the class we define in the class instance 
# methods that called on the instance of this class. They operate on instance variables.
# Use to define the behaviours of the object.
# They are defined as a regular methods with keywords `def` then name of the method 
# and `end`.

# class Employee
#   def initialize(position)
#     @position = position
#   end

#   def work
#     "#{@position} works"
#   end
# end

# emp1 = Employee.new('Lawyer')
# p emp1.work

# Class methods are the methods that called on the entire class rather than on some object.
# They are used for functionality that involves whole class, rather than individual object.
# To define class method we prepend `self` in front of the name of the method.

# class Employee
#   def self.work
#     'All employees work!'
#   end
# end

# Employee.new('Lawyer')
# p Employee.work

# 6. Method access control
# In terms of encapsulation data we can manage what we want to be exposed and what is not.
# It is achievable through Method access control. Ruby allows us to define public, private and protected methods.
# Public methods can be define with or without special keyword `public`, basically all methods that are
# not defined as private or protected are public. Public methods can be called from the outside of the class,
# and the data inside of them can be manipulated.
# class Employee
#   def initialize(name)
#     @name = name
#   end

#   def display_name
#     puts @name
#   end

#   def change_name(new_name)
#     @name = new_name
#   end
# end

# emp2 = Employee.new('J.Lennon')
# emp2.display_name

# emp2.change_name('J.Lenon')
# emp2.display_name

# If we want to hide some information or would like to restrict the changes from the outside of the class,
# we can define `private` methods. For that we can define `private` keyword and everything after that will be private.
# Private methods cannot be called from the outside of the class.
# class Employee
#   def initialize(name, salary)
#     @name = name
#     @salary = salary
#   end

#   def display_name
#     puts @name
#   end

#   def change_name(new_name)
#     @name = new_name
#   end

#   def salary_level
#     if salary >= 100000
#       'High-level salary'
#     else
#       'Low-level salary'
#     end
#   end

#   private

#   attr_reader :salary
# end

# emp2 = Employee.new('J.Lennon', 100000)
# emp2.display_name

# emp2.change_name('J.Lenon')
# emp2.display_name

# # p emp2.salary
# p emp2.salary_level

# Protected methods are similar to private methods in terms that we cannot invoke them 
# from the outside of the class, but the distinction is that protected methods have an access
# to the state of the other object of the same class. For example, it can access the value of calling object
# and passing object as argument.

# class Employee
#   attr_reader :name

#   def initialize(name, position)
#     @name = name
#     @position = position
#   end

#   def same_position?(other)
#     position == other.position
#   end

#   protected

#   attr_reader :position
# end

# emp1 = Employee.new('John', 'lawyer')
# emp2 = Employee.new('Sally', 'lawyer')

# # p emp1.position # protected method `position'
# p emp1.same_position?(emp2) # true

# 7. Class inheritance, encapsulation, polymorphism
# Class inheritance is the ability of some classes (subclassses) inherit behaviours from 
# another class (superclass). Inheritance is defined by sign '<' after defining class and 
# passing the name of the superclass. This is useful for hierarchical structure of classes.

# class Animal
#   def move 
#     'moving'
#   end
# end

# class Snake < Animal
# end

# p Snake.new.move

# Encapsulation is one of the core concepts in OOP. Encapsulation is hiding, restraining 
# the access to data. On higher level we can say that class itself encapsulates data.
# If we define some state inside the class we cannot refer to it, unless we define the way 
# to access this data. Encapsulation restrains exposing raw data and prevents externally 
# changing it unwillingly.

# class Citizen 
#   def initialize(ssn)
#     @ssn = ssn
#   end
# end

# adam = Citizen.new(1234)
# p adam.ssn # error

# Also we can manage the accessibility of methods with Method access control. Using 
# Method access control allows to create private and protected methods. Private and protected
# methods cannot be called from the outside of the class, but protected methods have an access
# to the state of other objects of the same class.

# class BankAccount
#   attr_accessor :name
#   def initialize(name, owner)
#     @name = name
#     @owner = owner
#   end

#   def show_owner
#     owner.chars.first
#   end

#   def same_owner?(other)
#     owner == other.owner
#   end

#   protected

#   attr_reader :owner
# end

# bank1 = BankAccount.new('Bank of America', 'John')
# p bank1.name

# bank1.name=('Citizens')
# p bank1.name

# p bank1.show_owner

# bank2 = BankAccount.new('Bank of America', 'John')
# p bank1.same_owner?(bank2)

# p bank2.owner

# Polymorphism is an ability of different objects to respond to the common interface.
# In other words, different objects respond to the same method call but in different ways.
# When we call with one method invocation different objects, then we use polymorphism.

# Polymorphism can be implemented in two ways through inheritance and through duck-typing.
# When we define inheritance chain with class or mixins, the subclass will respond to 
# invocation of any of the method invocations that defined in superclass or in mixin.

# module Speakable
#   def speak
#     @sound
#   end
# end

# class Animal
#   def run
#     'running'
#   end
# end

# class Tiger < Animal
#   include Speakable
#   def initialize
#     @sound = 'roar'
#   end
# end

# class Lizard < Animal
# end

# class Dog < Animal
#   include Speakable
#   def initialize
#     @sound = 'bark'
#   end
# end

# p Tiger.new.run
# p Lizard.new.run

# p Tiger.new.speak
# p Dog.new.speak

# Polymorphism through duck-typing is when we have unrelated classes objects have the similar behaviour
# and thus can respond to the same method invocation. With duck-typing we do not care how
# the method will be implemented, we rely only on how they were called.

# class Person
#   def move
#     'walking'
#   end
# end

# class Airplane
#   def move
#     'flying'
#   end
# end

# class Bear
#   def move
#     'running'
#   end
# end

# [Person.new, Airplane.new, Bear.new].each {|object| puts object.move}

# 8. Modules and their use cases
# Module is a collection of methods, constants, and other module and 
# class definitions that serve as a namespace or a mixin. 
# Modules are an integral part of Ruby, providing two main functionalities: 
# organization of code into namespaces, preventing name clashes among methods and 
# constants, and the creation of mixable functionality that can be included in classes.
# They cannot instantiate the object.
# We have next use cases for modules:
# 1) Modules as mixins or interface inheritance. If some behaviour cannot be organized in
# hierarchical way and only some of subclasses present the given behaviours while superclass and all other
# subclasses do not, it is better to eliminate the given behaviour to separate module and
# include this module to classes.

# module Speakable
#   def speak
#     @sound
#   end
# end

# class Animal
#   def run
#     'running'
#   end
# end

# class Tiger < Animal
#   include Speakable
#   def initialize
#     @sound = 'roar'
#   end
# end

# class Lizard < Animal
# end

# class Dog < Animal
#   include Speakable
#   def initialize
#     @sound = 'bark'
#   end
# end

# class Fox < Animal
# end

# p Tiger.new.run
# p Lizard.new.run

# p Tiger.new.speak
# p Dog.new.speak

# 2) The other use case is modules for namespacing. It allows to organize the related class
# under one namespace module. Modules provide a namespace, helping to prevent name clashes between 
# different areas of a program.

# module Animals 
#   class Bear; end
#   class Snake; end
#   class Tiger; end
# end

# module SchoolTeams
#   class Bear; end
#   class Snake; end
#   class Tiger; end
# end

# p Animals::Bear.new
# p SchoolTeams::Bear.new

# 3) The last one is using module as a container of module methods. Module methods are methods
# that can be called directly from module.

# module MathOperations
#   PI = 3.14

#   def self.circle_area(radius)
#     PI * radius ** 2
#   end
# end

# p MathOperations.circle_area(6)

# 9. Method lookup path
# Method lookup path is the order in which Ruby searches for methods to implement 
# when we call them.
# 1) First Ruby looks in the class of the calling object
# 2) Then goes to the module. If there are several modules it looks from last added module.
# 3) Then goes to superclass if there is any.
# 4) Then goes to superclass modules.
# 5) Then 3 common to all places: Object class, Kernel module, BasicObject 

# To be sure, we can check for lookup chain with #ancestors method called on the class itself.

# 10. Method overriding
# Method overriding happens when some subclass defines the method as in a superclass 
# with the same name, same return value, but with completely different or extended 
# functionality. Defining the method with the same method call but with specific 
# implementation shows polymorphism.
# If we want to build specific functionality on top of the method in superclass, we can call
# for keyword `super` that allows you to inherit the functionality of method with the same name
# in superclass. `super` takes arguments or we can define empty brackets, which means that 
# we do not want to provide any argument or without any brackets, which means we provide all
# arguments.

# class Book
#   attr_reader :name, :author
#   def initialize(name, author)
#     @name = name
#     @author = author
#   end
# end

# class Novel < Book
# end

# class TextBook < Book
#   attr_reader :subject
#   def initialize(name, author, subject)
#     super(name, author)
#     @subject = subject
#   end
# end

# book1 = TextBook.new('Organic chemistry', 'J.Lennon', 'Science')
# p book1.subject
# p book1.name

# 11. Self
# Within the class `self` used to represent:
# - inside the instance method: the calling instance of the class.
# class Employee
#   def work
#     "#{self} needs to work"
#   end

#   def to_s
#     'Worker'
#   end
# end

# worker1 = Employee.new
# p worker1.work

# Whenever inside the class but not inside the instance method: calls for class itself.
# class Employee
#   puts self

#   def self.work
#     "#{self} must work"
#   end
# end

# worker1 = Employee.new
# p Employee.work

# In Ruby, it is necessary to use self explicitly when setting values using setter 
# methods. This is because without self, Ruby interprets the assignment as the 
# initialization of a local variable, not as a call to a setter method. 

# class Employee
# 	attr_accessor :name

# 	def initialize(n)
# 		@name = n
# 	end
	
# 	def capitalize_name
# 		self.name = name.capitalize
# 	end
# end

# emp4 = Employee.new('liza')
# emp4.name # => liza
# p emp4.capitalize_name

# 12. Fake operators and equality
# Ruby has operators that are methods, and to use them we need to define them 
# for customized classess. In Ruby, some operators, such as || and &&, are built 
# into the language and cannot be overridden because they are not methods but 
# part of the core syntax. 
# On the other hand, what might appear as operators, such as +, ==, or <, <<, [] are 
# actually methods that can be overridden in custom classes. It can be hard to 
# recognize fake operators because of the syntactical sugar provided by Ruby.
# What looks like an operators, for example:
# my_array[2]
# Is a method invocation:
# my_array.[](2)

# To customize the behavior of these operator methods in your own classes, 
# you need to explicitly define or override them. If you do not, attempting to 
# use these operators may result in a NoMethodError if Ruby does not find the 
# corresponding method implementation in your class. 
# Because they are methods, we can implement them in our classes and take 
# advantage of the special syntax for our own objects. If we do that, 
# we must be careful to follow conventions established in the Ruby standard library. 

# The one of the most often overridden methods are `==` equality method.
# By convention this method used for comparing the two variables values are the same.
# str1 = 'abc' # different obj id's
# str2 = 'abc'

# str1 == str2 # same value, not the same objects

# This equality method is defined in BasicObject class which is parental for
# all classes, and by default, if we do not customize this method, 
# it will compare if two objects are the same objects. Just like `equal?` method.

# class Team1
#   attr_reader :team1
#   def initialize
#     @team1 = ['Alice', 'Joe', 'Randy']
#   end

#   def ==(other)
#     team1 == other.team2
#   end
# end

# class Team2
#   attr_reader :team2
#   def initialize
#     @team2 = ['Alice', 'Joe', 'Randy']
#   end
# end 

# p Team1.new == Team2.new

# When we define `==` we define by default `!=`. But we also can override this method. 
# But we should be careful, so both equal and not equal methods will not be the same.
# It is recommended to not override `!=` method.

# Also there are two more methods related to equivalence. One of them is `===`(case equality)
# method, which is also looks like an operator. This method calls like this because this is
# a method which is behind the scenes in `case` statement.
# This method is defined in the Object class which is one of the root classes.
# Triple equivalence checks if right side argument is belong to left side argument.

# (1..10) === 3 #=> if 3 is belong to range?
# The answer is `true` since 3 is an integer and it is between 1 and 10.
# Also if left side arg is not a range or group the triple equal sign works like double 
# equality.
# 1 === 3 # false
# 3 === 3 # true

# The last is `eql?` method that checks if the values are the same and the obj.id's 
# the same.

# 13. Collaborator objects.
# Collaboration is a way to build connection between classes. If some class uses the 
# object of the other different class as it's state, then used state object will be 
# collaborator object.
# For example:
class Library 
  attr_reader :books
  def initialize 
    @books = []
  end

  def <<(book)
    books << book
  end
end

class Book 
  attr_reader :title
  def initialize(title)
    @title = title
  end
end

alexandria_library = Library.new
book1 = Book.new('Little Women')

alexandria_library << book1
p alexandria_library.books

Here Book is a collaborator object for Library.

But not only customized classes could be the collaborators, but also all built-in classes too.

class Person
  def initialize(name)
    @name = name
  end
end

Person.new('Allie') # => Allie is a string object which is also collaborator for Person.
When using collaborators we have to consider what classes will be appropriate and from 
logical and from technical standpoint.