produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash, criteria)
  hash_arr = hash.to_a
  counter = 0
  new_array = []

  loop do
    value = hash_arr[counter][1]
    if value == criteria
      new_array << hash_arr[counter]
    end
    counter += 1
    break if counter == hash_arr.size
  end

  new_array.to_h
end

p select_fruit(produce, 'Vegetable') # => {"apple"=>"Fruit", "pear"=>"Fruit"}
p produce # => {"apple"=>"Fruit", "carrot"=>"Vegetable", "pear"=>"Fruit", "broccoli"=>"Vegetable"}
