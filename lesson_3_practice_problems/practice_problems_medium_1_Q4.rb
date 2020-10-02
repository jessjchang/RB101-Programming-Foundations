def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

buffer = [1, 2, 3]
new_element = 'hello'
max_buffer_size = 3
p rolling_buffer1(buffer, max_buffer_size, new_element) # => [2, 3, 'hello']
p buffer # => [2, 3, 'hello']

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

input_array = [1, 2, 3]
new_element = 'hello'
max_buffer_size = 3
p rolling_buffer2(input_array, max_buffer_size, new_element) # => [2, 3, 'hello']
p input_array # => [1, 2, 3]