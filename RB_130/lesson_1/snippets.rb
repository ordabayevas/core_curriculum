# def new # (does not take any argument)
# 	puts 'New'
# end

# # new('York') # Argument error

# new {puts 'York'} # New

# def new(word)
# 	yield
# 	puts word
# end

# new('New') { puts 'York' } # York
# 													# New

def new(word)
	puts block_given?
	puts word
end

new('New')

# def new(word)
# 	if block_given?
# 		yield(word + ' York')
#   end
# 	puts 'York ' + word
# end

# new('New') do |block_parameter|
#   puts "Print the parameter: #{block_parameter}"
# end

# 5.times do |num|
#   puts num
# end
