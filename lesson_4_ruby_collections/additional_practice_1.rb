flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Using each_with_index
flintstones_hash = Hash.new
flintstones.each_with_index { |name, index| flintstones_hash[name] = index }

p flintstones_hash

# Using each_with_object
index = 0
flintstones_hash = flintstones.each_with_object({}) do |name, hash|
                     hash[name] = index
                     index += 1
                   end
                   
p flintstones_hash

# Using a loop
index = 0
flintstones_hash = Hash.new

loop do
  break if index == flintstones.size
  current_name = flintstones[index]
  flintstones_hash[current_name] = index
  index += 1
end

p flintstones_hash