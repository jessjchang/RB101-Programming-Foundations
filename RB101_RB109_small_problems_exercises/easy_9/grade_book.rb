=begin
Write a method that determines the mean (average) of the three scores passed to it, 
and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	    'A'
80 <= score < 90	      'B'
70 <= score < 80	      'C'
60 <= score < 70	      'D'
0 <= score < 60	        'F'

Tested values are all between 0 and 100. 
There is no need to check for negative values or values greater than 100.

*** Understand the Problem ***
-Input: 3 integers
-Output: string
-Rules:
  -each input integer will always be between 0 and 100 (assuming inclusive)
  -based off table above, output string will be the grade letter based off average of the three input integers
  -assuming average means take the sum of the 3 input integers and divide by 3

*** Data Structures ***
-Input: integer
-Output: string

*** Algorithm ***
-sum up all three input integers and divide by 3 to calculate the average
-if the range 90 to 100 includes the score, then return 'A'
-if range 80 to 90 includes the score, return 'B'
-if range 70 to 80 includes the score, return 'C'
-if range 60 t0 70 includes the score, return 'D'
-otherwise, return 'F'
=end

def get_grade(score1, score2, score3)
  average_score = (score1 + score2 + score3) / 3
  case average_score
  when 90..100 then 'A'
  when 80..90 then  'B'
  when 70..80 then  'C'
  when 60..70 then  'D'
  else              'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# Further Exploration
def get_grade2(score1, score2, score3)
  average_score = (score1 + score2 + score3) / 3
  case average_score
  when 90..   then 'A'
  when 80..90 then 'B'
  when 70..80 then 'C'
  when 60..70 then 'D'
  else             'F'
  end
end

p get_grade2(103, 100, 102) == 'A'