=begin
Write a method that takes an integer argument, and returns an Array of all integers, in sequence, 
between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

*** Understand the Problem ***
-Input: integer
-Output: array of integers
  -all integers between 1 and the input integer, inclusive
  -sorted in numerical order smallest to largest
-Rules:
  -input number will always be a valid integer and will always be positive (> 0)

*** Data Structures ***
-Input: integer
-Output: array

*** Algorithm ***
-set an empty array to store integers
-from 1 up to the input, iterate through and add current number to the array
-return array
=end

def sequence(num)
  1.upto(num).with_object([]) { |current_num, arr| arr << current_num }
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# Further Exploration
def sequence2(num)
  num > 0 ? (1..num).to_a : (num..-1).to_a
end

p sequence2(5) == [1, 2, 3, 4, 5]
p sequence2(-5) == [-5, -4, -3, -2, -1]

