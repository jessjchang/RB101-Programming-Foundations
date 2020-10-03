SQMETER_TO_SQFEET = 10.7639

puts "Enter the length of the room in meters: "
length_meters = gets.chomp.to_f

puts "Enter the width of the room in meters: "
width_meters = gets.chomp.to_f

area_meters = (length_meters * width_meters).round(2)
area_feet = (area_meters * SQMETER_TO_SQFEET).round(2)
puts "The area of the room is #{area_meters} square meters (#{area_feet} square feet)."

# Further Exploration
SQFEET_TO_SQIN = 12
SQIN_TO_SQCM = 2.54

puts "Enter the length of the room in feet: "
length_feet = gets.chomp.to_f

puts "Enter the width of the room in feet: "
width_feet = gets.chomp.to_f

area_feet = (length_feet * width_feet).round(2)
area_in = (area_feet * SQFEET_TO_SQIN).round(2)
area_cm = (area_in * SQIN_TO_SQCM).round(2)

puts "The area of the room is #{area_feet} square feet, #{area_in} square inches, and #{area_cm} square centimeters."




