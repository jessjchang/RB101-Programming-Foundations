=begin
Describe the difference between ! and ? in Ruby. 
  It depends on the use case of these symbols. If seen at the end of methods, then it's not certain what the method does as they're part of the method name,
  but in other cases, these symbols are part of Ruby syntax.

And explain what would happen in the following scenarios:
1. what is != and where should you use it?
  != means 'not equal' in Ruby. It can be used in conditionals to compare if two values are not equal to each other

2. put ! before something, like !user_name
  ! before something would mean 'not', so it would turn the object into the opposite boolean value.
  For example, if user_name = 'hello', since everything except false and nil in Ruby is truthy, then !user_name would return false.

3. put ! after something, like words.uniq!
  ! after a method in Ruby is part of the method name itself. Usually, it means that the method is destructive,
  for example, words.uniq! modifies the words array. However, because ! at the end of a method name is not actual Ruby syntax, one can't
  just assume exactly what the method does if it has a ! at the end of it, it would depend on the method itself

4. put ? before something
  ? before something is the ternary operator used in if/else conditional statements. 
  For example, the expression 5 < 6 ? "5 is less than 6" : "5 is not less than 6?!" would always return "5 is less than 6",
  as this is equivalent to the expression:
  if 5 < 6
    "5 is less than 6"
  else
    "5 is not less than 6?!"
  end

5. put ? after something
  ? after a method in Ruby is part of the method name. Usually, it means the method will return a boolean value.
  For example, the Hash#key? method returns true if the hash the method is called on contains the provided key value passed in as an argument, and false if it does not.
  However, because ? at the end of a method name is not actual Ruby syntax, one can't
  just assume exactly what the method does if it has a ? at the end of it, it would depend on the method itself

6. put !! before something, like !!user_name
  !! before something would turn the object into its boolean value.
  For example, if user_name = 'hello', since everything except false and nil in Ruby is truthy, then !!user_name would return true.
=end