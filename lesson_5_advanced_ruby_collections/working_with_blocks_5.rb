[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# => [[2, 4], [6, 8]]

=begin
Here we are calling Array#map on a multi-dimensional array [[1, 2], [3, 4]]. We will pass into the block 
at each iteration an inner array and assign it to the local variable arr. Then, within the block, we are calling
Array#map again, this time on the inner array object arr references, and will pass each element of that array
into the block and assign it to local variable num. Within the inner block, we will execute the statement 
num * 2, whose return value (an integer) will be the return value of the inner block, as it is the last and only
line of the inner block, and this value will be used by the inner Array#map method to transform each element
of the inner array. The inner Array#map method call will then return a new array of the transformed elements,
which will then be used by the outer Array#map method call to transform each of the sub-arrays of the original
multi-dimensional calling array object, and the ultimate return value will be a new multi-dimensional array
object with the transformed sub-arrays.
So with this code specifically, in the first iteration, we pass [1, 2] into the outer block and assign it to 
local variable arr. We then call Array#map on [1, 2], and at each iteration, pass in an element of this array
into the inner block and assign it to local variable num. So, first we pass in the integer 1, and within the inner
block, we perform method call Integer#* with num referencing the integer 1 and integer 2 as the argument, 
and return the integer 2, which is then used by Array#map to transform the original element (which was integer 1) in the sub-array. 
Then we pass in the integer 2, and the inner block's return value is the integer 4, so after iterating through the first sub-array,
the inner block's return value is a new array [2, 4], which the outer Array#map method uses to transform the 
element [1, 2] from the original calling object. Then, we move onto the next and final iteration of the outer block,
and pass in [3, 4], assigning it to arr. Within the outer block, we pass first the integer 3, then the integer 4 into
the inner block, assigning each integer to num at each iteration, and ultimately returning a new array [6, 8]
as the inner block's return value in this iteration. This return value is then used by the outer Array#map
method call to transform the element [3, 4] from the original calling object, and what we ultimately return
is a new multi-dimensional array with the transformed sub-arrays [[2, 4], [6, 8]].

A detailed graphical breakdown:
Line        Action                  Object              Side Effect             Return Value        Is Return Value Used?
1           method call (map)       Outer array         None                     New array            No
                                    [[1, 2], [3, 4]]                             [[2, 4], [6, 8]]

1-5         outer block execution   Each sub-array      None                     New transformed array    Yes, by Array#map to transform original array         

2           method call (map)       Each sub-array      None                    New transformed array     Yes, to determine outer block's return value

2-4         inner block execution   Each element
                                    within each sub-array   None                Integer value             Yes, by the inner Array#map for transformation

3           method call (*)         Each element
                                    within each sub-array   None                Integer value             Yes, to determine inner block's return value

=end