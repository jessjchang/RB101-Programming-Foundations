=begin
Write a pseudo-code that does the following:
1. a method that returns the sum of two integers
*** Casual Pseudo-code ***
Given two integers
- perform addition on the two integers
- return the sum of the two integers

*** Formal Pseudo-code ***
START

Given two integers called "integer1" and "integer2"

SET sum = integer1 + integer2

PRINT sum

END

2. a method that takes an array of strings, and returns a string that is all those strings concatenated together
*** Casual Pseudo-code ***
** Assuming that strings are not being concatenated with any spaces?

Given an array of strings
- Iterate through the array
  - save the first value of the array as the starting value
  - for each iteration, concatenate the current value (current string) to the saved string
-return the saved string

*** Formal Pseudo-code ***
START
Given an array of strings called "string_array"

SET iterator = 0
SET saved_string = empty string

WHILE iterator < length of string_array
  saved_string = saved_string + current_string
  iterator = iterator + 1

PRINT saved_string

END


3. a method that takes an array of integers, and returns a new array with every other element
*** Casual Pseudo-code ***
Given an array of integers
- save an empty array
- Iterate through the array
  - if index of the current value is odd, 
    -then add the value to the end of the saved array
-return saved array

*** Formal Pseudo-code ***
START
Given an array of integers called "int_array"

SET iterator = 0
SET new_array = empty array

WHILE iterator < length of int_array
  IF iterator is odd
    add current value to new_array

PRINT new_array

END

=end