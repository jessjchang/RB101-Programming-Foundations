[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

# => [[[2, 3], [4, 5]], [6, 7]]


=begin
In line 1, we call Array#map on a nested array object [[[1, 2], [3, 4]], [5, 6]]. We will pass [[1, 2], [3, 4]]
into the block in the first iteration, and [5, 6] in the second, and will assign the sub-array to the local
variable arr at each turn. Within the outer block, we call Array#map on the current sub-array, and pass in 
an element of the sub-array into #map's block and assign it to the local variable el at each turn. So, when we pass
[[1, 2], [3, 4]] into the outer block, then when we call #map on this array, we will first pass [1, 2] in the
first iteration, and [3, 4] in the second iteration into the inner block. Within this block, we have an
if/else statement. We first call #to_s on the current element, thus converting it into a string object, then
we call String#size on the return value (the element as a string object), and if this return value is equivalent
to the integer 1, we can determine it is an integer, and if it is not, then we know it's an array object. When we
call #to_s and subsequently #size on [1, 2], we move onto the else branch because el in this iteration is referencing 
an array, not an integer value. Thus, within the else branch, we call Array#map on [1, 2], and at each iteration,
we pass first the integer 1, then the integer 2 into the block and assign it to the local variable n. Within
the block, we take the return value of n + 1, and #map uses it to perform its transformation of the calling object.
So, when we call the inner #map on [1, 2], the method's return value is a new array [2, 3], and when we call the inner #map on [3, 4],
the method's return value is [4, 5]. These return values are used by the outer #map to perform its transformation,
and the return value of the outer #map is thus a new array [[2, 3], [4, 5]]. 
Now, we move onto the second and final outer iteration, which is passing [5, 6] into the outermost block and 
assigning it to the local variable arr. We then call #map on this array, and pass in first the integer 5, then the
integer 6 into the innter block, assigning it to the local variable el at each turn. When we evaluate the if/else
conditional statement, we determine that calling #to_s and then #size on each of these integers does return 1, so we
stay on this if branch, and within, we perform el + 1, which will produce the block's return value of 6 and 7, respectively.
The #map method then uses these return values, and returns a new array [6, 7], which the very outer #map also uses for
its transformation. Thus, at the very end, we ultimately return a new array [[[2, 3], [4, 5]], [6, 7]].


A detailed graphical breakdown:
Line        Action                  Object              Side Effect             Return Value        Is Return Value Used?
1           method call (map)        outer array         None                    New array           No

1-11        Outer block execution    Each sub-array     None                    Return value of #map    Yes, used to determine outer #map's return value

2           method call (map)         Each sub-array    None                      New array             Yes, used to determine outer block's return value

2-10        Inner block execution     Each element within       None                Return value of     Yes, used to determine inner #map's return value
                                      sub-array (either array                       if/else statement
                                      or integer depending on                       (integer or array)
                                      current iteration)

3-9         conditional statement     Each element within       None                Integer or Array    Yes, used to determine inner block's return value
            (if/else)                 sub-array (either array                       
                                      or integer depending on                       
                                      current iteration)

3           method call (==)        Integer returned by         None                Boolean           Yes, used by if/else statement to determine branch
                                    #size method call

3           method call (size)        String returned by       None                 Integer            Yes, used by #== method call  
                                      #to_s method call

3           method call (to_s)        Each element within       None                String              Yes, used by #size method call
                                      sub-array (either array                       
                                      or integer depending on                       
                                      current iteration)

4         method call (+)             Integer element             None              Integer              Yes, used to determine if branch's return value
                                      within sub-array

6         method call (map)             Each sub-sub-array        None              New array           Yes, used to determine else branch's return value

6-8       Innermost block execution     Each integer within       None              Integer               Yes, used to determine innermost #map's return value                            
                                        sub-sub-array 

7         method call (+)               Each integer within       None              Integer               Yes, used to determine innermost block's return value                            
                                        sub-sub-array 



=end