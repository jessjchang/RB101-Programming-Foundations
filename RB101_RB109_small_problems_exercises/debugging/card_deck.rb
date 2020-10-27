=begin
We started working on a card game but got stuck. Check out why the code below raises a TypeError.

Once you get the program to run and produce a sum, you might notice that the sum is off: 
It's lower than it should be. Why is that?

We assigned the same array referenced by variable cards to each key in our initialization of the deck variable,
so when we call #shuffle! and #pop on this array later, we are mutating the same array for all 4 suits, when 
we really only want to do that for the one suit. 
=end

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.dup,
         :diamonds => cards.dup,
         :clubs    => cards.dup,
         :spades   => cards.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  scores = remaining_cards.map do |card|
    score(card)
  end

  sum += scores.sum
end

puts sum