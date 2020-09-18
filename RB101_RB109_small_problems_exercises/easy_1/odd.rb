=begin
Write a method that takes one integer argument, which may be positive, negative, or zero. 
This method returns true if the number's absolute value is odd. 
You may assume that the argument is a valid integer value.
Keep in mind that you're not allowed to use #odd? or #even? in your solution.

Examples:
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

*** Understand the Problem: ***
-write method named is_odd?
-input:
  -pass into method 1 argument, which is an integer value (can be positive, negative, or zero)
-output:
  -true or false
    -if number's absolute value is odd, output will be true
    -if number's absolute value is even, output will be false
-rules:
  -argument will always be a valid integer value
  -definition of absolute value is essentially the non-negative value of the number
    -i.e. absolute value of -7 == 7 
    -absolute value of 0 == 0
    -absolute value of 7 == 7
    -if number is negative, then absolute value == number * -1
    -if number is positive or 0, then absolute value == number itself
    -in this case, explicitly determining number's absolute value isn't necessary to determine whether 
    even or odd

*** Data structures ***
-input is number
-output is a boolean

*** Algorithm ***
1. define method with one parameter, an integer
2. output return value of: integer % 2 != 0
=end

# *** CODE ***

def is_odd?(num)
  num % 2 != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true  

# Further Exploration 
def is_odd?(num)
  num.remainder(2) != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true  
