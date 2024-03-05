# Are they the "same"?
=begin
Given two arrays a and b write a function comp(a, b) that checks whether the 
two arrays have the "same" elements, with the same multiplicities. "Same" means, 
here, that the elements in b are the elements in a squared, regardless of the order.

Examples
Valid arrays
a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a, b) returns true because in b 121 is the square of 11, 
14641 is the square of 121, 20736 the square of 144, 
361 the square of 19, 25921 the square of 161, and so on. 
It gets obvious if we write b's elements in terms of squares:

a = [121, 144, 19, 161, 19, 144, 19, 11] 
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
Invalid arrays
If we change the first number to something else, comp may not return true anymore:

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 132 is not the square of any number of a.

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 36100 is not the square of any number of a.

P
Input: two arrays with integers
Output: boolean

Rules:
- take two arrays of the same size
- sort them and divide integers of b by every num a
- if returned num will be the same as in a
- return true, false otherwise

E
a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
a.sort
b.sort

a -> [11, 19, 19, 19, 121, 144, 144, 161] ---> size 8
b -> [121, 361, 361, 361, 14641, 20736, 20736, 25921] ---> size 8
121 / 11 = 11
361 / 19 = 19
...
true

D
Use arrays.

A
- SORT both arrays
- FIND if integers of 'b' are the squared nums of 'a'
- RETURN true if all nums are squares of 'a' in 'b', false otherwise
=end

# C
def comp(a, b)
  if a == nil || b == nil
    return false
  end

  a = a.sort
  b = b.sort
  c = true
  a.each_with_index do |num, i|
    c = false if (num ** 2 != b[i])
  end
  c
end

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
p comp(a, b)

c = [121, 144, 19, 161, 19, 144, 19, 11]  
d = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
p comp(c, d)

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
p comp(a,b)