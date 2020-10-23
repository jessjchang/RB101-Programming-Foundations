=begin
Write a method that takes a sentence string as input, and returns the same string with any sequence of the 
words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string 
of digits.

*** Understand the Problem ***
-Input: string (a sentence)
-Output: string
-Rules:
  -convert any sequence of words 'zero' through 'nine' converted to string of the corresponding digit instead
  -retain punctuation e.g. if sequence of words ends with 'four.', convert that to '4.'
-Questions:
  -only convert sequence of the words? E.g. if there was only one instance of 'one' followed by a non-digit
  word, should that not be converted to its digit counterpart because it's not in a sequence?
  -will input string always only consist of alphabetic characters, whitespace, punctuation?

*** Data Structures ***
-Input: string
-Output: string
-hash

*** Algorithm ***
-initialize a hash constant to store the word as a key and the corresponding digit as the value
-split the string into an array of separate words
-map through the array
  -if the current word is a key in the hash, replace it with the corresponding value
  -if the last character of the current word is non-alphabetic (e.g. a punctuation mark), look up only
  the word without the punctuation mark
-join the array back together with spaces
=end

WORD_TO_DIGIT = %w(zero one two three four five six seven eight nine).zip(('0'..'9').to_a).to_h

def word_to_digit(str)
  split_str = str.split
  split_str.map! do |word|
    no_punct_word = word.gsub(/[^a-z]/i, '')
    if WORD_TO_DIGIT.key?(word)
      WORD_TO_DIGIT[word]
    elsif WORD_TO_DIGIT.key?(no_punct_word) && word.chars.last =~ /[^a-z]/i 
      "#{WORD_TO_DIGIT[no_punct_word]}#{word.chars.last}"
    else
      word
    end
  end
  split_str.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Further Exploration
def format_phone_number(str)
  "(#{str[0, 3]}) #{str[3, 3]}-#{str[6, 4]}"
end

def word_to_digit2(str)
  adjusted_str = ''
  split_str = str.split
  split_str.each do |word|
    no_punct_word = word.gsub(/[^a-z0-9]/i, '')
    if WORD_TO_DIGIT.key?(word)
      adjusted_str << WORD_TO_DIGIT[word]
    elsif WORD_TO_DIGIT.key?(no_punct_word) && word.chars.last =~ /[^a-z0-9]/i 
      adjusted_str << "#{WORD_TO_DIGIT[no_punct_word]}#{word.chars.last} "
    else
      adjusted_str << "#{word} "
    end
  end
  adjusted_str = adjusted_str.split.join(' ')
  adjusted_str.split.map do |word|
    if word.match(/\d{10}[[:punct:]]*/)
      "#{format_phone_number(word)}#{word.chars.last}"
    else
      word
    end
  end.join(' ')
end

p word_to_digit2('3 2 1 Please call me at one two three five five five one two three four. Thanks.') #== '3 2 1 Please call me at (123) 555-1234. Thanks.'
