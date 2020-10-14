=begin
A double number is a number with an even number of digits whose left-side digits are exactly the same 
as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 
are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a 
double number; double numbers should be returned as-is.

*** Understand the Problem ***
-Input: integer
-Output: integer
-Rules:
  -double number definition: a number with an even number of digits, and left-side digits are 
  exactly the same as right-side digits (e.g. if split the number in half, the number to the left
  would equal the number to the right of the mid-point)
  -output will be an integer
    -if the input integer is a double number, then return the integer itself
    -if input integer is not a double number, then return 2 * input integer

*** Data Structures ***
-Input: integer
-Output: integer
-use string to work with the size of the number

*** Algorithm ***
-convert the integer to a string and assign to a new variable
-return the input * 2 if size of string is odd
-find the midpoint of the string by dividing by 2
-call slice! on the string with the argument (0, midpoint) so you have two halves, and compare whether
they are equal
  -if they are, then return the input integer
  -if they are not, then return 2 * input integer
=end

def twice(num)
  num_string = num.to_s
  return (num * 2) if num_string.size.odd?
  midpoint = num_string.size / 2
  first_half = num_string.slice!(0, midpoint)
  if first_half == num_string
    num
  else
    num * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10