# my solution
a = 42
if (10..100).include?(a)
  puts a
else
  puts 'Not in this range'
end

#LS solution
(10..100).cover?(42) # returns a boolean value true if the given object lies within the given range, else it returns false