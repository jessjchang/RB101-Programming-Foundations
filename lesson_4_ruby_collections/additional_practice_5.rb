flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Using Enumerable#each_with_index
be_name_index = nil

flintstones.each_with_index do |name, index| 
  if name.start_with?('Be')
    be_name_index = index 
    break
  end
end

p be_name_index

# Using Array#index
be_name_index = flintstones.index { |name| name.start_with?('Be') }

p be_name_index

# Using a loop
be_name_index = nil
counter = 0

loop do
  break if counter == flintstones.size
  current_name = flintstones[counter]
  if current_name.start_with?('Be')
    be_name_index = counter
    break
  end
  counter += 1
end

p be_name_index