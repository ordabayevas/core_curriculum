# frozen_string_literal: true
# This class represents the Set class in user designed interpretation.
# Uses as built-in Set class alternation.
class CustomSet
  attr_reader :set

  def initialize(array = [])
    @set = array.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(arg)
    set.include?(arg)
  end

  def subset?(arr_arg)
    set.all? { |arg| arr_arg.contains?(arg) }
  end

  def disjoint?(other)
    return true if set.empty? || other.set.empty?

    (set + other.set).uniq.size == (set + other.set).size
  end

  def eql?(other)
    set.sort == other.set.sort
  end

  def ==(other)
    set.sort == other.set.sort
  end

  def add(arg)
    set << arg unless contains?(arg)
    self
  end

  def intersection(other)
    common = set.select do |item|
      other.contains?(item)
    end

    CustomSet.new(common)
  end

  def difference(other)
    difference = set.reject do |item|
      other.contains?(item)
    end

    CustomSet.new(difference)
  end

  def union(other)
    CustomSet.new(set + other.set)
  end
end

# set = CustomSet.new
# p set.subset?(CustomSet.new([4, 1, 2, 3]))
# set = CustomSet.new
# set.add(3)
# set = CustomSet.new([1, 2, 4]).add(3)
# p set
# expected = CustomSet.new([1, 2, 4, 3])
# p expected
# p set == expected
# first_set = CustomSet.new([1, 2, 3, 4])
# second_set = CustomSet.new([3, 2, 5])
# p first_set.difference(second_set)
