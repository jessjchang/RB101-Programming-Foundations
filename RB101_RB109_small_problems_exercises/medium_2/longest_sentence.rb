=begin
Write a program that reads the content of a text file and then prints the longest sentence in the file
based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?).
Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word.
You should also print the number of words in the longest sentence.

Example text:
Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.

The longest sentence in the above text is the last sentence; it is 86 words long.
(Note that each -- counts as a word.)

*** Understand the Problem ***
-Input: text file contents - string
-Output: 2 strings
  -the longest sentence in the file
  -number of words in the sentence
-Rules:
  -sentences end with periods(.), exclamation points(!), or question marks(?)
  -word: any sequence of characters that aren't spaces or sentence-ending characters
    -not necessarily alphabetic characters e.g. the symbol '--' counts as a word when separated from other
    words by spaces
-Question:
  -what happens if two sentences are both equally the longest sentence in the text file?

*** Data Structures ***
-Input: string
-Output: string
-array

*** Algorithm ***
-open and read the text file
-split the text into an array of separate sentences
-initialize variable to store the largest number of words in a sentence as 0
-initialize longest sentence variable ''
-iterate through the sentences array
  -for each sentence, split into array of words
  -find the size of the array
  -if size of the array > number of words variable, then reassign the words variable and reassign the longest
  sentence variable
-output the longest sentence and the number of words
=end

text = File.read('pg84.txt')
sentences = text.split(/\.|\?|!/)
word_count = 0
longest_sentence = ''
sentences.each do |sentence|
  if sentence.split.size > word_count
    word_count = sentence.split.size
    longest_sentence = sentence
  end
end
puts "#{longest_sentence}"
puts "The longest sentence contains #{word_count} words."

# Further Exploration
text = File.read('pg84.txt')
words = text.delete("^a-zA-Z ").split
longest_word = words.max_by { |word| word.size }
puts "#{longest_word}"
puts "The longest word contains #{longest_word.size} characters."

paragraphs = text.split("\n\n")
longest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size }
puts "#{longest_paragraph}"
puts "The longest paragraph contains #{longest_paragraph.split.size} words."

sentences = text.split(/([\.\?\!])/)
longest_sentence = sentences.max_by { |sentence| sentence.split.size }
longest_sentence += sentences[sentences.find_index(longest_sentence) + 1]
longest_sentence = longest_sentence.strip

puts "#{longest_sentence}"
puts "The longest sentence contains #{longest_sentence.split.size} words."
