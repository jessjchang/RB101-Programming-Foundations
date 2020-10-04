=begin
Write a method that takes a String of digits, and returns the appropriate number as an integer. 
For now, do not worry about leading + or - signs, nor should you worry about invalid characters; 
assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, 
Integer(), etc. Your method should do this the old-fashioned way and calculate the result by 
analyzing the characters in the string.

*** Understanding the Problem ***
-Input: string - each character in the string will be numeric
-Output: integer - the digits from the given string as an integer instead

*** Data structures ***
-input: string
-output: integer
-use a hash to represent my table of converting string version of digits to integers
-use array to store each digit after I've converted

*** Algorithm ***
-initialize a constant variable - a hash table representing string value to integer of each digit 0-9
  -{'0' => 0, '1' => 1, etc.}
-define method named string_to_integer that takes one parameter
-initialize an empty array 
-iterate through the string
  -array << HASH[character]
-Use Enumerable#inject method to essentially join the array into a single integer
=end

DIGITS = {
  '0' => 0,
  '1' => 1, 
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9
}

def string_to_integer(string)
  digit_array = []
  string.each_char do |char|
    digit_array << DIGITS[char]
  end
  digit_array.inject { |running_sum, digit| running_sum * 10 + digit }
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# Further Exploration
=begin
-To find the integer value of a hexadecimal, the rules are:
-e.g. for the argument '4D9f':
  -first, reverse the string
  -take the first character, 'f', look up in the HEX table (build case-insensitivity into the method) for its integer value
    -multiply by 16 ** 0, which is essentially 16 ** index
  -take the next character, 'D', look up in HEX table for integer value
    -multiply that value by 16 ** 1, and add to the previous resulting value for 'f'
  -continue on, adding to the sum each time

*** Algorithm ***
-initialize a constant hash table to look up each character in
-initialize a final integer variable equal to 0 that will act as my final sum counter
-split the string into an array of separate characters
-reverse the array
-iterate through the array
  -look up the uppercased character in the hash
  -multiply the integer value by (16 ** current index)
  -add to the final integer variable
-return the final integer variable
=end

HEX = {
  '0' => 0,
  '1' => 1, 
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'A' => 10,
  'B' => 11,
  'C' => 12,
  'D' => 13,
  'E' => 14,
  'F' => 15
}

def hexadecimal_to_integer(string)
  integer = 0
  string.chars.reverse.each_with_index do |char, index|
    integer += HEX[char.upcase] * (16 ** index)
  end
  integer
end

p hexadecimal_to_integer('4D9f') == 19871
