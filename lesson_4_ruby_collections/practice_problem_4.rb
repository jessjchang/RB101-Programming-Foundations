['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
=begin 
#each_with_object takes a method argument that is the collection object that is returned by the method, 
in this case a hash. Two arguments, value and hash, are passed into the block -- value represents 
each element of the array #each_with_object was called on, and hash represents the collection object,
which is initialized as an empty hash. Within the block, we are populating the hash at each iteration, 
where the key of the hash will be the first element of each string within the original calling array 
(so essentially, the first letter of each string in this case), and the value is set equal to each element. 
The method then returns the now populated hash object.  
=end
