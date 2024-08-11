require 'minitest/autorun'

require "minitest/reporters"
Minitest::Reporters.use!

class IncludedObjAssertionTest < Minitest::Test
  def setup
    @value = 'x'
    @collection = 'apple'
  end

  def test_include
    assert_includes(@collection, @value)
  end
end