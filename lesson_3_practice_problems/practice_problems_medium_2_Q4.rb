def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" # => "My string looks like this now: pumpkinsrutabaga"
puts "My array looks like this now: #{my_array}" # => "My array looks like this now: ["pumpkins"]"

=begin
When we pass in the argument my_string to tricky_method_two, we are passing in a reference to a String object "pumpkins",
and the method initializes a new local variable represented by a_string_param to store the reference to that object. This local variable
only exists within the method definition scope. The String#<< operation appends 'rutabaga' to the existing String object, so a_string_param and 
my_string are still pointing to the same, now modified, String object.

When we pass in the argument my_array to the method, we are passing in a reference to an Array object ["pumpkins"], and this reference is assigned to
a new local variable an_array_param that exists only within the method definition. When we use the Array#= assignment, however, the local variable an_array_param
now actually points to a new Array object ["pumpkins", "rutabaga"], while my_array outside of the method still references the original Array object ["pumpkins"].
=end