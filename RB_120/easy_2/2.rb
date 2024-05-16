# module Drivable
#   def self.drive
#     puts 'drive'
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# Drivable.drive

module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive