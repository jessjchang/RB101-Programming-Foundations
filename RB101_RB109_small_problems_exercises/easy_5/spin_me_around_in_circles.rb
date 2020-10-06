=begin
You are given a method named spin_me that takes a string as an argument and returns a string that 
contains the same words, but with each word's characters reversed. Given the method's implementation, 
will the returned string be the same object as the one passed in as an argument or a different object?
=end

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

str = "hello world"
puts str.object_id # 70180873052840
puts spin_me(str).object_id # 70180873052620
=begin
As we can see, the string passed in as an argument is a different object than the string returned.
This is because when we call String#split on the string, we convert it into an array object. 
As we call the reverse! method on each element of the array using Array#each, the elements themselves
are being mutated in place, so the array object is remaining the same. However, when we call Array#join 
on the array at the very end, a new String object different from the original one passed in is returned. 
It's not possible to get back to the original String object after calling the #split method on it, as #join
returns a new string.
=end