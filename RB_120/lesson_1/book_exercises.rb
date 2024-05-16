# module Sex
#   puts "it's a girl!"
# end

# class Baby
#   include Sex
# end

# daughter = Baby.new

# class GoodDog
#   def initialize
#     puts "This object was initialized!"
#   end
# end

# sparky = GoodDog.new        # => "This object was initialized!"

# class GoodDog
#   @@total_number_of_dogs = 0
#   #class methods
#   def self.some_method
#     'Hi'
#   end

#   def self.total_dogs
#     @@total_number_of_dogs
#   end

#   # instance methods
#   # def initialize(name) -> #constructor 
#   #   @@total_number_of_dogs += 1
#   #   @name = name
#   # end

# end

# zues = GoodDog.new("zues")
# sparky = GoodDog.new
# another_dog = GoodDog.new('dog')
module Liftable
  def lift(lifting_capacity)
    "My lifting capacity #{lifting_capacity}"
  end
end

class Vehicle
  attr_accessor :color
  attr_accessor :year
  attr_reader :model

  @@number_of_objects = 0

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
    @@number_of_objects += 1
  end

  def self.gas_mileage(miles, gallons)
    miles / gallons
  end

  def spray_paint(new_color)
    self.color = new_color
    "You changed the color to #{new_color}"
  end

  def speed_up(num)
    @current_speed += num
  end

  def brake(num)
    @current_speed -= num
  end

  def shut_the_car_off
    @current_speed = 0
  end

  def info
    "Current speed is #{@current_speed}"
  end

  def self.number_of_objects
    "Number of created objects is #{@@number_of_objects}"
  end
  
  def age
    "My current car is #{self.model} and it is #{age_of_vehicle} years old"
  end

  private

  def age_of_vehicle
    current_year = Time.new.year
    current_year - self.year.to_i
  end
end

class MyTruck < Vehicle
  TYPE = 'truck'
  include Liftable

  def to_s
    "My #{TYPE} is a #{model}, #{color} and created in #{year}"
  end
end

class MyCar < Vehicle
  TYPE = 'sedan'
  # def color
  #   @color
  # end

  # def color=(c)
  #   @color = c 
  # end

  # def year
  #   @year
  # end

  def to_s
    "My #{TYPE} is a #{self.model}, #{self.color} and created in #{self.year}"
  end

end

# puts Vehicle.number_of_objects

car = MyCar.new(1995, 'red', 'mustang')
# puts Vehicle.number_of_objects
# puts car.info
# car.speed_up(15)
# puts car.info
# car.speed_up(15)
# puts car.info
# car.brake(20)
# puts car.info
# car.shut_the_car_off
# puts car.info
puts car.to_s
# puts car.spray_paint('blue')
# puts car.to_s
# puts car.color
# puts MyCar.gas_mileage(6, 2)
# puts car
# puts car.age

truck = MyTruck.new('2020', 'silver', 'cybertruck')
# puts Vehicle.number_of_objects
# puts truck.lift(1000)
puts truck.to_s
# puts truck
# puts truck.info
# truck.speed_up(15)
# puts truck.info
# truck.speed_up(15)
# puts truck.info
# truck.brake(20)
# puts truck.info
# truck.shut_the_car_off
# puts truck.info
# puts truck.to_s
# puts truck.spray_paint('blue')
# puts truck.to_s
# puts truck.color
# puts MyTruck.gas_mileage(6, 2)
# puts Vehicle.ancestors
# puts MyCar.ancestors
# puts MyTruck.ancestors
# puts truck.age

=begin
class Student
  attr_reader :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(another)
    self.grade > another.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new('Joe', 100)

bob = Student.new('Bob', 98)
puts joe.better_grade_than?(bob)
puts "Well done!" if joe.better_grade_than?(bob)

class Person
  def name
    @name
  end

  def initialize(name)
    @name = name
  end

  def public_hi
    hi
  end

  private

  def hi
    "Hi #{self.name}!"
  end
end

bob = Person.new('Bob')
puts bob.public_hi
=end


