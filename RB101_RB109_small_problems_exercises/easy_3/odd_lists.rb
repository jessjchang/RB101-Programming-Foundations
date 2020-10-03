=begin
Write a method that returns an Array that contains every other element of an Array that 
is passed in as an argument. The values in the returned list should be those values that are in the 1st, 
3rd, 5th, and so on elements of the argument Array.

*** Understand the Problem ***
-Input: array 
-Output: array that consists of every other element from the original array
-Rules: 
  -if input array is empty, return empty array
  -if one element in input array, return the same array
  -if two elements in input array, return output array with the first element
  -returned values in array should be ones in the 1st, 3rd, 5th, etc. elements of given array
  (i.e. index 0, 2, 4, etc.)

*** Data structures ***
-input: array
-output: array

*** Algorithm ***
-define method named oddities that takes 1 parameter, an array
-initialize an empty array
-iterate through given array - number of times we iterate through is array.size (e.g. array.size.times do |index|)
  -if index.even?
    -then, push array[index] to the empty array
-return the new array
=end

def oddities(array)
  results_array = []
  array.size.times do |index|
    results_array << array[index] if index.even?
  end
  results_array
end



p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# Further Exploration
def evens(array)
  results_array = []
  for index in 0...array.size do
    results_array << array[index] if index.odd?
  end
  results_array
end

# Second way
def evens(array)
  results_array = []
  index = 0
  while index < array.size
    results_array << array[index] if index.odd?
    index += 1
  end
  results_array
end

# Third way
def evens(array)
  results_array = []
  array.each_with_index do |element, index|
    results_array << element if index.odd?
  end
  results_array
end

p evens([2, 3, 4, 5, 6]) == [3, 5]
p evens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evens(['abc', 'def']) == ['def']
p evens([123]) == []
p evens([]) == []