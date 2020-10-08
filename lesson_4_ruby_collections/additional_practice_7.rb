statement = "The Flintstones Rock"

# => { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

# Using each_with_object
letter_frequencies = statement.gsub(' ', '').chars.each_with_object(Hash.new(0)) do |letter, letter_frequencies| 
                       letter_frequencies[letter] += 1
                     end

p letter_frequencies

# Using a loop
counter = 0
letter_array = statement.gsub(' ', '').split(//)
letter_frequencies = Hash.new(0)

loop do
  break if counter == letter_array.length
  current_letter = letter_array[counter]
  letter_frequencies[current_letter] += 1
  counter += 1
end

p letter_frequencies
