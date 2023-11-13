# my_solution
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

# LS solution
def print_in_box(message)
  horizontal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end

# Modify this method so it will truncate the message 
# if it will be too wide to fit inside a standard terminal window 
# (80 columns, including the sides of the box). For a real challenge, 
# try word wrapping very long messages so they appear on multiple lines, but still within a box.