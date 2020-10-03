CURRENT_YEAR = Time.now.year

print "What is your age? "
current_age = gets.chomp.to_i

print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

years_to_work = retirement_age - current_age
retirement_year = years_to_work + CURRENT_YEAR

puts "It's #{CURRENT_YEAR}. You will retire in #{retirement_year}."
puts "You have only #{years_to_work} years of work to go!"