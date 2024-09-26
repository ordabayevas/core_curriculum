# snack.rb create a different tests
class Snack
  attr_accessor :type, :category

  def initialize(type, category)
    @type = type
    @category = category
  end
end

require 'minitest/autorun'

class SnackTest < Minitest::Test
  def setup
    @type = 'dried apricots'
    @category = 'sweet'
    @test_snack = Snack.new(@type, @category)
  end

  def test_validate
    assert(@test_snack)
  end

  def test_type
    assert_equal(@type, @test_snack.type)
  end

  def test_category
    assert_equal(@category, @test_snack.category)
  end

  def test_class
    assert_instance_of(Snack, @test_snack)
  end

  def test_error
    assert_raises(ArgumentError) {Snack.new}
  end

  def test_not_nil
    refute_nil(@test_snack.category)
    refute_nil(@test_snack.type)
  end

  def test_not_the_same_object
    test_snack_2 = Snack.new(@type, @category)
    refute_same(@test_snack, test_snack_2)
  end
end
