=begin
Write a method that takes a first name, a space, and a last name passed as a single String argument, 
and returns a string that contains the last name, a comma, a space, and the first name.

*** Understand the Problem ***
-Input: string
-Output: string
-Rules:
  -inpt string will always be a first name, space, and last name 
  -output will return a string that contains last name, comma, space, first name

*** Data Structures ***
-Input: string
-Output: string
-use array to separate the first and last name from input string

*** Algorithm ***
-split the input string into an array of [first name, last name]
-return string with "#{arr[1]}, #{arr[0]}"
=end

def swap_name(str)
  name_arr = str.split
  "#{name_arr[1]}, #{name_arr[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'