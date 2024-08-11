require 'minitest/autorun'

require "minitest/reporters"
Minitest::Reporters.use!

class EqualityAssertionTest < Minitest::Test
  def setup
    @value = 'Xyz'
  end

  def test_downcase
    assert_equal('xyz', @value.downcase)
  end
end