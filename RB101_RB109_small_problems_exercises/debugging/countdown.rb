=begin
Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully 
counts down from 10 to 1.
=end

def decrease(counter)
  counter - 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

# Further Exploration
10.downto(1) { |counter| puts counter }

puts 'LAUNCH!'
