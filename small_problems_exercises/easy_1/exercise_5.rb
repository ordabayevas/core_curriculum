def print_in_box(string)
  start_end = ''
  string.size.times do
    start_end << '-'
  end

  empty_middle = ''
  string.size.times do
    empty_middle << ' '
  end
  puts "+-#{start_end}-+", "| #{empty_middle} |", "| #{string} |", "| #{empty_middle} |", "+-#{start_end}-+"
end

print_in_box('Yerdos + Saltanat')