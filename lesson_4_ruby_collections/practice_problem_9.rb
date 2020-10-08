{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => [nil, 'bear']
=begin 
When we call Enumerable#map on this hash, we pass in a key-value pair of the hash at each iteration, and
transform it according to the expression within the block, and the block's return value at each iteration
is then placed in a new array that is returned. In this case, in the first iteration, we pass the key :a
and the value 'ant' into the block. There is a conditional statement in the block that states if the
size of the value (in this case 'ant') is greater than 3, then the block will return the value. In this
iteration, 'ant' is not greater than 3 characters long, so that condition does not evaluate to true, 
and the block in this iteration will return nil, which is placed into a new array #map will return. 
We then move onto the next iteration, where the key :b and the value 'bear' are passed into the block. 
In this iteration, 'bear' is indeed greater than 3 characters long, so the block will return the value 
'bear', which is also placed into the return array. 
=end