=begin
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, 
and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not 
(it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number 
that is greater than the argument. Issue an error message if there is no next featured number.

*** Understand the Problem ***
-Input: integer
-Output: integer or string
  -next featured number greater than the argument
  -issue error message if no next featured number
-Rules: 
  -featured number: 
    -odd number
    -multiple of 7
    -digits occur exactly once each

*** Data Structures ***
-Input: integer
-Output: integer
-array

*** Algorithm ***
-write helper method to determine whether number is a featured number
  -if num.odd?
  -if num % 7 == 0
  -if num.digits.uniq.size == num.digits.size
-if argument integer is even, add 1 to get starting number, otherwise add 2
-loop
  -check if the number is a featured number, and if it is then return that number
  -increment starting number by 2 each time
  -break out of loop if number is > than the largest unique number possible (i.e. for digits 0-9, if we
  can only use the digits 0-9 once each, then largest possible unique number is 9876543210)
-issue error message if had to break out of loop
=end

def featured_num?(num)
  num.odd? && (num % 7 == 0) && (num.digits.uniq.size == num.digits.size)
end

def featured(num)
  current_num = (num.even? ? num + 1 : num + 2)
  loop do
    return current_num if featured_num?(current_num)
    current_num += 2
    break if num > 9_876_543_210
  end
  'There is no possible number that fulfills those requirements.'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements