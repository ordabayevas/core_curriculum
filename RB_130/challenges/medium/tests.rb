require 'minitest/autorun'
require_relative 'coding_challenge'

require "minitest/reporters"
Minitest::Reporters.use!

class BoomerangTest < Minitest::Test
  def test_boomerang
    # skip
    assert_equal true, Boomerang.boomerang?([0, 1, 2, 3, 2, 1, 0])
  end

  def test_reverse_boomerang
    # skip
    assert_equal true, Boomerang.boomerang?([4, 2, 0, 2, 4])
  end

  def test_no_plateau
    # skip
    assert_equal false, Boomerang.boomerang?([0, 2, 2, 3, 2, 1, 0])
  end

  def test_no_plateau_elbow
    # skip
    assert_equal false, Boomerang.boomerang?([4, 2, 0, 0, 2, 4])
  end

  def test_asymmetric_shape
    # skip
    assert_equal true, Boomerang.boomerang?([0, 1, 2, 3, 4, 1, 0])
  end

  def test_asymmetric_edges
    # skip
    assert_equal true, Boomerang.boomerang?([4, 2, 1, 0, 3])
  end

  def test_multiple_elbows
    # skip
    assert_equal false, Boomerang.boomerang?([1, 2, 4, 2, 1, 2, 4])
  end

  def test_missing_elbow
    # skip
    assert_equal false, Boomerang.boomerang?([1, 2, 3, 4])
  end

  def test_missing_elbow_reverse
    #skip
    assert_equal false, Boomerang.boomerang?([4, 3, 2, 1])
  end

  def test_shortest_boomerang
    # skip
    assert_equal true, Boomerang.boomerang?([1, 10, 1])
  end

  def test_boomerang_too_short
    # skip
    assert_equal false, Boomerang.boomerang?([1])
  end
end