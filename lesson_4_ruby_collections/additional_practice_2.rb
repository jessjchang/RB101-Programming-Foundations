ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# Using Hash#each
sum_of_ages = 0

ages.each { |name, age| sum_of_ages += age }

p sum_of_ages

# Using Hash#values and Enumerable#reduce
sum_of_ages = ages.values.reduce(:+)

p sum_of_ages

# Using a loop
sum_of_ages = 0
counter = 0
age_values = ages.values

loop do
  break if counter == age_values.size
  current_age = age_values[counter]
  sum_of_ages += current_age
  counter += 1
end

p sum_of_ages