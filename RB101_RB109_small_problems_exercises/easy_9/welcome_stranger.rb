=begin
Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, 
when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, 
:title and :occupation, and the appropriate values. Your method should return a greeting that uses 
the person's full name, and mentions the person's title and occupation.

*** Understand the Problem ***
-Input: array and hash
  -array will contain 2 or more elements that, when combined with spaces, will produce a name
  -hash will contain 2 keys, :title and :occupation, and corresponding values
-Output: string
  -greeting that uses person's full name, title, occupation
-Rules:
  -output will be returned by the method, not printed to screen

*** Data Structures ***
-Input: array and hash 
-Output: string

*** Algorithm ***
-join all elements in array separated by spaces to form the full name and assign to variable name
-concatenate the title and occupation from the hash to form full job description and assign to variable
-return both within a string
=end

def greetings(arr, hash)
  name = arr.join(' ')
  job = "#{hash[:title]} #{hash[:occupation]}"
  "Hello, #{name}! Nice to have a #{job} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.