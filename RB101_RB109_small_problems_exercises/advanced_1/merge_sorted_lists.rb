=begin
Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all 
elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result 
array one element at a time in the proper order.

Your solution should not mutate the input arrays.

*** Understand the Problem ***
-Input: 2 arrays (sorted smallest to largest in value)
-Output: new array
-Rules:
  -solution can't just be one that uses #sort on a results array at the end, must build the results array
  one element at a time in the correct order
  -don't mutate the input arrays, output must be a new array
  -new array will contain every element from the 2 input arrays, in sorted order
  -empty arrays are valid as an input array, nothing is added to the output array from an empty input array
-Questions:
  -will input arrays always only either be empty or contain integers?

*** Data Structures ***
-Input: array
-Output: array
-integer

*** Algorithm ***
-initialize an empty results array
-initialize a variable to keep track of the 2nd array index you're on to 0
-iterate through the first given array
  -loop:
    -break if index >= size of the 2nd array or if value of the 2nd array at the current index > current 1st
    array value
    -push the 2nd array value to the results array
    -increment the index
  -push the 1st array value into the results array
-add the results array and whatever hasn't been added yet in the 2nd array together
=end

def merge(arr1, arr2)
  merged_arr = []
  index = 0
  arr1.each do |arr1_value|
    loop do
      break if index >= arr2.size || arr2[index] > arr1_value
      merged_arr << arr2[index]
      index += 1
    end
    merged_arr << arr1_value
  end
  merged_arr + arr2[index..-1]
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]