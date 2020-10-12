my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# 18
# 7
# 12
# => [[18, 7], [3, 12]]

=begin
Here, we are calling Array#each on a multi-dimensional array object [[18, 7], [3, 12]], and the return value
of calling this method will be assigned to the variable my_arr. When we call Array#each, we iterate through 
the collection it is called on, and at each iteration, each element will be passed into the block and assigned
to local variable arr. Within the block, we are again calling Array#each, this time on arr (which will be
referencing one of the inner arrays of the initial multi-dimensional array). So this time, we will be iterating
through each element of the inner array, and passing it into the block and assigning to the local variable num.
Within this nested block, we have a conditional statement, that says if the element assigned to num is greater
than 5, then we will invoke puts on num, which will print a string representation of the element to the output. 
This block will return nil, however it doesn't matter because Array#each does not consider the return value of 
its block and instead always just returns the original collection it was called on. 
So, to break down specifically for this code, on the first iteration of the outer Array#each method call, 
we pass [18, 7] into the block and assign it to local variable arr. Then, within the block, we are calling
Array#each on arr, which is currently referencing the array [18, 7], so we will iterate through this array,
and on the first iteration, pass the integer 18 to the block and assign it to local variable num. We then
evaluate the if statement, so since 18 is indeed greater than 5, we will invoke puts on num, and print a
string representation of the integer 18 to the output. On the second iteration of this inner Array#each method
call, we pass the integer 7 to the block and assign it to num. Since 7 > 5 also evaluates to true, we will 
execute the statement within the if condition, and invoke puts on 7, which will print a string representation
of the integer 7 to the output. 
Now that we've iterated through the entire array object assigned to arr, we move back to the outer Array#each
method call, and pass in [3, 12] to the block and assign it to local variable arr. We then call Array#each on
this array object, and iterate through. So first, we pass the integer 3 to the block and assign it to num, and 
evaluate the if statement. In this case, 3 > 5 evaluates to false, so we do not execute the if statement, and
puts is never invoked on the integer 3. Finally, we pass 12 into the block and assign it to num. 12 is greater
than 5, so we will invoke puts on 12 and print it to the output. What is ultimately returned in this code will
just be the original multi-dimensional outer array object [[18, 7], [3, 12]], because Array#each does not care
what the return value of its block is, it just returns the original object it was called on. Thus, my_arr will
be assigned the original outer array object [[18, 7], [3, 12]]. 

A detailed graphical breakdown:
Line        Action                  Object              Side Effect             Return Value        Is Return Value Used?
1           variable assignment     N/A                 None                    [[18, 7], [3, 12]]  No

1           method call (each)      Outer array          None                   Calling object      Yes, used to assign to variable my_arr
                                    [[18, 7], [3, 12]]                          [[18, 7], [3, 12]]                

1-7         block execution         Each sub-array      None                    Each sub-array      No

2           method call (each)      Each sub-array      None                    Sub-array of each     Would be used to determine
                                                                                iteration (which is   return value of outer block,
                                                                                the calling object    but in this case, doesn't matter because 
                                                                                in that iteration)    Array#each doesn't care

2-6         block execution         Element of current  None                    nil                   No
                                    sub-array in each
                                    iteration

3           comparison (>)          Element of current  None                    true or false         Yes, by if statement
                                    sub-array in each
                                    iteration

3-5         conditional (if)        Element of current  None                    nil                   Used to determine
                                    sub-array in each                                                 return value of inner block,
                                    iteration                                                         but in this case, doesn't matter because #each doesn't care

4           method call (puts)      Element of current  Outputs string          nil                   Used to determine
                                    sub-array in each   representation of                             return value of inner block
                                    iteration           integer

=end