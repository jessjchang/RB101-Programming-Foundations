[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

=begin 
Here, an element of the calling array is passed into the block at each iteration, and the 
block's return value will be a boolean (either true or false) depending on whether the element is odd 
or not, because num.odd? is the last expression being evaluated in the block. So, in the first iteration,
the integer 1 is passed into the block, and the block's return value will be true, because 1 is an odd
number. In the second iteration, 2 is passed in, and the block's return value will be false, as 2 is not 
an odd number. Finally, in the third iteration, 3 is passed in, and the block's return value will be
true, since 3 is odd.

The return value of #any? here will be true, because #any? is evaluating the truthiness of the block's
return value. If after any of the iterations, the block returns a truthy value (so anything except
false or nil), then #any? will immediately return true, as well as cease iterating because it does 
not need to evaluate any of the remaining elements. 

Thus, the printed output in this case will be 1, because we are invoking puts on each element. Only
1 is printed, because in the first iteration, we pass 1 into the block and invoke puts on it, so
1 is printed to the output, and the block's return value evaluates to true, because 1 is an odd
number, and because the block has returned true, #any? stops iterating entirely, so none of the
remaining elements are even passed into the block afterwards.  
=end