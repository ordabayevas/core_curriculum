# def convert(string)
#   new_str = ''
#   string.each_char do |char|
#     new_str << yield(char)
#   end
#   new_str
# end

# p convert('A simple string') { |char| char.upcase } # => "A SIMPLE STRING"
# p convert('xyyz') { |char| char + char }            # => xxyyyyzz
# p convert('Ready? Set. Go!') {|char| char == ' ' ? '' : char} 
# p convert('Ready? Set. Go!') do |char|
#   char == ' ' ? '' : char
# end

arr = ['a', 'b', 'c']

def foo(array)
  kk = nil
  array.map do |el|
    kk = yield(el)
  end
  kk
end

a = foo(arr) do |value|
  binding.local_variables
end

hsh = { a: 3, b: 2, c: 5 }

def bar(qux)
  qux += 2
end

puts a
# a.eval(arr)

