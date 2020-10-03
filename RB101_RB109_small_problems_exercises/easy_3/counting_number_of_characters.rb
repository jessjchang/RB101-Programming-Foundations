print "Please write word or multiple words: "
input = gets.chomp

num_characters = input.gsub(' ', '').length
puts %Q(There are #{num_characters} characters in "#{input}".)

