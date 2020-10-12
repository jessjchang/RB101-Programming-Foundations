[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

=begin
Here, we are calling Array#map on a multi-dimensional array object [[1, 2], [3, 4]]. At each iteration, 
we pass in one of the inner array objects to the block, first [1,2], then [3, 4] and assign it to the local variable arr.
Within the block, we call the Array#first method on arr, which will return the first element (the element
at index 0) of the array it is called on. By invoking puts on this return value, we will print out a 
string representation of the value to the output and return nil, as puts always returns nil. 
So, in the first iteration, we assign [1, 2] to arr, and when we call
Array#first on arr, we return the integer 1, and then by invoking puts on 1, we print 1 to the output, and
as this is the last and only line in the block, the block returns nil. On the next and final iteration, 
we pass [3, 4] into the block and assign it to arr, and when we call Array#first on arr, we return the integer 3. By invoking puts on 3, 
we will print a string representation of 3 to the output, and the block again returns nil. Array#map considers
the return value of the block and uses it to transform each element and return a new array of the transformed
elements, so since the block returns nil at each iteration, the entire Array#map method here will return a
new array [nil, nil]. 
=end