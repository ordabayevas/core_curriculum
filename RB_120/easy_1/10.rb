class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

# Further Exploration
# class Vehicle
#   attr_reader :make, :model 

#   def initialize(make, model)
#     @make = make
#     @model = model
#   end

#   def to_s
#     "#{make} #{model}"
#   end

# # addition
#   def wheels
#     self.class::NUM_OF_WHEELS
#   end
# end 

# class Car < Vehicle
#   NUM_OF_WHEELS = 4
# end

# class Motorcycle < Vehicle
#   NUM_OF_WHEELS = 2
# end

# class Truck < Vehicle
#   attr_reader :payload

#   def initialize(make, model, payload)
#     super(make, model)
#     @payload = payload
#   end

#   NUM_OF_WHEELS = 6
# end

# truck = Truck.new("Toyota", "F-150", "2470 lbs")
# puts truck.wheels # returns 6