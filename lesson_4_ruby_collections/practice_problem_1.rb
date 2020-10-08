[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3]
=begin
By calling #select on the array [1, 2, 3], at each iteration, an element of the array is passed into
the block, and #select is evaluating the truthiness of the return value of the block, and if it is truthy, 
the element will be selected and placed in the new collection that #select returns.
Since the string object 'hi' is the last expression of the block, the return value of the block at 
each iteration will be 'hi', which is always a truthy value, so at each iteration, the block returns 
a truthy value, and thus all three elements of the original array [1, 2, 3] are selected and placed in 
the new array returned by #select.
=end