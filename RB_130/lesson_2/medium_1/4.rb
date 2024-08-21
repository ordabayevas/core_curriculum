def variables(array)
  yield(array)
end

variables(%w(raven finch hawk eagle)) do |_, _, *raptors|
  puts "#{raptors.join(', ')}"
end


