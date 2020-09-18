=begin
Write a method that takes two arguments, a string and a positive integer, and prints the string 
as many times as the integer indicates.

Example:
repeat('Hello', 3)

Output:
Hello
Hello
Hello

*** Understand the Problem: ***
-write a method named repeat
-input:
  -2 method arguments
    -1 string, 1 positive integer
-output:
  -string * positive integer

*** Examples/Test Cases: ***
repeat('Hello world', 1) => Hello world
repeat('Hello   world', 2) => Hello  world
                              Hello  world
repeat('3', 3) => 3
                  3
                  3
-Should there be a special output if invalid arguments are passed in (i.e. two integers, two strings, etc.)?

*** Data structures: ***
-string and number

*** Algorithm: ***
1. define method with two parameters, a string and a positive integer
2. use #times method to print the string a certain number of times. The number the #times method will 
   call upon is the integer passed into the method as second argument.
=end

# *** CODE ***

def repeat(string, num)
  num.times { puts string }
end

repeat('Hello', 3)
repeat('Hello world', 1)
repeat('Hello   world', 2)
repeat('3', 3)