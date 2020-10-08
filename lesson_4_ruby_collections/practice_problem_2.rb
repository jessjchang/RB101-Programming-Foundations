['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# => 2
=begin 
According to the Ruby documentation, the Array#count method counts the number of elements for 
which the block returns a true value, and the method will return an integer of the count. 
So #count will evaluate the truthiness of the block's return value, 
and will only count the element if the return value is truthy. 
=end