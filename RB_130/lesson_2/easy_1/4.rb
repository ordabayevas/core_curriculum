require 'pry'
require 'pry-byebug'

# def divisors(number)
#   divisors = []
#   (1..number).to_a.each do |div|
#     if (number % div) == 0
#       divisors << div
#     end
#   end
#   divisors
# end

def time_it
  start_time = Time.now
  yield if block_given?
  end_time = Time.now
  puts "Took #{end_time - start_time} sec."
end

def divisors(num)
  result = []
  (1..Math.sqrt(num)).each do |x|
    # binding.pry
    result << x << num / x if num % x == 0
  end
  result#.uniq.sort
end

#time_it {divisors(99400891)}

# p divisors(1) #== [1]
# p divisors(7) #== [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) #== [1, 9967, 9973, 99400891] # may take a minute