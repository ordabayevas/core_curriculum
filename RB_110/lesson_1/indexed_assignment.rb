# arr = [1, 2, 3, 4, 5]
# arr.each_index do |i|
#   arr[i] += 1
# end

# p arr         # => [2, 2, 3, 4, 5]

hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
# p hsh.object_id #60
# p hsh[:apple].object_id #80
# hsh.each_key do |key|
#   if key == :apple || key == :pear
#     hsh[key] = 'Fruit'
#   else
#     hsh[key] = 'Vegetable'
#   end
# end

# hsh
# p hsh.object_id #60
# p hsh[:apple].object_id #100

p hsh[:apple][0].object_id
p hsh[:apple][0].object_id