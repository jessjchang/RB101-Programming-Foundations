=begin
Write a method that takes a single String argument and returns a new string that contains the original value 
of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

*** Understand the Problem ***
-Input: string
-Output: new string
-Rules:
  -output string will be a new string that contains original value of argument string, but with the 
  first character of each word capitalized and all other letters lowercased
  -"word" is considered any sequence of characters separated by a space
  -if there is a symbol like double quotes as the first character of a "word", then that is considered the 
  first character, so the subsequent letter will not be capitalized

*** Data Structures ***
-Input: string
-Output: new string
-use array to iterate through each word of argument string

*** Algorithm ***
-split the argument string into an array of words
-iterate through each word using #map
  -capitalize the first character of each word
-join the array with spaces
=end

def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Further Exploration - Solution 1
def word_cap2(str)
  capitalized_words = []
  str.split.each do |word|
    index = 0
    capitalized_word = ''
    word.each_char do |char|
      if index == 0
        capitalized_word << char.upcase
      else 
        capitalized_word << char.downcase
      end
      index += 1
    end
    capitalized_words << capitalized_word
  end
  capitalized_words.join(' ')
end

p word_cap2('four score and seven') == 'Four Score And Seven'
p word_cap2('the javaScript language') == 'The Javascript Language'
p word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'

# Further Exploration - Solution 2
def word_cap3(str)
  capitalized_words = []
  str.downcase.split.each do |word|
    if word.start_with?(/[a-z]/)
      capitalized_words << word[0].upcase + word[1..-1]
    else
      capitalized_words << word
    end
  end
  capitalized_words.join(' ')
end

p word_cap3('four score and seven') == 'Four Score And Seven'
p word_cap3('the javaScript language') == 'The Javascript Language'
p word_cap3('this is a "quoted" word') == 'This Is A "quoted" Word'