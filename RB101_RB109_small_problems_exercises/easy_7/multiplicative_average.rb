=begin
Write a method that takes an Array of integers as input, multiplies all the numbers together, 
divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal 
places. Assume the array is non-empty.

*** Understand the Problem ***
-Input: array of integers
-Output: string
  -multiply all numbers of input array together and divide by number of elements in array
  -round to 3 decimal places
  -return a string that says "The result is #{calculation}"
-Rules:
  -input array will always be non-empty and contain only integers

*** Data Structures ***
-Input: array
-Output: string
-use floats

*** Algorithm ***
-use #reduce to multiply all elements of input array together
-divide by array size, converted to a float
-return result rounded to 3 decimal places using #format
-output the string
=end

def show_multiplicative_average(arr)
  puts "The result is #{format('%.3f',(arr.reduce(:*) / arr.size.to_f))}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667