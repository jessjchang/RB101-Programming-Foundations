=begin
In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. 
In a language that is not optimized for recursion, some (not all) recursive methods can be extremely 
slow and require massive quantities of memory and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; 
as a result, the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth, 
the recursive solution is impractical. (Our tail recursive solution did much better, but even that failed 
at around fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without recursion.

*** Understand the Problem ***
-Input: integer
-Output: integer
-Rules:
  -input integer will be greater than or equal to 1
  -if input integer is 1 or 2, output will be 1
  -if input integer is greater than 2, output will be the sum of the 2 previous numbers in the fibonacci sequence:
    -1: 1
    -2: 1
    -3: 2
    -4: 3
    -5: 5
    -6: 8
    -7: 13
    -8: 21
    -9: 34
    -10: 55
    ...

*** Data Structures ***
-Input: integer
-Output: integer
-array

*** Algorithm ***
-initialize sum = 0
-initialize array as [1, 1]
-do certain number of times from 3 up to the input integer:
  -reassign sum to be the sum of the two integers in the array
  -remove the first element of the array and push in the sum
-return sum
=end

def fibonacci(nth)
  sum = 0
  arr = [1, 1]
  3.upto(nth) do
    sum = arr.reduce(:+)
    arr.shift 
    arr << sum
  end
  sum
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501