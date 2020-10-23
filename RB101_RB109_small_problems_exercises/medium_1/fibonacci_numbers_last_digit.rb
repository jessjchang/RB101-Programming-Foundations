=begin
In the previous exercise, we developed a procedural method for computing the value of the nth 
Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence 
almost instantly.

In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

*** Understand the Problem ***
-Input: integer
-Output: integer
-Rules:
  -return the last digit of the nth Fibonacci number, with nth being your input argument

*** Data Structures ***
-Input: integer
-Output: integer

*** Algorithm ***
-initialize an array of your current first and last numbers in the sequence to [1, 1]
-from 3 up to the input argument nth number
  -reassign your first and last variables so the first element is the last number, and the last element is the (first + last numbers) % 10
-return the last variable
=end

def fibonacci_last(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, (first + last) % 10]
  end
  last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4

# Further Exploration
# last digits repeat every 60th number in the sequence

def fibonacci_last2(nth)
  first, last = [1, 1]
  sequence_count = 2
  if nth % 60 == 0
    return 0
  else
    3.upto(nth % 60) do
      first, last = [last, (first + last) % 10]
    end
    last
  end
end

p fibonacci_last2(123_456_789_987_745) == 5