[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]

=begin
In line 1, we are calling the Array#map method on the nested array [[8, 13, 27], ['apple', 'banana', 'cantaloupe']]. 
At each iteration, we pass one of the sub-arrays into the block and assign it to the local variable arr at
each turn. So, first we pass [8, 13, 27] into the block, then ['apple', 'banana', 'cantaloupe'] in the second
iteration. Within the block, we call Array#select on the current sub-array, and pass each element of the 
sub-array into the inner block and assign it to the local variable item at each turn. Within the block,
we have an if/else statement that will help us determine the return value based off specific criteria. So we 
first determine if the current element of the current sub-array is an integer, and if it is, we evaluate 
whether the item is greater than 13. If so, the block would return true. If the current element 
is not an integer, we move onto the else branch of the statement, where we evaluate
whether the size of the current element is less than 6, and if so, we return true. The return value of
this if/else statement is used by #select for the new array the method will return with the elements for which 
the block returns a truthy value. So when [8, 13, 27] is passed into the outer block, and subsequently the 
integers 8, 13, and 27 are passed into the inner block separately, passing 8 and 13 into the inner blocks
does not return a truthy value, so they are not included in the new array #select returns. However, 27 is indeed
greater than 13, so #select in this iteration returns a new array that contains the integer 27. 
Then, ['apple', 'banana', 'cantaloupe'] are passed into the outer block, and subsequently each string is passed
separately into the inner block. We move onto the else branch within the block in this case, as none of these
strings are integers, and we determine whether the size of the current string is less than 6. The only element
for which this returns true is 'apple', whose size is 5, so the #select method in this iteration returns 
a new array containing the string 'apple'. The #map method thus ultimately uses the return values of #select
at each iteration to perform transformation, and returns a new array with each transformed element. 

A detailed graphical breakdown:
Line        Action                  Object              Side Effect             Return Value        Is Return Value Used?
1           method call (map)       outer array         None                    new transformed array   No

1-9         outer block execution    Each sub-array     None                    array of selection      Yes, used by #map for transformation

2           method call (select)      Each sub-array    None                    new array of selection    Yes, used to determine outer block's return value

2-8         inner block execution     Each element of     None                  boolean                   Yes, used by #select for selection of elements that meet the criteria
                                      current sub-array                          

3-7         conditional statement     Each element of     None                  boolean                   Yes, used to determine inner block's return value
                                      current sub-array 

3            method call (==)         Each element of     None                  boolean                   Yes, used to determine if we will stay on the if branch or move onto the else branch
                                      current sub-array 

4           comparison (>)            Element of          None                  boolean                   Yes, used to determine inner block's return value
                                      sub-array

6           a method call (size)      Element of sub-array    None                  boolean                 Yes, used to determine inner block's return value
            and comparison (<)
=end