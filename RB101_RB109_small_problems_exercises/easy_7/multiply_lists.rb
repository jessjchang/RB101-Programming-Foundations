=begin
Write a method that takes two Array arguments in which each Array contains a list of numbers, 
and returns a new Array that contains the product of each pair of numbers from the arguments 
that have the same index. You may assume that the arguments contain the same number of elements.

*** Understand the Problem ***
-Input: 2 arrays of numbers
-Output: new array
  -product of each pair of numbers from same-index numbers in the argument arrays
-Rules:
  -argument arrays will contain the same number of elements
  -elements in argument arrays will always only be numbers

*** Data Structures ***
-Input: array
-Output: array

*** Algorithm ***
-initialize empty array to store products
-set index = 0
-for array.size number of times
  -take product of arr1[index] * arr2[index] and add it to your results array
  -increment index
-return the results array
=end

def multiply_list(arr1, arr2)
  products = []
  arr1.size.times { |index| products << arr1[index] * arr2[index] }
  products
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Further Exploration
def multiply_list_zip(arr1, arr2)
  (arr1).zip(arr2).map { |pair| pair.reduce(:*) }
end

p multiply_list_zip([3, 5, 7], [9, 10, 11]) == [27, 50, 77]