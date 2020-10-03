def format_decimal(num)
  format('%.2f', num)
end

print "What is the bill? "
bill_amount = gets.chomp.to_f

print "What is the tip percentage? "
tip_rate = gets.chomp.to_f

tip = (bill_amount * (tip_rate / 100))
total_amount = bill_amount + tip

puts "The tip is $#{format_decimal(tip)}"
puts "The total is $#{format_decimal(total_amount)}"