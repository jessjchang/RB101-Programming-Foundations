def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # => "My string looks like this now: pumpkins"
puts "My array looks like this now: #{my_array}" # => "My array looks like this now: ["pumpkins", "rutabaga"]"

=begin
String#+= is reassignment. When we pass in the argument of my_string to the method tricky_method, 
we are passing a reference to a String object with a value of "pumpkins", which is then assigned to a new local variable
a_string_param initialized by the method that only exists within the scope of the method definition. When we use the String#+= method, 
this creates a new String object, so now a_string_param references/points to a new String object with a value of "pumpkinsrutabaga", and 
no longer points to the original String object "pumpkins". The original my_string variable, however, still points to the String object "pumpkins".

String#<<, however, is a destructive method that mutates the original array. When we pass in the argument of my_array to the method,
we are again passing a reference to an Array object ["pumpkins"], which is assigned to a new local variable an_array_param that is
initialized by the method and only exists within the scope of the method itself. The difference with what happened with the String object, however,
is that when we use the String#<< method, a new element "rutabaga" is appended to that same object ["pumpkins"] that is still being referenced
by both an_array_param within the method, as well as my_array outside of the method.
=end