# P
# - Define whether num is abundant, perfect, deficient.
# - Abundant has the sum of num's divisors greater than the num.
# - Perfect has the sum of num's divisors equal to num.
# - Deficient has the sum is less the num.
# - Divisors start with 1 and exclude the num itself.

# E
# def is_prime?(next_num)
#   root = Math.sqrt(next_num)
#   nums = (2..root).to_a
#   less_than_root = nums.select { |num| num < root }

#   less_than_root.each do |num|
#     if next_num % num == 0
#       return false
#     end
#   end
#   true
# end

# A
# - create a class Num 
# - class will have methods:
#   - initialize with arg
#   - method for prime nums Define
#   - method for defining non-prime nums divisors 
#   - method to compare the divisors.sum and the num and telling if it abundant, perfect or deficient

class PerfectNumber
  attr_reader :input_num

  def initialize(num)
    if num > 0
      @input_num = num
    else
      raise ArgumentError
    end
  end

  def is_prime?
    root = Math.sqrt(input_num)
    less_than_root = (2...root).to_a

    less_than_root.each do |num|
      if input_num % num == 0
        return false
      end
    end
    true
  end

  def find_divisors_sum
    divisors = (2...input_num).select do |num|
      input_num % num == 0
    end
    divisors << 1
    divisors.sum
  end

  def self.classify(num)
    number_to_classify = PerfectNumber.new(num)
    sum = number_to_classify.find_divisors_sum
    case
    when number_to_classify.is_prime? || (num > sum)
      'deficient'
    when num == sum
      'perfect'
    else
      'abundant'
    end
  end
end

# p PerfectNumber.classify(7)
# p PerfectNumber.classify(6)
# p PerfectNumber.classify(28)
# p PerfectNumber.classify(15)




