require 'minitest/autorun'

require "minitest/reporters"
Minitest::Reporters.use!

class RefutationsTest < Minitest::Test
  def setup
    @value = 'xyz'
    @list = ['abc', 'xyz']
  end

  def test_refute_include
    refute_includes(@list, @value)
  end
end

