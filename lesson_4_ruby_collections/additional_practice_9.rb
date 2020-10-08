words = "the flintstones rock"

# => words = "The Flintstones Rock"

# Using Array#map!
def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

p titleize(words)


# Using a loop
def titleize2(string)
  counter = 0
  string_array = string.split

  loop do
    break if counter == string_array.size
    current_word = string_array[counter]
    current_word.capitalize!
    counter += 1
  end

  string_array.join(' ')
end

p titleize2(words)