def valid_integer?(num)
  num.to_i.to_s == num && num.to_i >= 1
end

def valid_operation?(input)
  input.downcase == 's' || input.downcase == 'p'
end

def calc_sum(num)
  (1..num).sum
end

def calc_product(num)
  (1..num).reduce(:*)
end

puts ">> Please enter an integer greater than 0: "
integer = ''
loop do
  integer = gets.chomp
  break if valid_integer?(integer)
  puts ">> Not a valid integer! Try again: "
end

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = ''
loop do
  operation = gets.chomp
  break if valid_operation?(operation)
  puts ">> Not a valid operation! Enter 's' to compute sum or 'p' to compute product: "
end

if operation == 's'
  sum = calc_sum(integer.to_i)
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
else
  product = calc_product(integer.to_i)
  puts "The product of the integers between 1 and #{integer} is #{product}."
end