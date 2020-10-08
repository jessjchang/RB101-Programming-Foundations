ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# Using each
min_age = ages.first.last

ages.each do |name, age|
  min_age = age if age < min_age
end

p min_age

# Using Array#min
min_age = ages.values.min

p min_age

# Using a loop
age_values = ages.values
counter = 0
min_age = ages.first.last

loop do
  break if counter == age_values.size
  current_age = age_values[counter]
  min_age = current_age if current_age < min_age
  counter += 1
end

p min_age