# def series(string_digit, num) # "01234", 4
#   result = []
#   0.upto(string_digit.size - num) do |i|
#     inner_result = []
#     string_digit.slice(i, num).each_char do |num|
#       inner_result << num.to_i
#     end
#     result << inner_result
#   end
#   result
# end

# p series('01234', 2)

class Series
  def initialize(string)
    @string_digit = string
  end

  def slices(num)
    raise ArgumentError if @string_digit.size < num
    
    result = []
    0.upto(@string_digit.size - num) do |i|
      inner_result = []
      @string_digit.slice(i, num).each_char do |num|
        inner_result << num.to_i
      end
      result << inner_result
    end
    result
  end
end
