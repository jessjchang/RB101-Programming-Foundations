=begin
Write a method that takes one argument, an array containing integers, 
and returns the average of all numbers in the array. 
The array will never be empty and the numbers will always be positive integers. 
Your result should also be an integer.

Examples:
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

Expected output:
true
true
true

*** Understand the problem ***
-write method named average
-input:
  -pass in one argument (array of integers)
-output:
  -number (integer) 
    -the average of all numbers in the array
    -assuming if array consists of just one element, it will just return that integer?
-rules:
  -array will never be empty
  -numbers will always be positive integers
  -average means the quotient of dividing sum of all the integers in the array and dividing by the number
  of integers in the array
  -the average calculated will always be outputted as an integer

*** Data structures ***
-input is an array of integers
-output is integer

*** Algorithm ***
1. define method with one parameter, an array of positive integers
2. set sum variable equal to 0
3. iterate through the array and add each element to the sum 
4. output quotient of sum divided by the size of the array (i.e. number of elements in the array)
=end

# *** CODE ***
def average(array)
  sum = 0
  array.each { |num| sum += num }
  sum / array.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Further Exploration
# change the return value of average from an Integer to a Float
def average_float(array)
  sum = 0
  array.each { |num| sum += num }
  sum.to_f / array.size
end

puts average_float([1, 6]) == 3.5
puts average_float([1, 5, 87, 45, 8, 8]) # => 25.666667
puts average_float([9, 47, 23, 95, 16, 52]) # => 40.3333
puts average_float([1, 5]) == 3.0