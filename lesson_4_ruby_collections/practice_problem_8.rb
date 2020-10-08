arr = [1, 2, 3, 4, 5]
arr.take(2)

=begin 
Looking at the Ruby documentation, it seems the Array#take method is not destructive, as it
returns a new array. #take takes one argument, an integer (value n), and returns the first n
elements of the calling array as a new array. Thus, in this case, arr.take(2) will return
the first 2 elements of the array the method is called upon as a new array. So, arr.take(2) returns
a new array [1, 2]. The original array arr has not been mutated -- it remains [1, 2, 3, 4, 5] 
=end