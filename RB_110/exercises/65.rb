# Who likes it?
=begin
You probably know the "like" system from Facebook and other pages. People can 
"like" blog posts, pictures or other items. We want to create the text that should 
be displayed next to such an item.

Implement a function likes :: [String] -> String, which must take in input array, 
containing the names of people who like an item. It must return the display text as 
shown in the examples:

likes [] // must be "no one likes this"
likes ["Peter"] // must be "Peter likes this"
likes ["Jacob", "Alex"] // must be "Jacob and Alex like this"
likes ["Max", "John", "Mark"] // must be "Max, John and Mark like this"
likes ["Alex", "Jacob", "Mark", "Max"] // must be "Alex, Jacob and 2 others like this"

P
Input: array with names
Output: string

Rules:
- take array of names
- depends on size of array, return string with names

E
["Alex", "Jacob", "Mark", "Max"] -> "Alex, Jacob and 2 others like this"

D
Use array and string.

A
- FIND the length of array
- RETURN string interpolation:
  - if 0, then 'no one likes this'
  - if 1, then "'name' likes this'
  - if 2, then "'name' and 'name' like this"
  - if 3, then "'name', 'name' and 'name' like this"
  - if 4, then "'name', 'name' and 2 others like this"
  - if more, then "'name', 'name' and (size - 2) others like this"
=end

# C
def likes(array)
  length = array.size
  case length
  when 0
    'no one likes this'
  when 1
    name1 = array[0]
    "#{name1} likes this"
  when 2
    name1 = array[0]
    name2 = array[1]
    "#{name1} and #{name2} like this"
  when 3
    name1 = array[0]
    name2 = array[1]
    name3 = array[2]
    "#{name1}, #{name2} and #{name3} like this"
  else
    name1 = array[0]
    name2 = array[1]
    others = array.size - 2
    "#{name1}, #{name2} and #{others} others like this"
  end
end

p likes [] #// must be "no one likes this"
p likes ["Peter"] #// must be "Peter likes this"
p likes ["Jacob", "Alex"] #// must be "Jacob and Alex like this"
p likes ["Max", "John", "Mark"] #// must be "Max, John and Mark like this"
p likes ["Alex", "Jacob", "Mark", "Max"] #// must be "Alex, Jacob and 2 others like this"
