[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]

=begin
Here, we are calling the Array#each method on a multi-dimensional array object that consists of two
inner array objects [1, 2] and [3, 4]. At each iteration, we pass an inner array into the block (in the first
iteration, we pass in [1, 2] and in the second iteration, we pass in [3, 4]). When we pass the inner array into
the block, we assign it to the local variable arr, so arr now references the current array that was just passed
into the block. Within the block, we call the Array#first method on arr. This method will return the first
element (i.e. the element at index 0) of the array it is called on. Thus, in the first iteration, when [1, 2]
is passed into the block and assigned to arr, arr.first returns the integer 1, as it is the element at index 0
of the current array. By invoking puts on the return value of arr.first (in this case, integer 1), a string
representation of the integer 1 will be printed to the output. 
Then, in the second and final iteration, we pass [3, 4] to the block and assign it to local variable arr,
the return value of arr.first will be the integer 3, and by invoking puts on the integer 3, we will print 
to the output a string representation of this integer. 
The ultimate return value at the very end is the return value of calling the Array#each method on the original
array. Even though the block's return value will be nil, because we invoked puts in the last line executed
in the block and puts returns nil, Array#each actually does not consider the block's return value, and instead
always returns the original collection it was called upon, in this case the original multi-dimensional
array [[1, 2], [3, 4]].
=end