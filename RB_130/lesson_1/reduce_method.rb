# Own #reduce method
def reduce(array, accumulator=0)
  counter = 0
  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  p accumulator
end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

# Further
def reduce(array, default=nil)
  counter = 0
  if default == nil
    default = array[counter]
    counter += 1
  end

  accumulator = default
  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  p accumulator
end

reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']