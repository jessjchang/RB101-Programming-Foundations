=begin
Write a method that takes two Array arguments in which each Array contains a list of numbers, 
and returns a new Array that contains the product of every pair of numbers that can be formed 
between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

*** Understand the Problem ***
-Input: 2 arrays of numbers
-Output: new array
  -product of every pair of numbers that can be formed between elements of input arrays
-Rules:
  -neither input array will be empty and will only contain numbers
  -output array will always contain n number of elements, where n equals arr1.size * arr2.size
  -output array will be sorted smallest number to largest, and can contain duplicate products

*** Data Structures ***
-Input: array
-Output: array
-numbers/integers

*** Algorithm ***
-initialize an empty array to store products
-set outer_index = 0
-while outer_index < arr1.size, iterate through each element
  -set inner_index = 0
  -while inner_index < arr2.size, 
    -arr1[outer_index] * arr2[inner_index] and add to results array
    -increment inner_index
  -increment outer_index
-sort the results array
=end

def multiply_all_pairs(arr1, arr2)
  products = []
  outer_index = 0
  while outer_index < arr1.size
    inner_index = 0
    while inner_index < arr2.size
      products << arr1[outer_index] * arr2[inner_index]
      inner_index += 1
    end
    outer_index += 1
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]