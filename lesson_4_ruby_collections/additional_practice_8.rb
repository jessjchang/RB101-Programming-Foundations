numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

=begin
Output:
1
3
Return value: [3, 4]
=end



numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

=begin
Output:
1
2
Return value: [1, 2]
=end