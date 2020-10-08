hash = { a: 'ant', b: 'bear' }
hash.shift

# => [a, 'ant']
=begin 
Hash#shift removes the first key-value pair from the hash and returns it as a two-element array. 
It is destructive method, so after calling #shift on the hash, hash.shift in this case will 
return [a, 'ant'], and hash now stores a modified hash {b: 'bear'} with only one key-value pair left
after removing the first key-value pair. 
=end