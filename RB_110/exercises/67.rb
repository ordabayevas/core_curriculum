# Is Integer Array?
=begin
Write a function with the signature shown below:

def is_int_array(arr)
  true
end
returns true / True if every element in an array is an integer or a float with no decimals.
returns true / True if array is empty.
returns false / False for every other input.

P
Input: array
Output: boolean

Rules:
- method takes an array
- if all nums in array is integer or float without decimals or array is empty return true
- if something else, false

E
[1.0, 2.0, 3.0001] --> false

D
array

A
- FIND the class of input
- CHECK all nums if integer or float
- FALSE otherwise
=end
require 'pry'
require 'pry-byebug'
# C
# def is_int_array(arr)
#   if arr.to_s.include?('nil')
#     # binding.pry
#     return false
#   elsif arr == []
#     return true
#   elsif arr.all?(Integer) || arr.all?(Float)
#     arr.all? { |num| num % 1 == 0 }
#   else
#     false
#   end
# end

def is_int(elem)
  if elem.class == Integer
    return true
  elsif elem.class == Float && elem % 1 == 0
    return true
  else
    return false
  end
end


def is_int_array(arr)
  if arr.class != Array
    return false
  end
  arr.all? {|elem| is_int(elem)}
end

p is_int_array([1, 2.0])