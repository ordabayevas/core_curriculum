require 'minitest/autorun'

require "minitest/reporters"
Minitest::Reporters.use!

class TypeTest < Minitest::Test
  def setup
    @value = Numeric.new
  end

  def test_type
    assert_instance_of(Numeric, @value)
  end
end