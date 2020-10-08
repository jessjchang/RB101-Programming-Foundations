['ant', 'bear', 'caterpillar'].pop.size

# => 11
=begin 
Here, we are calling the Array#pop method on an array object, which destructively removes and returns
the last element of the calling array, so after calling #pop on ['ant', 'bear', 'caterpillar'], the method
returns 'caterpillar', and the array itself has been modified in place and is left with ['ant', 'bear'].
We then call #size on the return value of ['ant', 'bear', 'caterpillar'].pop, so in this case on 
'caterpillar', and this returns the length of the string, which is the integer 11.  
=end