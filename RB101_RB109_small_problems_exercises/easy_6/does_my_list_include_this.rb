=begin
Write a method named include? that takes an Array and a search value as arguments. 
This method should return true if the search value is in the array, false if it is not. 
You may not use the Array#include? method in your solution.

*** Understand the Problem ***
-Input: 2 arguments - an array and a search value
-Output: boolean (true or false)
-Rules:
  -cannot use Array#include? method
  -return true if given search value is in the given array, return false if not
-Assumptions:
  -search value can be of any object type 
  -array argument can consist of elements of any object type

*** Data Structures ***
-Input: array and a search value
-Output: boolean

*** Algorithm ***
-iterate through the given array
  -return true and stop iterating if the current element equals the search value
-otherwise, return false
=end

def include?(arr, search_value)
  arr.each { |element| return true if element == search_value }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# Further Exploration
def include2?(arr, search_value)
  arr.any?(search_value)
end

p include2?([1,2,3,4,5], 3) == true
p include2?([1,2,3,4,5], 6) == false
p include2?([], 3) == false
p include2?([nil], nil) == true
p include2?([], nil) == false