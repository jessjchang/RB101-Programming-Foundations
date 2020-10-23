=begin
Write a method that can rotate the last n digits of a number. For example:

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

*** Understand the Problem ***
-Input: 2 integers
-Output: 1 integer
-Rules:
  -second input integer represents the last n digits of the first input integer that should be rotated
  -if n = 1, then return the original input number (1st input)
  -n will always be a positive integer
  -may use the previous rotate_array method
  -essentially, whatever n is, take that number of digits to the right of the 1st input integer, and if you
  convert that number to an array, call rotate_array on it in order to perform the rotation
-Questions:
  -will input number always be a positive integer as well?
  -if for example input arguments are (102345, 6), should output be 023451 or 23451?
  -assuming n will always be less than or equal to the number of digits in the input integer?

*** Data Structures ***
-Input: integers
-Output: integer
-string
-array

*** Algorithm ***
-convert the number into a string and store in a new local variable e.g. num_string
-remove n digits from the end of num_string and store in another variable e.g. num_slice
  -can use #slice! method e.g. if n = 2 call num_string.slice!(-2, 2) to remove the last 2 digit characters
  from the string and mutate num_string as we do so
-call rotate_array on num_slice.chars and #join back into a string
-append num_slice back to num_string
-return num_string converted back to an integer
=end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, n)
  num_string = num.to_s
  num_string << (rotate_array(num_string.slice!(-n, n).chars)).join
  num_string.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917