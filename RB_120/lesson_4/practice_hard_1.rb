=begin
# 1
module Motored
  attr_accessor :speed, :heading

  def fuel(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end


class WheeledVehicle
  include Motored

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    fuel(km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Catamaran
  attr_reader :propeller_count, :hull_count
  include Motored

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    fuel(km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
  end
end

cata = Catamaran.new(4, 5, 16, 32)
puts cata.range

# 2
module Motored
  attr_accessor :speed, :heading

  def fuel(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Boats
  attr_reader :propeller_count, :hull_count
  include Motored

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    fuel(km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
  end
end

class Catamaran < Boats
end

class Motorboat < Boats
  PROPELLER_COUNT = 1
  HULL_COUNT = 1

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(PROPELLER_COUNT, HULL_COUNT, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

boat1 = Motorboat.new(15, 20)
puts boat1.propeller_count
puts boat1.range
=end

# 3
module Motored
  attr_accessor :speed, :heading

  def fuel(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end


class WheeledVehicle
  include Motored

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    fuel(km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end
  
class Boats
  attr_reader :propeller_count, :hull_count
  include Motored

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    fuel(km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
  end

  def range
    super + 10
  end
end

class Catamaran < Boats
end

class Motorboat < Boats
  PROPELLER_COUNT = 1
  HULL_COUNT = 1

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(PROPELLER_COUNT, HULL_COUNT, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

boat1 = Motorboat.new(15, 20)
puts boat1.range