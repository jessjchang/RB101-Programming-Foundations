arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]


=begin
Here, we call the Array#sort_by method on the multi-dimensional array. We pass each sub-array into the block 
and assign it to the local variable sub_arr at each turn. Within the block, we then call Array#map on the 
current sub-array, and pass each element (in this case, a numeric string) into the block and assign it to 
the local variable num at each turn. Within this block, we call String#to_i, which returns the numeric value
of the integer at each turn, which #map then uses to perform its transformation. So for example, in the first
iteration, we've passed ["1", "8", "11"] into the outer block, and our #map method call has us pass first '1', then 
'8', then '11' into the inner block, and at each turn, we return the integers 1, 8, and 11, which #map uses for its 
transformation, and the return value of the #map method in this iteration is a new array with the 
transformed elements [1, 8, 11]. As we continue on, #map at each turn returns a new array with each numeric 
string transformed to their integer values, while the original outer multi-dimensional array remains un-transformed.
So, #sort_by is able to use the transformed integers in the inner arrays to perform the comparison and
sort the unchanged outer array. 

A detailed graphical breakdown:
Line        Action                  Object              Side Effect             Return Value        Is Return Value Used?
1           variable assignment     N/A                 None                    array object        Yes, the array is used by the #sort_by method call 

3           method call (sort_by)    outer array        None                    new sorted array    No           

3-7         outer block execution    Each sub-array     None                    new transformed array   Yes, used by #sort_by to determine ultimate return value

4           method call (map)         Each sub-array    None                    new transformed array   Yes, used to determine outer block's return value

4-6         inner block execution     String element          None              integer                 Yes, used by #map for transformation
                                      of current sub-array  

5           method call (to_i)        String element          None              integer                 Yes, used to determine inner block's return value
                                      of current sub-array  
=end