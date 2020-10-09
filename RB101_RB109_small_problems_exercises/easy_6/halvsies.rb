=begin
Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) 
that contain the first half and second half of the original Array, respectively. If the original array 
contains an odd number of elements, the middle element should be placed in the first half Array.

*** Understand the Problem ***
-Input: array
-Output: nested array
-Rules:
  -output array will contain two arrays
    -first array will contain the first half of the elements from the original array
    -second array will contain the second half
    -if original array has odd number of elements, the middle element will be placed in the first half array
    -if original array contains only 1 element, the element will be in the first half array, and the second
    half array will be empty
    -if original array is empty, return two empty arrays nested within the output array

*** Data Structures ***
-Input: array
-Output: nested array

*** Algorithm ***
-find where the halfway point of the array is: array.size / 2 if array.size is even, otherwise (array.size / 2) + 1
-call #slice! on the argument array and store that as first_half_array
  -parameter to #slice! will be (0, halfway point)
-return an array of first_half_array and what's remaining of your original array
=end

def halvsies(arr)
  if arr.size.even?
    halfway_placement = arr.size / 2
  else
    halfway_placement = (arr.size / 2) + 1
  end
  first_half_arr = arr.slice!(0, halfway_placement)
  [first_half_arr, arr]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]