ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# Using Hash#keep_if
ages.keep_if { |name, age| age < 100 }

p ages

# Using Hash#delete_if
ages.delete_if { |name, age| age >= 100 }

p ages

# Using a loop
name_keys = ages.keys
age_values = ages.values
counter = 0

loop do
  break if counter == age_values.size
  current_name = name_keys[counter]
  current_age = age_values[counter]
  ages.delete[current_name] if current_age > 100
  counter += 1
end

p ages