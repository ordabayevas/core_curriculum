# def tricky_method(a_string_param, an_array_param)
#   a_string_param += "rutabaga"
#   an_array_param << "rutabaga"
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]
# tricky_method(my_string, my_array)

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

# puts my_string
# puts my_array

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  #puts a_string_param
  an_array_param += ["rutabaga"]
  #puts an_array_param

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
#puts my_string
#puts my_array
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

#puts my_string
#puts my_array
#p not_so_tricky_method(my_string, my_array)