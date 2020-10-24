=begin
Write a method that computes the difference between the square of the sum of the first n positive integers 
and the sum of the squares of the first n positive integers.

*** Understand the Problem ***
-Input: integer
-Output: integer
-Rules:
  -argument n, where n is an integer, and we will perform the operations on the first n positive integers
  starting with 1 e.g. if argument is 3, we will be working with the integers 1, 2, 3
  -calculate sum of the squares of the first n positive integers, and subtract from the square of the sum
  of the first n positive integers

*** Data Structures ***
-Input: integer
-Output: integer

*** Algorithm ***
-initialize sum of squares variable to 0
-initialize square of sums variable to 0
-from 1 up to the argument integer
  -increment the square of sums variable by the current number
  -square the current number and increment the sum of squares variable by it
-take the square of the square of sums variable and compute difference with sum of squares variable
=end

def sum_square_difference(num)
  square_of_sums = 0
  sum_of_squares = 0
  1.upto(num) do |curr_num|
    square_of_sums += curr_num
    sum_of_squares += (curr_num ** 2)
  end
  (square_of_sums ** 2) - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150