=begin
Write a method that takes two strings as arguments, determines the longest of the two strings, 
and then returns the result of concatenating the shorter string, the longer string, 
and the shorter string once again. You may assume that the strings are of different lengths.

*** Understanding the Problem ***
-Input: 2 strings
-Output: one string
  -string will consist of shorter input string + longer input string + shorter input string
-Rules:
  -the two given strings will be of different lengths
  -should we assume spaces/punctuation count?

*** Data structures ***
-input: strings
-output: string

*** Algorithm ***
-define method short_long_short that takes 2 parameters
-determine length of both strings
-if length of string1 > length of string2
  -then, return string2 + string1 + string2
else
  -return string1 + string2 + string1
=end

def short_long_short(str1, str2)
  if str1.length > str2.length
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end


p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"