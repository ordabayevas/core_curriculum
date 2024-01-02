# 2 --> 2
# 4 6 --> 10
# 8 10 12 --> 30
# 14 16 18 20 --> 68
# 22 24 26 28 30 --> 130

def sum_even_number_row(row_number)
  # 1. create an empty array 'rows' to contain all rows
  rows = []
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
  end
  # 2. create an array with row
  rows # sum up all integers and return
end

def create_row(start_integer, row_length)
  # 1. create an empty row array
  row = []
  current_integer = start_integer
  # 2. add the starting integer
  # 3. increment the starting integer by 2
  # 4. repeat steps 2 & 3 until the array has reached the correct length
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end

p sum_even_number_row(1) == 2 # true
p sum_even_number_row(2) == 10 # true
p sum_even_number_row(4) == 68 # true

p create_row(2, 1) == [2] # true
p create_row(4, 2) == [4, 6] # true
p create_row(8, 3) == [8, 10, 12] # true