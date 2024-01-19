# Description
# You are given a method named spin_me that takes a string as an argument 
# and returns a string that contains the same words, but with each word's 
# characters reversed. Given the method's implementation, will the returned 
# string be the same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

a = "hello world"
spin_me(a) # "olleh dlrow"

p a # different object because of the 'split' method

a = 'abc'
b = a.split.join # => 'abc'
a.object_id # => 89080
b.object_id # => 101980