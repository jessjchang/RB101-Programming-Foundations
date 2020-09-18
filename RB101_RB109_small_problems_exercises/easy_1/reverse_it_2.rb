=begin
Write a method that takes one argument, a string containing one or more words, 
and returns the given string with words that contain five or more characters reversed. 
Each string will consist of only letters and spaces. 
Spaces should be included only when more than one word is present.

Examples:
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

*** Understand the problem ***
-write method named reverse_words
-input: 
  -pass one argument (a string containing one or more words - strings will only contain letters and spaces)
   into method
-output: 
  -string
    -if word within string contains five or more characters, it will be reversed
    -if word within string contains less than five characters, it will be returned as is
    -spaces from original string will remain - should I assume there will only ever be one space between words/
    if multiple spaces included in the input string, should output string retain those spaces?
    -assuming case remains as is (uppercase character will remain uppercase, lowercase will remain lowercase)

*** Data structures ***
-input is a string
-convert input string to array, where each element is a word in the string
-output is a string

*** Algorithm ***
1. define method with one parameter, a string
2. convert string to array using #split, with space serving as the delimiter
3. create empty array to store new words
3. iterate through the array
  -if current element length is greater than or equal to 5, reverse it, and push to the end of the new array
  -else, push current element to the new array
4. join the new array with space between elements

=end

# *** CODE ***
def reverse_words(string)
  string_array = string.split
  new_array = []
  string_array.each do |word|
    if word.length >= 5
      new_array.push(word.reverse)
    else
      new_array.push(word)
    end
  end
  new_array.join(' ')
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS