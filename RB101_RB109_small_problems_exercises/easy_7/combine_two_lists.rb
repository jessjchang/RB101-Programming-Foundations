=begin
Write a method that combines two Arrays passed in as arguments, and returns a new Array that 
contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

*** Understand the Problem ***
-Input: 2 arrays
-Output: a new array
-Rules:
  -both argument arrays will not be empty and will contain the same number of elements
  -returned array will contain all elements from both array arguments
-Assumptions:
  -order of the output array will be: 1st element of 1st argument array, 1st element of 2nd argument array,
  2nd element of 1st argument array, 2nd element of 2nd argument array, ...

*** Data Structures ***
-Input: 2 arrays
-Output: new array

*** Algorithm ***
-initialize empty results array to store each element
-set index = 0
-while index < size of either array (doeesn't matter because both arrays will be the same size)
  -push the element at current index of array 1 into the results array
  -push element at current index of array 2 into the results array
  -increment index
-return results array
=end

def interleave(arr1, arr2)
  combined_arr = []
  index = 0
  while index < arr1.size
    combined_arr << arr1[index]
    combined_arr << arr2[index]
    index += 1
  end
  combined_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Further Exploration
def interleave_with_zip(arr1, arr2)
  (arr1).zip(arr2).flatten
end

p interleave_with_zip([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

