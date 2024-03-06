# Format a string of names like 'Bart, Lisa & Maggie'.
=begin
Given: an array containing hashes of names
Return: a string formatted as a list of names separated by commas 
except for the last two names, which should be separated by an ampersand.

Example:

list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# returns 'Bart, Lisa & Maggie'

list([ {name: 'Bart'}, {name: 'Lisa'} ])
# returns 'Bart & Lisa'

list([ {name: 'Bart'} ])
# returns 'Bart'

list([])
# returns ''
Note: all the hashes are pre-validated and will only contain A-Z, a-z, '-' and '.'.

P
Input: hash with names
Output: string of names

Rules:
- take names and return string of names
- names separated with commas, except last two

D
Create a string

A
- CREATE an array of values
  - hash.values
- FIND the length of the names array
  - array.size
    - if 1, return the name as string
    - if 2, return names with ampersand
    - if 3 or more, return with commas and the last two with ampersand
- ADD to string
=end

# C
def list(array)
  names = array.map do |hash|
    hash.map do |k, v|
      v
    end
  end

  names = names.flatten
  length = names.size
  case length
  when 0
    ''
  when 1
    "#{names[0]}"
  when 2
    "#{names[0]} & #{names[1]}"
  else
    first = names[0..-3].map { |name| name.concat(', ') }.join
    second = names[-2..-1].join(' & ')
    first + second
  end
end

# p list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# # returns 'Bart, Lisa & Maggie'

# p list([ {name: 'Bart'}, {name: 'Lisa'} ])
# # returns 'Bart & Lisa'

# p list([ {name: 'Bart'} ])
# # returns 'Bart'

# p list([])
# returns ''

# p list([{name: 'Seymour'}, {name: 'Marge'}, {name: ''}, {name: 'Maude'}, {name: 'Lisa'}, {name: ''}, {name: ''}, {name: 'Barney'}, {name: 'Homer'}, {name: ''}])
#"Seymour, Marge, , Maude, Lisa, , , Barney, Homer & ", instead got: "Seymour, Marge, , Maude, Lisa, , , Barney & Homer, "

p list([{name: 'Seymour'}, {name: ''}])
