=begin
Write a method that takes an Array as an argument, and reverses its elements in place; 
that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

*** Understand the Problem ***
-Input: array
-Output: the same array, with the elements reversed
-Rules:
  -the returned array should be the same array object as the original, not a new array 
  (mutate the original array) - object id's of both the original array and returned array will be the same
  -cannot use Ruby Array#reverse or Array#reverse! methods
  -"reverse" means the element placement is reversed
    -e.g. the first element of the original array will move to be the last element
    -the second element of the original array will be modified to be the second to last in placement, etc.
  -if argument is empty or contains only one element, the returned array will just be the exact same as the original
*** Data Structures ***
-Input: array
-Output: array (same as original)

*** Algorithm ***
-return argument if argument.empty? or argument.size == 1
-set index_1 = 0
-set index_2 = -1
-for a given number of times (which will be the size of the argument / 2)
  -array[index_1], array[index_2] = array[index_2], array[index_1]
  -index_1 += 1
  -index_2 -= 1
-return the array
=end

def reverse!(array)
  return array if array.empty? || array.size == 1
  index_1 = 0
  index_2 = -1
  (array.size / 2).times do |time|
    array[index_1], array[index_2] = array[index_2], array[index_1]
    index_1 += 1
    index_2 -= 1
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []