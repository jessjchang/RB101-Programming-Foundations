[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]


=begin
Here we are calling Array#select on an array object that contains two separate hashes. We will pass in each
hash in turn into the block and assign it to the local variable hash. Within the block, we are calling 
the Enumerable#all? method on the hash that the local variable hash is currently referencing, and we pass in 
each key-value pair to the inner block at each turn, and assign them to the local variables key and value. 
Within this inner block, we are evaluating whether the element at index 0 of the current object value is referencing 
is equal to the string representation of the current key. The return value of this String#== method call at each iteration 
is important, as the Enumerable#all? method considers the truthiness of the return value of its block, and if
the block never returns a non-truthy value (i.e. never returns false or nil), then the method will return true.
The Array#select method also considers the truthiness of its block at each iteration and will return a new
array with the element(s) from the calling array for which the block evaluates to a truthy return value. 

So in this code, we first pass in the hash { a: 'ant', b: 'elephant' } into the block and assign it to the local
variable hash. Within the outer block, we call #all? on this hash, and first pass in the key :a and the value
'ant' into the inner block. We then evaluate whether the element at index 0 of 'ant' (in this case, the string
object 'a') is equal to the string representation of the current key, which in this case is also 'a', so the return 
value of the block at this iteration is true. However, we're not done yet. We still need to pass in the key :b
and the value 'elephant' into the block to determine the return value of the #all? method in the iteration. 
The comparison in this case evaluates to false, because 'e' does not equal 'b', so since the block has returned
a non-truthy value, the #all? method in this iteration evaluates to false. This return value is then considered
by the outer #select method, and since it is false, the first hash in the array is thus not included in the new returned array.
Next, we pass the hash { c: 'cat' } into the block and assign it to the variable hash. We then call #all? on 
this hash, and pass the key :c and the value 'cat' into the block, and return true, because 'c' does indeed
equal 'c'. Since the block has not returned a non-truthy value at any iteration here, the #all? method call 
returns true, which is then used by the outer #select method, which returns a new array that contains the hash
{ c: 'cat' }, as it was the only hash in the original calling array for which #select's block returned a 
truthy value. 

A detailed graphical breakdown:
Line        Action                  Object              Side Effect             Return Value        Is Return Value Used?
1           method call (select)   Array of hashes      None                    New array             No
                                                                                [{c: 'cat'}]

1-5          outer block execution   Each hash          None                    boolean               Yes, used by #selection to select the elements that meet the criteria             

2           method call (all?)      Each hash           None                     boolean              Yes, used to determine outer block's return value

2-4         inner block execution     Each key-value pair   None                boolean               Yes, used by #all? to determine method's return value

3           method call ([])          String referenced     None                   String             Yes, used by #== when performing comparison
                                      by current value

3           method call (to_s)        Symbol referenced by    None                String                Yes, will be used by #== when performing comparison
                                      current key

3           method call (==)         Element at index 0 of value   None           boolean                Yes, will be used to determine inner block's return value
                                    and key 

=end