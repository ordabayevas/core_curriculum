require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < Minitest::Test
  # def test_wheels
  #   car = Car.new
  #   assert_equal(4, car.wheels)
  # end

  # def test_bad_wheels
  #   skip
  #   car = Car.new
  #   assert_equal(3, car.wheels)
  # end

  def setup
    @car = Car.new
  end

  def test_car_exists # verifies something, should return true
    assert(@car)
  end

  def test_wheels # compares expected output, which is 4, with actual output
    assert_equal(4, @car.wheels)
  end

  def test_name_is_nil # the name instance variable is not assigned
    assert_nil(@car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(name: 'Joey')  # this code raises ArgumentError, so this assertion passes
    end
  end

  def test_instance_of_car # checks if object car is instance of Car class
    assert_instance_of(Car, @car)
  end

  def test_includes_car # checks if object in the collection
    arr = [1, 2, 3]
    arr << @car
    
    assert_includes(arr, @car)
  end
end

