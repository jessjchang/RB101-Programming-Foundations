=begin
Mad libs are a simple game where you create a story template with blanks for words. 
You, or another player, then construct a list of words and place them into the story, 
creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb, 
and an adjective and injects those into a story that you create.

Example:
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!
=end

def get_word(type)
  print "Enter #{type.start_with?(/[aeiou]/) ? 'an' : 'a'} #{type}: "
  word = ''

  loop do
    word = gets.chomp
    if word.empty? || word =~ /[^a-z]/i
      puts "Must enter a valid word! Try again: "
    elsif type == 'adverb' && !word.end_with?('ly')
      puts "Adverb must end with '-ly'! Try again: "
    else
      break
    end
  end
  word
end

noun = get_word('noun')

verb = get_word('verb')

adjective = get_word('adjective')

adverb = get_word('adverb')

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"