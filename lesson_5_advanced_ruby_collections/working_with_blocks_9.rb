[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]


=begin
In line 1, we call the Array#map method on a multi-dimensional array. We iterate twice -- in the first iteration,
we will pass the array [[1], [2], [3], [4]] into the block, and on the second, we will pass the array [['a'], ['b'], ['c']]
into the block, and we will assign the array to the local variable element1 at each turn. Then, within the outer
block, we call Array#each on each sub-array. We will iterate through each sub-array, and at each turn, we will
pass in one of the sub-arrays within the sub-array into the block and assign it to local variable element2. Within
#each's block, we then call Enumerable#partition on this sub-sub-array, and pass in an element within the sub-sub-array
(in this case, either an integer or a string object depending on the iteration) into #partition's block and assign
it to the local variable element3. Then, within this innermost block, we call #size on the object element3 is currently
referencing, and evaluate whether it is greater than 0. #partition will then use this boolean return value to 
determine the method's return value, which will be two new arrays, the first containing the elements for which the
block returned true and the second containing the rest. However, when we go up a level, we can tell that it really 
doesn't matter what the return value of the #partition method call is, because Array#each ignores its block's return
value and just returns the calling object, in this case [[1], [2], [3], [4]] in the first iteration and [["a"], ["b"], ["c"]]
in the second iteration. The outermost method call Array#map will take into consideration its block's return value,
in this case the return value of the #each method call, and it will use this to perform its "transformation",
in this case returning a new array that just matches the original calling object.  

A detailed graphical breakdown:
Line        Action                  Object              Side Effect             Return Value              Is Return Value Used?
1           method call (map)       Outer array         None                    New array with            No
                                                                                "transformed" elements
                                                                                based off block's
                                                                                return value

1-7         Outer block execution    Each sub-array     None                    Return value of #each       Yes, used by #map to determine its return value    
                                                                                (the calling object)             

2           method call (each)       Each sub-array     None                    Calling sub-array object      Yes, used to determine outer block's return value

2-6         Inner block execution   Each sub-sub-array    None                  Return value of #partition      Not in this case, as #each ignore's block's return value

3           method call (partition)   Each sub-sub-array    None                Two new arrays                  Used to determine inner block's return value, 
                                                                                                                but in this case, it doesn't matter because #each won't care

3-5         Innermost block execution   Integer or String       None              Boolean                       Used to determine #partition's return value
                                        element within each
                                        sub-sub-array

4           Comparison (>)              Integer or String       None              Boolean                       Used to determine innermost block's return value
                                        element within each
                                        sub-sub-array

=end