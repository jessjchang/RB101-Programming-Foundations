=begin
Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, 
String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

*** Understanding the Problem ***
-Input: integer
-Output: string representation of the integer
-Rules:
  -if integer is positive, prepend a '+' at the beginning of the output string
  -if integer is negative, prepend a '-' at beginning of output string
  -if integer is 0, just return 0

*** Data structures ***
-input: integer
-output: string

*** Algorithm ***
-initialize a constant array containing string representations of each digit
-define method named signed_integer_to_string that takes one parameter
-initialize final_string = ''
-if integer == 0
  -return '0'
-elsif integer < 0,
  -multiply integer by -1
  -add '-' to final_string
-else
  -add '+' to final_string
-convert integer to an array of digits using Integer#digits, then reverse the array
-iterate through the array
  -final_string += DIGITS[digit]
-return the final_string
=end

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def signed_integer_to_string(int)
  final_string = ''
  if int == 0
    return '0'
  elsif int < 0
    int *= (-1)
    final_string << '-'
  else
    final_string << '+'
  end
  
  int.digits.reverse.each { |digit| final_string += DIGITS[digit] }
  final_string
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

# Further Exploration
def integer_to_string(int)
  final_string = ''
  int.digits.reverse.each { |digit| final_string += DIGITS[digit] }
  final_string
end

def signed_integer_to_string2(number)
  sign = number < 0 ? '-' : number > 0 ? '+' : ''
  sign + integer_to_string(number.abs)
end


p signed_integer_to_string2(4321) == '+4321'
p signed_integer_to_string2(-123) == '-123'
p signed_integer_to_string2(0) == '0'