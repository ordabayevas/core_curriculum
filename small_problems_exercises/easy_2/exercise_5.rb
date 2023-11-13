def greeting
  puts 'What is your name?'
  name = gets.chomp!
  if name.end_with?('!')
    name = name.chop! # for removing exclamation mark in the end
    puts "Hello #{name}. Why are we screaming?".upcase
  else
    puts "Hello #{name}."
  end
end

greeting

# LS solution
# print 'What is your name? '
# name = gets.chomp

# if name[-1] == '!'
#   name = name.chop
#   puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end