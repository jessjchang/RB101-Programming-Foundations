=begin
Write a method that determines and returns the ASCII string value of a string that is passed in as 
an argument. The ASCII string value is the sum of the ASCII values of every character in the string. 
(You may use String#ord to determine the ASCII value of a character.)

*** Understand the Problem ***
-Input: string
-Output: integer
  -ASCII string value of the given string
-Rules:
  -use String#ord to determine ASCII value of character
  -ASCII string value (the output) is the sum of ASCII values of each character in the string
  -if string is empty, return 0

*** Data Structure ***
-input: string
-output: integer

*** Algorithm ***
-if string is empty, return 0
-create storage variable for sum, initialize equal to zero
-iterate through string
  -for each character, find the ASCII value
  -add that value to the sum variable
-return sum
=end

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0