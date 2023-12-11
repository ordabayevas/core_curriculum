def square_digits num
  num_array = num.to_s.split('')
  num_array.map! do |n|
    num_square = n.to_i ** 2
  end
  num_array.join.to_i
end

p square_digits(3212)

# another solution
# def square_digits num
#   # code goes here
#   num.to_s.chars.map{|x| x.to_i**2}.join.to_i
# end