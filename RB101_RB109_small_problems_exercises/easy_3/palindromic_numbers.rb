=begin
Write a method that returns true if its integer argument is palindromic, false otherwise. 
A palindromic number reads the same forwards and backwards.

*** Understand the problem ***
-input: integer
-output: boolean
  -true if integer is palindromic, else false
-Rules:
  -only integers as arguments
  -palindrome means it's the same forwards and backwards

*** Data structures ***
-input: integer
-convert integer to string so can call reverse method on it
-output: boolean

*** Algorithm ***
-define method named palindromic_number? that takes one parameter, an integer
-convert integer to string
-if reverse of string equals the string, then true
=end

def palindromic_number?(int)
  string_int = int.to_s
  string_int.reverse == string_int
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

