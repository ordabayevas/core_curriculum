# def teddys_age
#   age = rand(20..200)
#   "Teddy is #{age} years old!"
# end

# p teddys_age

# Modify this program to ask for a name, 
# and then print the age for that person. 
# For an extra challenge, use "Teddy" as the name if no name is entered.

def teddys_age
  puts 'What is your name?'
  name = gets.chomp
  
  if name.empty?
    name = 'Teddy'
  end
  
  age = rand(20..200)
  "#{name} is #{age} years old!"
end

p teddys_age