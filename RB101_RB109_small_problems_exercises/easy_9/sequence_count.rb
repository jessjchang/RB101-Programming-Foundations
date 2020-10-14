=begin
Create a method that takes two integers as arguments. The first argument is a count, 
and the second is the first number of a sequence that your method will create. 
The method should return an Array that contains the same number of elements as the count argument, 
while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, 
while the starting number can be any integer value. If the count is 0, an empty list should be returned.

*** Understand the Problem ***
-Input: 2 integers
  -first integer is a count
  -second integer is the first number of the returned array
-Output: array of integers
  -will contain same number of elements as first input argument (the count)
  -values of each element will be multiples of the second input argument, starting with the argument itself
-Rules:
  -multiples means num, num * 2, num * 3, etc.
  -count input argument will always be >= 0
  -if count argument is 0, return an empty array
  -starting number input argument (second argumet) can be any integer value, positive or negative

*** Data Structures ***
-Input: integer
-Output: array

*** Algorithm ***
-initialize empty array
-if count is 0, return the empty array
-from 1 up to the count
  -take the current_count * second starting input argument 
  -add it to the array
-return the array
=end

def sequence(count, starting_num)
  return [] if count == 0
  1.upto(count).with_object([]) { |current_count, multiples| multiples << (current_count * starting_num) }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []