flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Using Array#map!
flintstones.map! { |name| name.slice(0, 3) }

p flintstones

# Using Array#each
flintstones.each { |name| name.slice!(3..-1) }

p flintstones

# Using a loop
counter = 0

loop do
  break if counter == flintstones.size
  current_name = flintstones[counter]
  current_name.slice!(3..-1)
  counter += 1
end

p flintstones