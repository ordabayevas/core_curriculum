# Write a method that takes a first name, a space, and a last name passed 
# as a single String argument, and returns a string that contains the last name, 
# a comma, a space, and the first name.

def swap_name(string)
  first, last = string.split # ['Joe', 'Doe']
  "#{last}, #{first}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
