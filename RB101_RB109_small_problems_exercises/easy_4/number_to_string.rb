=begin
Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, 
String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct 
the string by analyzing and manipulating the number.

*** Understanding the Problem ***
-Input: integer
-Output: string representation of the given integer
-Rules: 
  -arguments will be either positive integer or 0
  -cannot use any standard Ruby conversion methods

*** Data structures ***
-input: integer
-convert integer to array of digits
-output: string

*** Algorithm ***
-initialize a constant variable that will store a hash lookup table to convert integer digits to string versions
-define method named integer_to_string that takes one parameter
-initialize final_string = ''
-convert integer to an array of digits using Integer#digits, then reverse the array
-iterate through the array
  -final_string += HASH[digit]
-return the final_string
=end

DIGITS = {
  0 => '0',
  1 => '1',
  2 => '2', 
  3 => '3', 
  4 => '4', 
  5 => '5', 
  6 => '6', 
  7 => '7', 
  8 => '8', 
  9 => '9', 
}

def integer_to_string(int)
  final_string = ''
  int.digits.reverse.each { |digit| final_string += DIGITS[digit] }
  final_string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

