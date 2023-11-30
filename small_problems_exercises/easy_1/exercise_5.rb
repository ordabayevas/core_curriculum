# # my_solution
# def print_in_box(string)
#   start_end = ''
#   string.size.times do
#     start_end << '-'
#   end

#   empty_middle = ''
#   string.size.times do
#     empty_middle << ' '
#   end
  
#   puts "+-#{start_end}-+", "| #{empty_middle} |", "| #{string} |", "| #{empty_middle} |", "+-#{start_end}-+"
# end

# print_in_box('Yerdos + Saltanat')

# # LS solution
# def print_in_box(message)
#   horizontal_rule = "+#{'-' * (message.size + 2)}+"
#   empty_line = "|#{' ' * (message.size + 2)}|"

#   puts horizontal_rule
#   puts empty_line
#   puts "| #{message} |"
#   puts empty_line
#   puts horizontal_rule
# end

# Modify this method so it will truncate the message 
# if it will be too wide to fit inside a standard terminal window 
# (80 columns, including the sides of the box). For a real challenge, 
# try word wrapping very long messages so they appear on multiple lines, but still within a box.
# FRAME_SIZE = 80
# STRING_ROW_SIZE = 80

# def print_in_box(string)
#   if string.size <= STRING_ROW_SIZE
#     string
#   elsif string.size > STRING_ROW_SIZE
#     string1 = string[0...STRING_ROW_SIZE]
#     string2 = string[STRING_ROW_SIZE..string.size] + (' ' * (FRAME_SIZE - string[STRING_ROW_SIZE..string.size].length))
#   end

#   start_end = ''
#   FRAME_SIZE.times do
#     start_end << '-'
#   end

#   empty_middle = ''
#   FRAME_SIZE.times do
#     empty_middle << ' '
#   end
  
#   puts "+-#{start_end}-+", "| #{empty_middle} |", "| #{string1} |", "| #{string2} |", "| #{empty_middle} |", "+-#{start_end}-+"
# end


# print_in_box('Humic and fulvic acids from several sources were separated into three spectral types depending upon their infrared absorption')
FRAME_SIZE = 80

def message_line(message, frame_size)
  empty_size = frame_size - message.size + 1
  line = "|#{' '+ message  + ' ' * empty_size}|"
end


def print_in_box(message)
  frame_size = [message.size, FRAME_SIZE].min 
  horizontal_rule = "+#{'-' * (frame_size + 2)}+"
  puts horizontal_rule
  puts message_line('', frame_size)
  loop do
    if message.size > frame_size
      msg = message.byteslice(0...frame_size)
      puts message_line(msg, frame_size)
      message = message.byteslice(frame_size..-1)
    else
      puts message_line(message, frame_size)
      break
    end
  end
  puts message_line('', frame_size)
  puts horizontal_rule
end

print_in_box('Humic and fulvic acids from several sources were separated into three spectral types depending upon their infrared absorption Humic and fulvic acids from several sources were separated into three')