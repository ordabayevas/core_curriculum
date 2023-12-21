def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga" # re-assiggnment creates a New string
  string_param_two << "rutabaga" # << operator mutates the caller and references to original
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}"
puts "String_arg_two looks like this now: #{string_arg_two}"

