def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

p square(5) # => 25
p square(-8) # => 64

# Further Exploration
def calc_power(num, power)
  return 1 if power == 0
  return num if power == 1
  multiply(num ** power, 1)
end

p calc_power(2, 0)
p calc_power(2, 1)
p calc_power(2, 2)
p calc_power(2, 3)
p calc_power(2, 4)