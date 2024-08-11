require 'minitest/autorun'

require "minitest/reporters"
Minitest::Reporters.use!

class BooleanAssertionTest < Minitest::Test
  def setup
    @value = 5
  end

  def test_odd?
    odd_num = 3
    assert_equal((odd_num % 2) != 0, (@value % 2) != 0)
  end
end

# assert value.odd?, 'value is not odd'

