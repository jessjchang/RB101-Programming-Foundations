=begin
A Rational Number is any number that can be represented as the result of the division between two integers, 
e.g., 1/3, 3/2, 22/7, etc. The number to the left is called the numerator, and the number to the right is 
called the denominator.

A Unit Fraction is a rational number where the numerator is 1.

An Egyptian Fraction is the sum of a series of distinct unit fractions (no two are the same), such as:
1   1    1    1
- + - + -- + --
2   3   13   15

Every positive rational number can be written as an Egyptian fraction. For example:

    1   1   1   1
2 = - + - + - + -
    1   2   3   6

Write two methods: one that takes a Rational number as an argument, and returns an Array of the denominators 
that are part of an Egyptian Fraction representation of the number, and another that takes an Array of 
numbers in the same format, and calculates the resulting Rational number. You will need to use the Rational 
class provided by Ruby.

*** Understand the Problem ***
egyptian method
-Input: rational number
-Output: array of integers
-Rules:
  -return array of denominators that are part of Egyptian Fraction representation of the given rational number
  -Egyptian Fraction is the sum of a series of distinct unit fractions (unit fraction is a rational number
  where numerator is 1)

unegyptian method
-Input: array of integers
-Output: rational number
-Rules:
  -array of integers represents denominators of an Egyptian Fraction representation of a number
  -calculate the resulting rational number from the given array and return it

*** Algorithm ***
egyptian method:
-initialize an empty array to store your denominators
-start at fraction denominator of 1
-loop:
  -break if target number == 0
  -initialize your unit fraction (1/fraction_denominator)
  -if the current unit fraction is <= target number:
    -subtract from the target number the unit fraction and reassign as the new target number
    -add the fraction denominator to the empty array
  -increment the fraction denominator by 1
-return the array

unegyptian method:
-map through the array and convert to unit fractions
-sum them all up


=end
def egyptian(num)
  denominators = []
  fraction_denominator = 1
  loop do
    break if num.zero?
    unit_fraction = Rational(1, fraction_denominator)
    if unit_fraction <= num
      num -= unit_fraction
      denominators << fraction_denominator
    end
    fraction_denominator += 1
  end
  denominators
end

def unegyptian(arr)
  arr.map { |denominator| Rational(1, denominator) }.reduce(:+)
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)