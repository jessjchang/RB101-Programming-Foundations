=begin
Write a method that takes an Array, and returns a new Array with the elements of the original list 
in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

*** Understand the Problem ***
-Input: array
-Output: a new array with the elements of the original array in reverse order
-Rules:
  -do not mutate the original array, the output will be a new array

*** Data Structures ***
-Input: array
-Output: a new array

*** Algorithm ***
-initialize an empty array to store the reversed elements
-set index = -1
-iterate through the original array
  -empty array << original array[index]
  -index -= 1
-return your new array
=end

def reverse(array)
  index = -1
  array.each_with_object([]) do |element, reversed_array|
    reversed_array << array[index]
    index -= 1
  end
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

# Further Exploration
def reverse2(array)
  array.reduce([], :unshift)
end

p reverse2([1,2,3,4]) == [4,3,2,1]          # => true
p reverse2(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse2(['abc']) == ['abc']              # => true
p reverse2([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse2(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true