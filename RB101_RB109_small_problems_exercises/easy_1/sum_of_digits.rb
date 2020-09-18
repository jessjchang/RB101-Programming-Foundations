=begin
Write a method that takes one argument, a positive integer, and returns the sum of its digits.
For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

Examples:
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

Expected output:
true
true
true

*** Understand the problem ***
-write method named sum 
-input:
  -pass in one argument (a positive integer)
  -underscores are allowed in input to separate digits
-output:
  -an integer (the sum of the given integer's digits)
  -assuming if integer only consists of 1 digit, output will be the integer itself?

*** Additional Examples/test cases: ***
puts sum(2) == 2
puts sum(12_34_5678) == 36

*** Data structures ***
-input is an integer
-convert input integer into an array, with each element being a digit
-output is an integer

*** Algorithm ***
1. define method with one parameter, a positive integer
2. use Integer#digits method to return array with each digit being a separate element
3. sum up each element in the array
=end

# *** CODE ***
def sum(int)
  int.digits.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
puts sum(2) == 2
puts sum(12_34_5678) == 36