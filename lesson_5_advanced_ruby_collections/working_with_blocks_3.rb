[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# 1
# 3
# => [1, 3]

=begin
Here, we are calling the Array#map method on a multi-dimensional array object [[1, 2], [3, 4]]. At each 
iteration, we pass in an inner array into the block and assign it to the local variable arr. Within the
block, we call Array#first on the array assigned to arr, which will return the element at index 0 of the
array, and then by invoking puts on this return value, we will output a string representation of the value
to the output. Then, the second and last line of the block calls Array#first on the array assigned to local 
variable arr, so we will return the element at index 0 of the array, and this will be the return value of the
block, as it is the last line executed in the block. Array#map uses the return value of the block at each
iteration in its transformation of the array object it is called on, and returns a new array of the transformed
elements. 
So to break down specifically for this code, in the first iteration, we pass the nested array's 
inner array [1, 2] to the block and assign it to local variable arr. Within the block, by calling Array#first
on arr, we will return the integer 1, and by invoking puts, we will print a string representation of the
integer 1 to the output. Then, in the last line of the block, arr.first returns the integer 1, which Array#map
will use to perform the transformation and replace the inner array [1, 2] with integer 1, so 1 will now be
the first element of the new array Array#map will be returning. Then, in the next and final iteration, we pass
[3, 4] into the block and assign it to local variable arr. We invoke puts on the return value of arr.first (which
will be the integer 3), and thus print a string representation of the integer 3 to the output. In the last
line of the block, arr.first returns the integer 3, which Array#map uses to transform the inner array [3, 4], and 
the integer 3 will now be the second element of the new array Array#map returns. 
Thus, what is ultimately returned at the very end is a new array [1, 3].

A detailed graphical breakdown:
Line        Action            Object              Side Effect             Return Value        Is Return Value Used?
1           method call       outer array         None                    a new array         No, but it is shown
            (map)                                                         [1, 3]              on line 8 as the return value of the code

1-4         block execution   Each sub-array      None                    Element at index      Yes, used by map for transformation
                                                                          0 of sub-array

2           method call       Each sub-array      None                    Element at index    Yes, used by puts
            (first)                                                       0 of sub-array

2           method call       Element at index      Outputs a string      nil                 No
            (puts)            0 of each sub-array   representation of
                                                    integer

3           method call       Each sub-array        None                  Element at index 0  Yes, used to determine 
            (first)                                                       of sub-array         return value of block

=end