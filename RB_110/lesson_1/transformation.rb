def double_numbers(numbers, criteria)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * criteria

    counter += 1
  end
  # not mutated
  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers(my_numbers, 3)
p my_numbers

# def double_numbers!(numbers, criteria)
#   counter = 0

#   loop do
#     break if counter == numbers.size
#     numbers[counter] *= criteria
#     counter += 1
#   end
#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers!(my_numbers, 3) # => [2, 8, 6, 14, 4, 12]
# p my_numbers

# def double_odd_numbers(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     current_number *= 2 if counter.odd?
#     doubled_numbers << current_number

#     counter += 1
#   end

#   doubled_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# # not mutated
# p my_numbers                      # => [1, 4, 3, 7, 2, 6]