=begin
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase 
characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the 
percentage of characters in the string that are lowercase letters, one the percentage of characters that 
are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

*** Understand the Problem ***
-Input: string
-Output: hash
-Rules:
  -input string will always contain at least one character i.e. argument will never be an empty string
  -hash will contain 3 key-value pairs - keys will be:
    -lowercase
    -uppercase
    -neither
  -hash values will represent the percentage of the string of each type
  -spaces count as a 'neither' character, as do any numeric digits and non-alphabetic characters
  -percentage is calculated as: (count / total # of characters) * 100
  -percentage values will be represented as float if it results in a decimal value i.e. only show
  decimal if there are any

*** Data Structures ***
-Input: string
-Output: hash
  -hash key will be symbol
  -hash value will be integer or float
-floats, integers

*** Algorithm ***
-initialize hash with default 0 for each type - will first use to count occurrences
-iterate through each character of the string
  -if character is a lowercase alphabetic character, increment lowercase count within hash
  -if character is uppercase alphabetic, increment uppercase count within hash
  -else, increment neither count within hash
-map through the hash, and adjust value to be (count converted to a float / length of the string) * 100
  -if this result % 1 == 0.0, then convert to integer
-return the hash
=end

def letter_percentages(str)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  str.chars.each do |char|
    if char =~ /[a-z]/
      result[:lowercase] += 1
    elsif char =~ /[A-Z]/
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
  end
  result.map do |type, count|
    count = (count.to_f / str.length) * 100
    count = count.to_i if count % 1 == 0.0
    [type, count]
  end.to_h
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 } 
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# Further Exploration
def letter_percentages2(str)  
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  str.chars.each do |char|
    if char =~ /[a-z]/
      result[:lowercase] += 1
    elsif char =~ /[A-Z]/
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
  end
  result.map do |type, count|
    count = ((count.to_f / str.length) * 100).round(2)
    [type, count]
  end.to_h
end

p letter_percentages2('abcdefGHI') == {:lowercase=>66.67, :uppercase=>33.33, :neither=>0.0}