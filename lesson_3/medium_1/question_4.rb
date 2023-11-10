def rolling_buffer1(buffer, max_buffer_size, new_element) # mutates the original
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element) # non-mutating
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# buffer = [2, 3, 4, 5, 6, 22, 34, 23, 18, 77]
# p rolling_buffer2(buffer, 10, 10)
# p buffer