require 'minitest/autorun'

require "minitest/reporters"
Minitest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  def initialize(experience = false)
    @experience = experience
  end

  def hire
    raise NoExperienceError unless @experience
    @hired = true
  end
end

class RaiseExceptionTest < Minitest::Test
  def test_exception
    assert_raises NoExperienceError do
      employee = Employee.new
      employee.hire
    end
  end
end