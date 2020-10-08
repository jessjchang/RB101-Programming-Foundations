[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3]
=begin 
The Array#reject method takes a block and at each iteration as each element of the original array
the method is called on is passed into the block, #reject evaluates the truthiness of the block's
return value, and each element for which the return value is not truthy (so, either nil or false) 
is then placed into a new array that is returned by #reject. 
In this case, since we are invoking puts on each element as the only expression 
within the block, the return value of the block at every iteration will be nil, which is not
a truthy value. Thus, all three elements of the original array [1, 2, 3] will be selected and placed
into the new array returned. 
=end