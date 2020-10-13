=begin
Write a method that returns a list of all substrings of a string. The returned list should be ordered 
by where in the string the substring begins. This means that all substrings that start at position 0 
should come first, then all substrings that start at position 1, and so on. 
Since multiple substrings will occur at each position, the substrings at a given position should 
be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise:

*** Understand the Problem ***
-Input: string
-Output: array of substrings
-Rules:
  -use leading_substrings method from previous exercise
  -output array will contain all substrings of input string
  -output array should be ordered by where in the string the substring begins
    -all substrings that start at index 0 of input string should come first in array, then all
    substrings that start at index 1, etc.
  -output array substrings at given position should be in order from shortest to longest

*** Data Structures ***
-Input: string
-Output: array

*** Algorithm ***
-initialize empty array to store substrings
-for string.size number of times
  -call leading_substrings on the input string
    -iterate through the return value and append each element to your empty array
  -call #slice! on the string to remove the first character
-return the substring array
=end

def leading_substrings(str)
  substrings = []
  1.upto(str.length) do |counter|
    substrings << str[0, counter]
  end
  substrings
end

def substrings(str)
  all_substrings = []
  str.length.times do 
    leading_substrings(str).each { |substring| all_substrings << substring }
    str.slice!(0)
  end
  all_substrings
end

p (substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
])