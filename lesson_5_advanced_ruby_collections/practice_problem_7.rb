# Given this code, what would be the final values of a and b? 

a = 2
b = [5, 8]
arr = [a, b] # => [2, [5, 8]]

arr[0] += 2 # => [4, [5, 8]]
arr[1][0] -= a # => [4, [3, 8]]

=begin
The final value of a would still be 2, because we never reference the variable a. On line 7, the indexed
reassignment is modifying the variable arr, and it is assigning the element at index 0 to point to a new
integer 4, while the integer a is pointing at does not change. 

The final value of b would be [3, 8]. On line 8, when we assign a new value at index 0 of the sub-array
within the multi-dimensional array arr references, we are modifying the same array that b is pointing to. 
=end