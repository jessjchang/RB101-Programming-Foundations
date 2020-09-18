=begin
Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, 
always starting with 1. The length of the string should match the given integer.

Examples:
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

Expected output:
true
true
true
true

*** Understand the problem ***
-write method named stringy
-input:
  -pass one argument (positive integer) into the method
  -should I handle cases where 0, negative integer, or non-integer is passed in/what would the output in
  those cases be?
-output:
  -string
    -always starts with 1
    -alternates 1 and 0 until length of string is equal to the integer passed in
    -if index of the string is even, '1' is the character in place
    -if index of the string is odd, '0' is the character in place
  
*** Additional Example/Test Case ***
puts stringy(1) == '1'

*** Data structures ***
-input is number (specifically, an integer)
-output is string

*** Algorithm ***
1. define method with one parameter, a positive integer
2. create empty string
3. loop from 0 to provided integer - 1
  -if current element is even, concatenate '1' to the string you created
  -else, concatenate '0'
4. return the string
=end

# *** CODE ***
def stringy(int)
  string = ''
  for index in 0...int do
    if index.even?
      string << '1'
    else
      string << '0'
    end
  end
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(1) == '1'

# Further Exploration
=begin
Modify stringy so it takes an additional optional argument that defaults to 1. 
If the method is called with this argument set to 0, the method should return a String of 
alternating 0s and 1s, but starting with 0 instead of 1.

Input:
  -2 parameters to stringy, one positive integer and one optional parameter (denoting what string starts with) 
  that defaults to 1
  -what should happen if argument passed in for the second argument is neither 0 nor 1?
Output:
  -string
    -if second argument is not provided or is 1, then same as before
    -if second argument is passed in with 0:
      -return a string starting with '0'
        -if index of the string is even, then '0' will be the character in place
        -if index of the string is iddm then '1' will be the character in place
=end

# *** CODE ***
def stringy_new(int, start=1)
  string = ''
  for index in 0...int do
    if start == 0
      char = index.even? ? '0' : '1'
      string << char
    else
      char = index.even? ? '1' : '0'
      string << char
    end
  end
  string
end

puts stringy_new(6) == '101010'
puts stringy_new(6, 1) == '101010'
puts stringy_new(6, 0) == '010101'
puts stringy_new(1) == '1'
puts stringy_new(1, 0) == '0'

