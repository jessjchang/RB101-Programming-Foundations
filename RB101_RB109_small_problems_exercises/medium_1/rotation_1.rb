=begin
Write a method that rotates an array by moving the first element to the end of the array. 
The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

*** Understand the Problem ***
-Input: array
-Output: new array
-Rules:
  -output array will be same size as original array
  -output array will be a new array, the original input array shouldn't be modified/mutated
  -only move the first element to the end of the array, all other elements remain in same order
  -if input array has only one element, return the input array

*** Data Structures ***
-Input: array
-Output: array

*** Algorithm ***
-duplicate the original array and assign to a new variable
-remove the first element of the new duplicated array
-add the removed element back onto the new duplicated array
-return the duplicated array
=end

def rotate_array(arr)
  rotated_arr = arr.dup
  rotated_arr << rotated_arr.shift
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# Further Exploration - rotate string
def rotate_string(str)
  str[1..-1] + str[0]
end

a = 'abcde'
p rotate_string(a) == 'bcdea'
p a == 'abcde'

def rotate_string2(str)
  rotate_array(str.split(//)).join
end

a = 'abcde'
p rotate_string2(a) == 'bcdea'
p a == 'abcde'


# Further Exploration 2 - rotate integers
def rotate_int(int)
  (int.to_s[1..-1] + int.to_s[0]).to_i
end

b = 12345
p rotate_int(b) == 23451
p b == 12345

def rotate_int2(int)
  rotate_array(int.to_s.split(//)).join.to_i
end

b = 12345
p rotate_int2(b) == 23451
p b == 12345
