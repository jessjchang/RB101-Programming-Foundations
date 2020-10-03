name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

=begin
Output:

Alice
Bob
=end

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

=begin
Output:

BOB
BOB

In the first example, the variable name references a String object 'Bob', and when we assign name to save_name,
save_name now also points to the same String object 'Bob'. Then, in line 3, we are reassigning name to point to a 
different String object 'Alice', so when we call puts on these two variables, we are seeing that name now
points to 'Alice', while save_name still points to 'Bob'.

However, in the second example, the variable name is once again referencing a String object 'Bob', and we 
again initialize save_name on line 14 and assign it to store the same String object 'Bob', so name and save_name at this point are referencing
the same String object. When we call the String#upcase! method, this is a destructive method, meaning it will mutate 
the object in place, so it modifies the String object 'Bob' in place instead of creating a new String object. 
Thus, name and save_name are still referencing the same, now modified, String object 'BOB'.
=end
