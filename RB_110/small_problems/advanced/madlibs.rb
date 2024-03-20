# p file_data = file.read
# file_data = file.readlines.map(&:chomp)

def madlibs(file)
  hash = {adjective: ['quick', 'lazy', 'sleepy', 'ugly'], 
  noun: ['fox', 'dog', 'head', 'leg'], 
  verb: ['jumps', 'lifts', 'bites', 'licks'],
  adverb: ['easily', 'lazily', 'noisily', 'excitedly']}

  adjective ='quick'
  file = File.open(file)
  file_data = file.read
  hash.each do |key, value|
    while file_data.include?("%{#{key.to_s}}")
      file_data = file_data.sub("%{#{key.to_s}}", value.sample)
    end
  end
  file_data
end

# puts madlibs("madlibs.txt")

# $seed = (Time.now.to_f * 1000).to_i

def set_seed(seed)
  $seed = seed
end

def sample(array, seed)
  a = 1103515245
  b = 12345
  m = 32767
  new_seed = (a*seed + b) % m
  idx = seed % array.size
  return array[idx], new_seed
end

# set_seed(0)
arr = ["cat", "dog", "duck", "cow"]
elem, new_seed = sample(arr, (Time.now.to_f * 1000).to_i)
p [new_seed, elem]
elem, new_seed = sample(arr, new_seed)
p [new_seed, elem]
elem, new_seed = sample(arr, new_seed)
p [new_seed, elem]
elem, new_seed = sample(arr, new_seed)
p [new_seed, elem]
# p [$seed, sample(arr)]
# p [$seed, sample(arr)]
# p [$seed, sample(arr)]
# arr = ["home", "car", "money"]
# p [$seed, sample(arr)]
# p [$seed, sample(arr)]