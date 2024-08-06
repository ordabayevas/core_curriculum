def compute
  block_given? ? yield : 'Does not compute.'
end


p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further exploration
def compute(arg)
  if block_given?
    yield(arg)
  else
    "Does not compute this #{arg}."
  end
end

p compute(10) { |num| num + 3 } == 13
p compute('Harry') {|name| name + ' Potter'} == 'Harry Potter'
p compute('argument')
