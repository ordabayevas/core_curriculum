# 1) a method that returns the sum of two integers
# Informal:
Given two parameters of integers
- define a method called sum and pass two arguments into method
- add two passed arguments and return the result
- print the result

# Formal:
START method sum with two arguments (n, m)
add arguments n + m
END

PRINT method sum with two integers

# Code:
def sum(n, m)
  return n + m
end

puts sum(3, 4)

# 2) a method that takes an array of strings, and returns a string that is all those strings concatenated together
# Informal:
Given an array of string objects
- define a method called sum_string with one argument
- initialize the variable sum with empty string object to collect the added strings of given array
- inside the method iterate all string objects in array
- with every iteration loop add iterator to variable sum
- print the value of sum

# Formal:
START a method sum_string with 1 argument (array)
  SET a variable sum to empty string
  iterate over strings in array
    with every iteration loop add an iterator to variable sum
  end of loop
END

PRINT sum_string(array)

# Code
array1 = ['a', 'p', 'p', 'l', 'e']

def sum_string(array)
  sum = ''
  array.each do |string|
    sum += string
  end
  return sum
end

puts sum_string(array1)

# 3) a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element

#Informal:
Given an array of integers
- define a method with 1 array argument
- initialize a variable counter and assign to value 0
- iterate through argument
- with every iteration add 1 to counter
- if counter value (number of iteration) is odd, return iterator
- if even - omit the iteration and go to the next
- print result

# Formal
START method every_other with argument (arg)
  SET variable counter = 0
  iterate argument with method select and iterator
    if counter is odd number
      return iterator
    else
      go to the next iteration loop
    end of condition
  end of loop
END

PRINT every_other(argument)

# Code:
def every_other(arg)
  counter = 0
  arg.select do |num|
    counter +=1
    if counter.odd?
      num
    else
      next
    end
  end
end

array2 = [2, 3, 5, 7, 1, 8, 3]
p every_other(array2)

# 4) a method that determines the index of the 3rd occurrence of a given character in a string. 
# For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). 
# If the given character does not occur at least 3 times, return nil.

# Informal:
For a given string and a target charachter:
- convert string into list of characters
- define a method which returns an index of 3rd occurrence of target charachter
- initialize a counter to count every match
- initialize a counter to count an indices
- iterate through new list of characters
- return an index if counter of matches equals 3
- otherwise if number of matches is less than 3, return nil

# Formal:
convert string into new_string_array by splitting characters

START method called find_3rd_index with two arguments
  SET counter_character variable to 0
  SET counter_index variable to -1 (index number start with 0)
  loop through array
    add 1 to counter_index at every loop
    if iterator equals to target character
      add 1 to counter_character at every match
      if counter_character equals 3
        return value of counter_index
      end of if condition
    end of if condition
  end of loop
  otherwise return nil
END

PRINT find_3rd_index(new_string_array, target character)

# Code:
string = 'axbxcdxex'

new_string_array = string.split("")

def find_3rd_index(string, character)
  counter_char = 0
  counter_index = -1
  string.each do |i|
    counter_index += 1
    if i == character
      counter_char += 1
      if counter_char == 3
        return "#{counter_index}"
      end
    end
  end
  return
end

puts find_3rd_index(new_string_array, 'c')

# 5) a method that takes two arrays of numbers and returns the result of merging the arrays. 
# The elements of the first array should become the elements at the even indexes of the returned array,
# while the elements of the second array should become the elements at the odd indexes.

# Informal:
For given two arrays:
- define a method to merge arrays into one which accept two arrays
- initialize a new empty array
- iterate over the range of array indices
- add first and second array values at given index 1 by 1 to new array
- return new array

# Formal:
START method called merge with two array arguments
  SET new empty variable merged_array
  iterate each value of array1, array2 by index numbers in range 0 to array length
    push to merged_array values from first array and then second at every iteration loop
  end of loop
  return merged_array
END

PRINT merge(array1, array2)

# Code:
arr1 = [1, 2, 3, 5]
arr2 = [4, 5, 6, 7]
def merge(array1, array2)
  merged_array = []
  (0...array1.length).each do |i|
    merged_array.push(array1[i], array2[i])
  end
  return merged_array
end

p merge(arr1, arr2)