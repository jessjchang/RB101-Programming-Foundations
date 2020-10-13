=begin
Write a method that takes an Array of numbers and then returns the sum of the sums of each leading 
subsequence for that Array. You may assume that the Array always contains at least one number.

*** Understand the Problem ***
-Input: array of numbers
-Output: integer
-Rules:
  -integer output is the sum of the sums of each leading subsequence for the given array
    -sum of: 
      -1st element
      -1st element + 2nd element
      -1st element + 2nd element + 3rd element
      ...
  -input array will always contain at least one number (e.g. won't be empty)
  -if input array contains only one number, output will just be that integer number
  -if input array is of size n, will sum n sums for your output

*** Data Structures ***
-Input: array
-Output: integer

*** Algorithm ***
-initialize empty sum_of_sums variable = 0
-loop array.size number of times
  -call reduce on the array to sum all elements and add to sum_of_sums 
  -call pop on the array to remove last element 
-return sum
=end

def sum_of_sums(arr)
  sum_of_sums = 0
  arr.size.times do 
    sum_of_sums += arr.reduce(:+)
    arr.pop
  end
  sum_of_sums
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35