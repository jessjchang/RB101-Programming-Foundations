=begin
Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

Examples:
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

*** Understand the problem ***
-write method named digit_list
-input:
  -pass in one argument (positive integer) to method
-output:
  -array with each digit of integer as a separate element

*** Data structures ***
-easiest to convert integer passed in to a string so we can easily split the digits (i.e. each character)

*** Algorithm ***
1. define method with one parameter, a positive integer
2. convert integer to string
3. call String#split method on the string to separate each character
4. iterate through the resulting array to convert each character back to a single integer value
  -Array#map method

=end

# *** CODE ***
def digit_list(num)
  string_array = num.to_s.split('')
  num_array = string_array.map { |str| str.to_i }
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
