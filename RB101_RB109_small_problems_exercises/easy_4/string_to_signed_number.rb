=begin
Write a method that takes a String of digits, and returns the appropriate number as an integer. 
The String may have a leading + or - sign; if the first character is a +, 
your method should return a positive number; if it is a -, your method should return a negative number. 
If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), 
etc. You may, however, use the string_to_integer method from the previous lesson.

*** Understanding the Problem ***
-input: string of digits
-output: integer - string as an integer
-Rules:
  -elements will always be digits, aside from potentially a + or - as the first character
  -if + as the first character or no sign at all, then output should be a positive integer
  -if - as the first character, then output should be a negative integer

*** Data structures ***
-input: string
-output: integer
-use hash as lookup table

*** Algorithm ***
-initialize the same DIGITS hash as in previous problem
-initialize final integer variable = 0
-convert string to array of characters
-iterate through the array using Array#map and set equal to a new array
  -if current_character == '+' or a '-'
    -then next
  -else
    -look up each character in DIGITS hash and convert to its integer value
-iterate through the new array
  -for each digit, final_integer = 10 * final_integer + digit
-if original string[0] == '-'
  -return final_integer * -1
-else
  -return final_integer
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

def string_to_signed_integer(string)
  final_integer = 0
  char_array = string.chars.map do |char|
                 if char == '+' || char == '-'
                   0
                 else
                   DIGITS[char]
                 end
               end
  char_array.each do |num|
    final_integer = 10 * final_integer + num
  end
  if string[0] == '-'
    final_integer * (-1)
  else
    final_integer
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# Further Exploration
def string_to_integer(string)
  digit_array = []
  string.each_char do |char|
    digit_array << DIGITS[char]
  end
  digit_array.inject { |running_sum, digit| running_sum * 10 + digit }
end

def string_to_signed_integer2(string)
  final_integer = string_to_integer(string.delete('+-'))
  string.start_with?('-') ? -final_integer : final_integer
end

p string_to_signed_integer2('4321') == 4321
p string_to_signed_integer2('-570') == -570
p string_to_signed_integer2('+100') == 100