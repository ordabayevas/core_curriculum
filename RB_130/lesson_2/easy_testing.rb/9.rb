require 'minitest/autorun'

require "minitest/reporters"
Minitest::Reporters.use!

module Processable
  def self.process(list)
    list
  end
end

class SameObjectTest < Minitest::Test
  def setup
    @list = [1]
  end

  def test_same
    assert_same(@list, Processable.process(@list))
  end
end

=begin
require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise9Test < Minitest::Test
  attr_accessor :list

  class List
    def process
      "foo"
    end
  end

  def setup
    @list = List.new
  end

  def test_assert_same
    # this test will fail
    skip
    assert_same(list, list.process)
  end

  def test_refute_same
    refute_same(list, list.process)
  end
end
=end
