=begin
Let's build another program using madlibs. We made a program like this in the easy exercises. 
This time, the requirements are a bit different.

Make a madlibs program that reads in some text from a text file that you have created, and then plugs 
in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. 
You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, 
but the text data should come from a file or other external source. Your program should read this text, 
and for each line, it should place random words of the appropriate types into the text, and print the result.
=end

ADJ = %w(quick lazy sleepy ugly)
NOUNS = %w(fox dog head leg)
VERBS = %w(jumps lifts bites licks)
ADV = %w(easily lazily noisily excitedly)

text = File.read('madlibs_text.txt')
words = text.split(/(\s)/)
words.map! do |word|
  format(word, adjective: ADJ.sample, noun: NOUNS.sample, verb: VERBS.sample, adverb: ADV.sample)
end
puts words.join


