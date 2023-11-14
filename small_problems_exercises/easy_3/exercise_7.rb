def palindrome?(string)
  string.reverse == string
end

puts palindrome?('madam')
puts palindrome?('Madam')          # (case matters)
puts palindrome?("madam i'm adam") # (all characters matter)
puts palindrome?('356653')

# 1) Write a method that determines whether an array is palindromic; 
# that is, the element values appear in the same sequence 
# both forwards and backwards in the array. 
# 2) Now write a method that determines whether an array or a string is palindromic; 
# that is, write a method that can take either an array or a string argument, 
# and determines whether that argument is a palindrome. 
# You may not use an if, unless, or case statement or modifier.

# def palindrome?(argument)
#   argument.reverse == argument
# end

# puts palindrome?([1, 2, 1])
# puts palindrome?('356653')