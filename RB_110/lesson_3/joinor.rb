# joinor([1, 2])                   # => "1 or 2"
# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

def joinor(array, sign=', ', word='or')
  new_string = ''
  if array.empty? || array.size == 1
    return array[0].to_s
  elsif array.size == 2
    new_string << "#{array[0]} #{word} #{array[1]}"
  else
    new_array = array.slice(0..-2)
    last_element = "#{word} #{array[-1]}"
    new_array.each { |num| new_string << "#{num}#{sign}" }
    new_string << last_element
  end
end

p joinor([1, 2, 3])
p joinor([1, 2])
p joinor([1, 2, 3], '; ')
p joinor([1, 2, 3], ', ', 'and')
  