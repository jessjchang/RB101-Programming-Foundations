numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

=begin
numbers.uniq returns a new array [1, 2, 3] but doesn't modify original numbers array
Since we're calling puts on numbers, the output would be:
1
2
2
3
=end