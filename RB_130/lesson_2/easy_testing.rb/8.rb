require 'minitest/autorun'

require "minitest/reporters"
Minitest::Reporters.use!

class KindAssertionsTest < Minitest::Test
  def setup
    @value = 0.9
  end

  def test_kind_of
    assert_kind_of(Numeric, @value)
  end
end