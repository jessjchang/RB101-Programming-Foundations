=begin
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers 
are 1 by definition, and each subsequent number is the sum of the two previous numbers. 
This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. 
For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, 
especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number that has the number of 
digits specified as an argument. (The first Fibonacci number has index 1.)

You may assume that the argument is always greater than or equal to 2.

*** Understand the Problem ***
-Input: integer
  -represents the number of digits we're looking for
-Output: integer
  -represents the index of the first Fibonacci number in the Fibonacci sequence that has the number of digits
  given in the integer input 
-Rules:
  -when counting "index", the first number in the Fibonacci sequence has index 1 (so, we're not using 0-index)
  -the given argument will always be greater than or equal to 2 (two digits or greater)

*** Data Structures ***
-Input: integer
-Output: integer
-use an array to represent fibonacci sequence

*** Algorithm ***
-set an array = [1, 1]
-set sum = 0
-set index = 2
-while sum.digits.size < argument 
  -sum = (array.first + array.last)
  -array.shift to remove the first element
  -array << sum
  -index += 1
-return index
=end

def find_fibonacci_index_by_length(num_digits)
  current_fib_sequence = [1, 1]
  sum = 0
  index = 2
  while sum.digits.size < num_digits
    sum = (current_fib_sequence.first + current_fib_sequence.last)
    current_fib_sequence.shift
    current_fib_sequence << sum
    index += 1
  end
  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782 
p find_fibonacci_index_by_length(10000) == 47847