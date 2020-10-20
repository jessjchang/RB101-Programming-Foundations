# ---------- YAML Module ---------- #
require 'yaml'
MESSAGES = YAML.load_file('twenty_one_messages.yml')

# ---------- Constants ---------- #
DECK_SUITS = {
  'H' => 'Hearts',
  'D' => 'Diamonds',
  'C' => 'Clubs',
  'S' => 'Spades'
}

DECK_CARD_VALUES = {
  '2' => '2',
  '3' => '3',
  '4' => '4',
  '5' => '5',
  '6' => '6',
  '7' => '7',
  '8' => '8',
  '9' => '9',
  '10' => '10',
  'J' => 'Jack',
  'Q' => 'Queen',
  'K' => 'King',
  'A' => 'Ace'
}

VALID_MOVES = %w(hit stay h s)

WINNING_SCORE = 5

WHATEVER_ONE = 21

DEALER_HIT_LIMIT = WHATEVER_ONE - 4

# ---------- Methods ---------- #
def clear_screen
  system('clear')
end

def messages(msg_key)
  MESSAGES[msg_key]
end

def prompt(msg_key,
           custom_data1='',
           custom_data2 = '',
           custom_data3 = '',
           custom_data4 = '')
  message = if custom_data1
              format(messages(msg_key),
                     custom_data1: custom_data1,
                     custom_data2: custom_data2,
                     custom_data3: custom_data3,
                     custom_data4: custom_data4)
            else
              messages(msg_key)
            end

  puts("=> #{message}")
end

def pause_prompt
  sleep(1.5)
end

def valid_name?(name)
  /\A[[:alpha:]]*[[:blank:]]?([[:alpha:]]+)\z/.match(name)
end

def retrieve_name
  name = ''
  loop do
    name = gets.chomp
    break if valid_name?(name)
    prompt('invalid_name')
  end
  name
end

def display_greeting
  prompt('welcome')
  name = retrieve_name
  puts "\n"
  prompt('greeting', name)
  pause_prompt
end

def enter_to_continue
  prompt('enter_to_continue')
  STDIN.gets
end

def display_rules
  clear_screen
  prompt('rules', WHATEVER_ONE, WINNING_SCORE)
  enter_to_continue
  clear_screen
end

def starting_score
  { player_score: 0, dealer_score: 0 }
end

def initialize_deck
  DECK_CARD_VALUES.keys.product(DECK_SUITS.keys).shuffle
end

def initialize_hands
  { player_cards: {},
    dealer_cards: {},
    player_total: 0,
    dealer_total: 0 }
end

def draw_card(deck)
  deck.shift
end

def card_name(card)
  "#{DECK_CARD_VALUES[card.first]} of #{DECK_SUITS[card.last]}"
end

def correct_for_aces(card_values, sum)
  num_aces = card_values.count('A')
  num_aces.times { sum -= 10 if sum > WHATEVER_ONE }
  sum
end

def calculate_total(hands, user)
  user_cards = (user == 'player' ? :player_cards : :dealer_cards)
  card_values = hands[user_cards].keys.map(&:first)

  sum = 0
  card_values.each do |card_value|
    sum += if card_value == 'A'
             11
           elsif card_value.to_i == 0
             10
           else
             card_value.to_i
           end
  end

  correct_for_aces(card_values, sum)
end

def update_user_cards(deck, hands, user)
  new_card = draw_card(deck)
  if user == 'player'
    hands[:player_cards][new_card] = card_name(new_card)
  else
    hands[:dealer_cards][new_card] = card_name(new_card)
  end
end

def update_total(hands, user)
  if user == 'player'
    hands[:player_total] = calculate_total(hands, 'player')
  else
    hands[:dealer_total] = calculate_total(hands, 'dealer')
  end
end

def update_hands(deck, hands, user)
  update_user_cards(deck, hands, user)
  update_total(hands, user)
end

def initial_deal(deck, hands)
  2.times do
    player_card = draw_card(deck)
    hands[:player_cards][player_card] = card_name(player_card)
    dealer_card = draw_card(deck)
    hands[:dealer_cards][dealer_card] = card_name(dealer_card)
  end
  update_total(hands, 'player')
  update_total(hands, 'user')
end

def display_initial_deal(hands)
  prompt('lets_play')
  prompt('player_initial_deal',
         hands[:player_cards].values.first,
         hands[:player_cards].values.last,
         hands[:player_total])
  prompt('dealer_initial_deal',
         hands[:dealer_cards].values.first)
end

def valid_choice?(input)
  VALID_MOVES.include?(input)
end

def joinand(card_names, delimiter=', ', joining_word='and')
  case card_names.size
  when 1 then card_names.first
  when 2 then "#{card_names.first} #{joining_word} #{card_names.last}"
  else
    card_names.each_with_object("") do |card_name, str|
      str << if card_name == card_names.last
               "#{joining_word} #{card_name}"
             else
               "#{card_name}#{delimiter}"
             end
    end
  end
end

def display_cards(hands, user)
  user_prompt = (user == 'player' ? 'YOUR' : "DEALER'S")
  cards = (user == 'player' ? hands[:player_cards] : hands[:dealer_cards])
  total = (user == 'player' ? hands[:player_total] : hands[:dealer_total])

  prompt('display_cards', user_prompt, joinand(cards.values), total)
  pause_prompt
