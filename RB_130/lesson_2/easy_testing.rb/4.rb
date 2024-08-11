require 'minitest/autorun'

require "minitest/reporters"
Minitest::Reporters.use!

class EmptyAssertionTest < Minitest::Test
  def setup
    @value = []
  end

  def test_empty
    assert_empty(@value)
  end
end
