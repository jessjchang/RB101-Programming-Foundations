=begin
Write a method that takes a number as an argument. If the argument is a positive number, return the 
negative of that number. If the number is 0 or negative, return the original number.

*** Understand the Problem ***
-Input: integer (positive or negative)
-Output: integer (positive or negative)
-Rules:
  -if input integer is positive, return negative of the number
  -if input inger is 0 or negative, return the input integer

*** Data Structures ***
-Input: integer
-Output: integer

*** Algorithm ***
-check if input is greater than 0
  -if it is, return input * -1
  -if not, return input
=end

def negative(num)
  num > 0 ? (num * -1) : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby