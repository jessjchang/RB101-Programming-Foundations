=begin
Given an unordered array and the information that exactly one value in the array occurs twice 
(every other value occurs exactly once), how would you determine which value occurs twice? 
Write a method that will find and return the duplicate value that is known to be in the array.

*** Understand the Problem ***
-Input: array
-Output: integer
  -the duplicated element from the argument array
-Rules:
  -in the argument array, only one element will occur twice. All other elements only occur once in the
  argument array
-Question:
  -assuming argument array will only ever consist of integers?

*** Data Structures ***
-Input: array
-Output: integer

*** Algorithm ***
-set an empty array to store what you've iterated through so far
-iterate through the argument array
  -if storage array includes the current element, then return the current element and stop iterating
  -push each element into empty array
=end

def find_dup(arr)
  storage_arr = []
  arr.each do |num|
    return num if storage_arr.include?(num)
    storage_arr << num
  end
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73