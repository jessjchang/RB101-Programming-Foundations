print "What is your name? "
name = gets.chomp

if name.end_with?("!")
  name.chop!.upcase!
  puts "HELLO #{name}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
