# 2 --> 2
# 4 6 --> 10
# 8 10 12 --> 30
# 14 16 18 20 --> 68
# 22 24 26 28 30 --> 130

def sum_even_number_row(row_number)
  # 1. create an empty array 'rows' to contain all rows
  rows = []
  start_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  rows.last.sum # sum up all integers of last row and return
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

# p sum_even_number_row(1) == 2 # true
# p sum_even_number_row(2) == 10 # true
# p sum_even_number_row(4) == 68 # true

# p create_row(2, 1) == [2] # true
# p create_row(4, 2) == [4, 6] # true
# p create_row(8, 3) == [8, 10, 12] # true

# 0, 2, 4, 6, 8, 10...
# geometrical progression: b(n) = b(1) * q**(n-1)
# b (6441) = 2 * q**(6440)

# a = {a: 1, b: 2}
# p a.object_id
# a = a.map do |k, v|
#       puts v
#     end
# p a.object_id
# p a

# def star_method(stars)
#   arr = []
#   stars.each do |star| # 'Sirius'
#     arr.push(star.upcase) # 'SIRIUS'
#   end
#   arr # ['SIRIUS', 'RIGEL'...]
# end

# stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
# p stars_2 = star_method(stars_1) # ['SIRIUS', 'RIGEL'...]

# def star_method(stars)
#   arr = []
#   counter = 0

#   until counter == stars.size # == 5
#     star = stars[counter] # 'Sirius'
#     arr << star if star.size > 4 # 'Sirius', 'Rigel', 'Polaris', 'Altair'

#     counter += 1
#   end
#   arr
# end

# stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
# p stars_2 = star_method(stars_1)

# def star_method(stars)
#   for star in stars
#     star.downcase 
#     p star
#   end
# end

# stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
# p stars_2 = star_method(stars_1) 

# def star_method(stars)
#   arr = []
#   counter = 0

#   until counter == stars.size do
#     arr << stars[counter][0, 3] # 'Sirius'

#     counter += 1
#   end
#   arr
# end

# stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
# p stars_2 = star_method(stars_1) # ['Sir', 'Rig',...]