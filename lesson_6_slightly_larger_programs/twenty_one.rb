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
  { players_score: 0, dealers_score: 0 }
end

def initialize_deck
  DECK_CARD_VALUES.keys.product(DECK_SUITS.keys).shuffle
end

def draw_card(deck)
  deck.shift
end

def update_user_cards(cards, deck)
  cards << draw_card(deck)
end

def card_name(card)
  "#{DECK_CARD_VALUES[card.first]} of #{DECK_SUITS[card.last]}"
end

def user_card_names(cards)
  cards.map { |card| card_name(card) }
end

def update_user_cards_names(cards_names, card)
  cards_names << card_name(card)
end

def calculate_total(cards)
  card_values = cards.map(&:first)

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

  num_aces = card_values.count('A')
  num_aces.times { sum -= 10 if sum > WHATEVER_ONE }

  sum
end

def initial_deal(deck, players_cards, dealers_cards)
  2.times do
    players_cards << draw_card(deck)
    dealers_cards << draw_card(deck)
  end
end

def display_initial_deal(players_cards_names, dealers_cards_names,
                         players_total)
  prompt('lets_play')
  prompt('players_initial_deal',
         players_cards_names.first,
         players_cards_names.last,
         players_total)
  prompt('dealers_initial_deal',
         dealers_cards_names.first)
end

def valid_choice?(input)
  VALID_MOVES.include?(input)
end

def joinand(cards_names, delimiter=', ', joining_word='and')
  case cards_names.size
  when 1 then cards_names.first
  when 2 then "#{cards_names.first} #{joining_word} #{cards_names.last}"
  else
    cards_names.each_with_object("") do |card_name, str|
      str << if card_name == cards_names.last
               "#{joining_word} #{card_name}"
             else
               "#{card_name}#{delimiter}"
             end
    end
  end
end

def display_cards(cards_names, user, total)
  prompt('display_cards', user, joinand(cards_names), total)
  pause_prompt
end

def detect_winner(players_total, dealers_total)
  if busted?(players_total)
    'Dealer'
  elsif busted?(dealers_total)
    'Player'
  elsif players_total > dealers_total
    'Player'
  elsif dealers_total > players_total
    'Dealer'
  end
end

def display_winner(players_total, dealers_total)
  case detect_winner(players_total, dealers_total)
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

def display_round_result(players_cards_names, dealers_cards_names,
                         players_total, dealers_total)
  clear_screen
  prompt('display_round_result')
  display_cards(players_cards_names, 'YOUR', players_total)
  display_cards(dealers_cards_names, "DEALER'S", dealers_total)
  prompt('scores_divider')
  detect_winner(players_total, dealers_total)
  display_winner(players_total, dealers_total)
end

def get_players_choice(players_cards_names, dealers_cards_names, players_total)
  players_choice = ''
  loop do
    prompt('get_players_choice')
    players_choice = gets.chomp.downcase
    if valid_choice?(players_choice)
      break
    elsif players_choice == 'rules'
      display_rules
      display_cards(players_cards_names, 'YOUR', players_total)
      prompt('dealers_initial_deal', dealers_cards_names.first)
    else
      prompt('invalid_players_choice')
    end
  end
  players_choice
end

def players_turn(deck, players_cards_names, dealers_cards_names,
                 players_total, players_cards)
  loop do
    players_choice = get_players_choice(players_cards_names,
                                        dealers_cards_names, players_total)
    if players_choice == 'stay' || players_choice == 's'
      break
    else
      next_card = update_user_cards(players_cards, deck).last
      update_user_cards_names(players_cards_names, next_card)
      prompt('hit', 'YOU', players_cards_names.last)
      players_total = calculate_total(players_cards)
      display_cards(players_cards_names, 'YOUR', players_total)
      break if busted?(players_total)
    end
  end
  players_total
end

def busted?(total)
  total > WHATEVER_ONE
end

def player_bust?(players_total, dealers_total,
                 players_cards_names, dealers_cards_names, scores)
  if busted?(players_total)
    prompt('player_bust')
    enter_to_continue
    display_round_result(players_cards_names, dealers_cards_names,
                         players_total, dealers_total)
    display_match_status(players_total, dealers_total, scores)
    true
  else
    puts "\n"
    prompt('player_stay', players_total)
  end
end

def match_over_after_player_bust?(players_total, dealers_total,
                                  players_cards_names, dealers_cards_names,
                                  scores)
  if player_bust?(players_total, dealers_total,
                  players_cards_names, dealers_cards_names, scores)
    match_over?(scores)
  end
end

def dealers_turn(deck, dealers_cards, dealers_cards_names, dealers_total)
  pause_prompt
  loop do
    break if dealers_total >= DEALER_HIT_LIMIT
    next_card = update_user_cards(dealers_cards, deck).last
    update_user_cards_names(dealers_cards_names, next_card)
    prompt('hit', 'DEALER', dealers_cards_names.last)
    dealers_total = calculate_total(dealers_cards)
    display_cards(dealers_cards_names, "DEALER'S", dealers_total)
  end
  dealers_total
end

def dealer_outcome(players_total, dealers_total,
                   players_cards_names, dealers_cards_names)
  if busted?(dealers_total)
    prompt('dealer_bust', dealers_total, WHATEVER_ONE)
    enter_to_continue
    display_round_result(players_cards_names, dealers_cards_names,
                         players_total, dealers_total)
  else
    prompt('dealer_stay')
    enter_to_continue
  end
end

def display_compared_result(players_cards_names, dealers_cards_names,
                            players_total, dealers_total)
  if !busted?(dealers_total)
    display_round_result(players_cards_names, dealers_cards_names,
                         players_total, dealers_total)
  end
end

def update_score(players_total, dealers_total, scores)
  case detect_winner(players_total, dealers_total)
  when 'Player'
    scores[:players_score] += 1
  when 'Dealer'
    scores[:dealers_score] += 1
  else
    scores
  end
end

def display_current_score(scores)
  prompt('display_current_score',
         scores[:players_score],
         scores[:dealers_score])

  pause_prompt
end

def match_over?(scores)
  scores[:players_score] == WINNING_SCORE ||
    scores[:dealers_score] == WINNING_SCORE
end

def display_match_status(players_total, dealers_total, scores)
  update_score(players_total, dealers_total, scores)
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

def display_grand_winner(scores)
  if scores[:players_score] == WINNING_SCORE
    prompt('display_grand_winner', 'YOU!')
  elsif scores[:dealers_score] == WINNING_SCORE
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
    players_cards = []
    dealers_cards = []

    initial_deal(deck, players_cards, dealers_cards)
    players_total = calculate_total(players_cards)
    dealers_total = calculate_total(dealers_cards)
    players_cards_names = user_card_names(players_cards)
    dealers_cards_names = user_card_names(dealers_cards)
    display_initial_deal(players_cards_names, dealers_cards_names,
                         players_total)

    players_total = players_turn(deck, players_cards_names,
                                 dealers_cards_names, players_total,
                                 players_cards)
    break if match_over_after_player_bust?(players_total,
                                           dealers_total,
                                           players_cards_names,
                                           dealers_cards_names,
                                           scores)
    next if busted?(players_total)

    dealers_total = dealers_turn(deck, dealers_cards,
                                 dealers_cards_names, dealers_total)
    dealer_outcome(players_total, dealers_total,
                   players_cards_names, dealers_cards_names)

    display_compared_result(players_cards_names, dealers_cards_names,
                            players_total, dealers_total)

    display_match_status(players_total, dealers_total, scores)
    break if match_over?(scores)
  end

  break unless replay?
end
display_goodbye
