# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |placement, words_array|
  words_array.each do |word|
    word.chars.each do |char|
      puts char if char =~ /[aeiou]/
    end
  end
end