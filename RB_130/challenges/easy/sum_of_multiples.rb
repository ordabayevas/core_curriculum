# P
# - 2 arguments: given a max number and list of numbers
# - if the list of numbers is not given, use [3, 5] as default
# - find the sum of all multiples of these nums till the first argument, but not include the num itself.
# - if numbers all have the common multiplier, add it once only.

# E
# Args: 20, [3, 5]
# Multiples are 3, 5, 6, 9, 10, 12, 15, 18 = 78

# D
# Use an array to store multiples to get rid of repeating nums.

# A
# - take 2 args and set the default value for the second one.
# - min num in sec arg up to first arg, iterate every num. But exclude the first arg.
# - add all nums that are multiplier of every num, then delete duplicates
# - sum all nums in array.

class SumOfMultiples
  attr_reader :set

  def initialize(*set_of_nums)
    @set = set_of_nums
    if set_of_nums.empty?
      @set = [3, 5]
    end
  end

  def self.to(limit)
    SumOfMultiples.new.to(limit)
  end

  def to(limit)
    return 0 if limit < @set.min
    result = []
    @set.min.upto(limit - 1) do |num| # 3 up to 19
      @set.each do |n| # 3, 5
        if (num % n) == 0 
          result << num if !result.include?(num)
        end
      end
    end
    result.sum 
  end

end

# p SumOfMultiples.to(20)
# p SumOfMultiples.new(3, 4, 5).set

  # def to(limit, set)
  #   return 0 if limit < set.min
  #   result = []
  #   set.min.upto(limit - 1) do |num| # 3 up to 19
  #     set.each do |n| # 3, 5
  #       if (num % n) == 0 
  #         result << num if !result.include?(num)
  #       end
  #     end
  #   end
  #   result
  # end