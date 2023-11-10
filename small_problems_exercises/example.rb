# def add(arg)
#   arg = arg + 4
# end

# x = 4
# puts add(x)
# puts x

# def my_method(a, b = 2, c = 3, d)
#   p [a, b, c, d]
# end

# my_method(4, 5, 6)

# a = [1, 4, 8, 11, 15, 19]
# puts a.bsearch {|x| x > 8 }

# puts a.select { |x| x > 8 }

# puts a.find { |x| x > 8}

a = %w(a b c d e) 
puts a.fetch(7) # => error
puts a.fetch(7, 'beats me') # => 'beats me'
puts a.fetch(7) { |index| index**2 } # => 49
