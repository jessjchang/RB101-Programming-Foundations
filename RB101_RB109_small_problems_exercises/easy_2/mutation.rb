array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin
Output:

Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo

In line 1, we initialize array1 to reference an Array object with 8 String objects as individual elements.
In line 2, we initialize array2 to point to a different empty Array object.
Then, in line 3, we iterate through the Array object array1 is referencing, and we call the Array#<< method,
essentially copying the same String object references over to array2, so now the array2 Array object consists of pointers to the same String object elements as array1.
On line 4, we iterate through the Array object referenced by array1 once again, and we call the mutating method String#upcase! on 
each of the String objects in the array. By doing this, the String objects (whose values start with a 'C' or an 'S') are modified
in place, so the String objects being pointed to by the array2 Array object are the same ones being modified.

In order to avoid this feature of Ruby, for example if we wanted array1 to end up consisting of the upcased String objects, but array2 to remain 
all lower-cased, on Line 4, instead of calling String#upcase!, we would simply just call String#upcase so that the String objects
are not modified in place, but rather new String objects (that are upcased) will be referenced by array1, while array2 still points to the original
lowercase String objects. 
=end