end

def detect_winner(hands)
  if busted?(hands[:player_total])
    'Dealer'
  elsif busted?(hands[:dealer_total])
    'Player'
  elsif hands[:player_total] > hands[:dealer_total]
    'Player'
  elsif hands[:dealer_total] > hands[:player_total]
    'Dealer'
  end
end

def display_winner(hands)
  case detect_winner(hands)
  when 'Player'
    prompt('final_winner', 'YOU!')
  when 'Dealer'
    prompt('final_winner', 'DEALER')
  else
    prompt('tie')
  end
  prompt('winner_divider')
  pause_prompt
end

def display_round_result(hands)
  clear_screen
  prompt('display_round_result')
  display_cards(hands, 'player')
  display_cards(hands, 'dealer')
  prompt('scores_divider')
  display_winner(hands)
end

def get_player_choice(hands)
  player_choice = ''
  loop do
    prompt('get_player_choice')
    player_choice = gets.chomp.downcase
    if valid_choice?(player_choice)
      break
    elsif player_choice == 'rules'
      display_rules
      display_cards(hands, 'player')
      prompt('dealer_initial_deal', hands[:dealer_cards].values.first)
    else
      prompt('invalid_player_choice')
    end
  end
  player_choice
end

def player_turn(deck, hands)
  loop do
    player_choice = get_player_choice(hands)
    break if ['s', 'stay'].include?(player_choice)

    update_hands(deck, hands, 'player')
    next_card = hands[:player_cards].values.last
    prompt('hit', 'YOU', next_card)
    display_cards(hands, 'player')
    break if busted?(hands[:player_total])
  end
end

def busted?(total)
  total > WHATEVER_ONE
end

def display_player_outcome(hands, scores)
  if busted?(hands[:player_total])
    prompt('player_bust')
    enter_to_continue
    display_end_round_details(hands, scores)
  else
    puts "\n"
    prompt('player_stay', hands[:player_total])
  end
end

def match_over_after_player_bust?(hands, scores)
  if busted?(hands[:player_total])
    match_over?(scores)
  end
end

def dealer_turn(deck, hands)
  pause_prompt
  loop do
    break if hands[:dealer_total] >= DEALER_HIT_LIMIT
    update_hands(deck, hands, 'dealer')
    next_card = hands[:dealer_cards].values.last
    prompt('hit', 'DEALER', next_card)
    display_cards(hands, 'dealer')
  end
end

def display_dealer_outcome(hands, scores)
  if busted?(hands[:dealer_total])
    prompt('dealer_bust', hands[:dealer_total], WHATEVER_ONE)
    enter_to_continue
    display_end_round_details(hands, scores)
  else
    prompt('dealer_stay')
    enter_to_continue
  end
end

def display_compared_result(hands, scores)
  if !busted?(hands[:dealer_total])
    display_end_round_details(hands, scores)
  end
end

def update_score(hands, scores)
  case detect_winner(hands)
  when 'Player'
    scores[:player_score] += 1
  when 'Dealer'
    scores[:dealer_score] += 1
  else
    scores
  end
end

def display_current_score(scores)
  prompt('display_current_score',
         scores[:player_score],
         scores[:dealer_score])

  pause_prompt
end

def match_over?(scores)
  scores[:player_score] == WINNING_SCORE ||
    scores[:dealer_score] == WINNING_SCORE
end

def display_match_status(hands, scores)
  update_score(hands, scores)
  display_current_score(scores)

  if match_over?(scores)
    prompt('match_over', WINNING_SCORE)
    pause_prompt
    display_grand_winner(scores)
  else
    prompt('match_continues', WINNING_SCORE)
    enter_to_continue
  end
end

def display_end_round_details(hands, scores)
  display_round_result(hands)
  display_match_status(hands, scores)
end

def display_grand_winner(scores)
  if scores[:player_score] == WINNING_SCORE
    prompt('display_grand_winner', 'YOU!')
  elsif scores[:dealer_score] == WINNING_SCORE
    prompt('display_grand_winner', 'DEALER')
  end
  pause_prompt
end

def replay?
  prompt('replay')

  replay_input = ''
  loop do
    replay_input = gets.chomp
    break if ['y', 'yes', 'n', 'no'].include?(replay_input.downcase)
    puts "\n"
    prompt('invalid_replay_input')
  end

  ['y', 'yes'].include?(replay_input.downcase)
end

def display_goodbye
  prompt('goodbye')
end

# ---------- Program start ---------- #
clear_screen

display_greeting
display_rules

# ---------- Main loop ---------- #
loop do
  scores = starting_score

  loop do
    clear_screen

    deck = initialize_deck
    hands = initialize_hands

    initial_deal(deck, hands)
    display_initial_deal(hands)

    player_turn(deck, hands)
    display_player_outcome(hands, scores)
    break if match_over_after_player_bust?(hands, scores)
    next if busted?(hands[:player_total])

    dealer_turn(deck, hands)
    display_dealer_outcome(hands, scores)

    display_compared_result(hands, scores)

    break if match_over?(scores)
  end

  break unless replay?
end
display_goodbye
