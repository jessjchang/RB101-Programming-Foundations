=begin
We wrote a method for moving a given number of elements from one array to another. We decide to test it 
on our todo list, but invoking move on line 17 results in a SystemStackError. What does this error mean and 
why does it happen?

We are using recursion within the method, but hadn't implemented a base case to stop the recursion at any point,
so each call to the method just kept getting added to the stack until we encountered a stack overflow.
=end

def move(n, from_array, to_array)
  return if n <= 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']