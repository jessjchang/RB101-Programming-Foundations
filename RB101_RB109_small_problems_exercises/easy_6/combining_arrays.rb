=begin
Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values 
from the argument Arrays. There should be no duplication of values in the returned Array, even if there are 
duplicates in the original Arrays.

*** Understand the Problem ***
-Input: 2 arrays
-Output: 1 array
-Rules:
  -output array will contain all values from the argument array
  -output array will not have any duplicate values
-Question for interviewer: 
  -does the output array have to contain the elements in a particular order?

*** Data Structures ***
-Input: 2 arrays
-Output: array

*** Algorithm ***
-add the two argument arrays to form one array
-call Array#uniq on this array to weed out duplicate values

=end
def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]