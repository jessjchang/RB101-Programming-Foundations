[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil]
=begin 
The output of this code will be:
2
3
However, the return value will be [1, nil, nil]. 
When we call Enumerable#map on the array [1, 2, 3], we are iterating through and at each iteration, passing
an element of the array into the block. In the first iteration, we pass in the integer 1, and evaluate
the if/else conditional statement. 1 is not greater than 1, so we do not invoke puts
on 1, and instead we move onto the else branch of the condition, which returns 1, which is then
placed into a new array that #map will return. 
We then move onto the second iteration, where the number 2 is passed into the block. 2 is greater than 1,
so we will invoke puts on 2, which will print 2 to the output, but the return value of the block here will
be nil, as invoking puts always has a return value of nil. Thus, nil is now added to the array that will
be returned.
Finally, in our last iteration, 3 is passed into the block. Again, 3 is greater than 1, so we will once
again invoke puts, this time on 3, which will print 3 to the output, but the return value of the if/else
statement will again be nil, which is added to the returned array. 
=end