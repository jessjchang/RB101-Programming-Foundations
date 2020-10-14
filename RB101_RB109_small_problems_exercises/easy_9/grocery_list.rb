=begin
Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array 
of the correct number of each fruit.

*** Understand the Problem ***
-Input: array of arrays
  -sub-arrays will include 1 string (fruit) and 1 integer (quantity)
-Output: array of strings
-Rules: 
  -output array will be a flattened array of strings
    -each string will be a fruit from the input array, and that string will appear in the array however
    many times the quantity is denoted in the corresponding input sub-array

*** Data Structures ***
-Input: array
-Output: array
-strings
-integers

*** Algorithm ***
-initialize empty array to store result
-iterate through input array, and for each sub-array
  -do sub_array[1] times: append sub_array[0] to the results array
-return the results array
=end

def buy_fruit(arr)
  arr.each_with_object([]) do |sub_arr, result|
    sub_arr[1].times { result << sub_arr[0] }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]