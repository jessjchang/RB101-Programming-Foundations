=begin
Write a method that takes a string argument and returns a new string that contains the value 
of the original string with all consecutive duplicate characters collapsed into a single character. 
You may not use String#squeeze or String#squeeze!.

*** Understand the Problem ***
-Input: string
-Output: string 
  -any characters that are duplicated consecutively in given string will be collapsed into single character
-Rules:
  -do we need to worry about case sensitivity? (e.g. would 'A' be considered the same character as 'a'?)

*** Data Structure ***
-input: string
-output: string

*** Algorithm ***
-initialize empty array
-iterate through the string
  -for each character, push it into the array unless array.last == character
-join the array
=end

def crunch(string)
  string_array = []
  string.each_char { |char| string_array << char unless string_array.last == char }
  string_array.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# Further Exploration
def crunch2(string)
  string.gsub(/(.)\1+/, '\1')
end

p crunch2('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch2('4444abcabccba') == '4abcabcba'
p crunch2('ggggggggggggggg') == 'g'
p crunch2('a') == 'a'
p crunch2('') == ''