=begin
Write a method that returns a list of all substrings of a string that start at the beginning of the 
original string. The return value should be arranged in order from shortest to longest substring.

*** Understand the Problem ***
-Input: string
-Output: array of substrings
-Rules:
  -output array should be sorted by order of shortest to longest substrings
  -output array's first element will be the first character of the given string
  -if input string is one character, output will be one-element array containing the string
-Assumptions:
  -input string will never be empty?
  -input string will only contain alphabetic characters e.g. no blanks/punctuation etc.?

*** Data Structures ***
-Input: string
-Output: array

*** Algorithm ***
-initialize empty array to store substrings
-from 1 up to the length of the string
  -use slice to create substrings of the string based off current counter which will serve as 
  length of substring, and add to the empty array
-return substring array
=end

def leading_substrings(str)
  substrings = []
  1.upto(str.length) do |counter|
    substrings << str[0, counter]
  end
  substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']