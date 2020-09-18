=begin
Write a method that takes two arguments, a positive integer and a boolean, 
and calculates the bonus for a given salary. 
If the boolean is true, the bonus should be half of the salary. 
If the boolean is false, the bonus should be 0.

Examples:
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

Expected output:
true
true
true

*** Understand the problem ***
-write method named calculate_bonus
-input:
  -pass 2 arguments into method
    -positive integer will be the first argument, representing salary
    -boolean (true or false) will be the second argument, representing whether a bonus is being given or not
-output:
  -integer
    -if second argument is true, output will be integer / 2
    -if second argument is false, output will be 0
-rules:
  -first argument must be a positive integer, but what happens if it is an odd number? Do we still output 
  integer or float value with cents?

*** Additional examples/test cases ***
puts calculate_bonus(101, true) == 50
  -should we be outputting integer here, or 50.5 and reformatting to represent dollars and cents?

*** Data structures ***
-input is an integer and a boolean
-output is an integer

*** Algorithm ***
1. define method with 2 parameters (positive integer, boolean)
2. control flow
  -if boolean is true, return integer / 2
  -else, return 0
=end

# *** CODE ***
def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000