# ---------- YAML Module ---------- #
require 'yaml'
MESSAGES = YAML.load_file('rps_bonus_messages.yml')

# ---------- Constants ---------- #
VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

ACTIONS = {
  'rock' => {
    'scissors' => 'crushes',
    'lizard' => 'crushes'
  },
  'paper' => {
    'rock' => 'covers',
    'spock' => 'disproves'
  },
  'scissors' => {
    'paper' => 'cuts',
    'lizard' => 'decapitates'
  },
  'lizard' => {
    'spock' => 'poisons',
    'paper' => 'eats'
  },
  'spock' => {
    'rock' => 'vaporizes',
    'scissors' => 'smashes'
  }
}

WINNING_SCORE = 5

# ---------- Methods ---------- #
def clear_screen
  system('clear')
end

def messages(message_key)
  MESSAGES[message_key]
end

def prompt(message_key,
           custom_data1='',
           custom_data2='',
           custom_data3='')
  if custom_data1
    message = format(messages(message_key),
                     custom_data1: custom_data1,
                     custom_data2: custom_data2,
                     custom_data3: custom_data3)
  else
    message = messages(message_key)
  end

  puts("=> #{message}")
end

def check_name(name)
  /\A[[:alpha:]]*[[:blank:]]?([[:alpha:]]+)\z/.match(name)
end

def get_name
  name = ''

  loop do
    name = gets.chomp
    break if check_name(name)
    prompt('valid_name')
  end

  name
end

def display_greeting
  prompt('welcome')
  name = get_name
  puts "\n"
  prompt('greeting', name)
end

def display_rules
  prompt('rules', WINNING_SCORE)
end

def starting_score
  { player_score: 0, computer_score: 0 }
end

def display_options
  prompt('options')
end

def get_player_choice
  player_choice = ''
  loop do
    player_choice = gets.chomp.downcase
    if VALID_CHOICES.value?(player_choice)
      return player_choice
    elsif VALID_CHOICES.key?(player_choice)
      return player_choice = VALID_CHOICES[player_choice]
    elsif player_choice == 'rules'
      display_rules
      display_options
    else
      puts "\n"
      prompt('valid_choice')
    end
  end
end

def get_computer_choice
  VALID_CHOICES.values.sample
end

def display_choices(player_choice, computer_choice)
  prompt('display_choices',
         player_choice.capitalize,
         computer_choice.capitalize)
end

def win?(first, second)
  ACTIONS[first].key?(second)
end

def retrieve_choice_action(first, second)
  ACTIONS[first][second]
end

def display_choice_action(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    prompt('display_choice_action',
           player_choice.capitalize,
           retrieve_choice_action(player_choice, computer_choice),
           computer_choice.capitalize)
  elsif win?(computer_choice, player_choice)
    prompt('display_choice_action',
           computer_choice.capitalize,
           retrieve_choice_action(computer_choice, player_choice),
           player_choice.capitalize)
  else
    prompt('same_choice', player_choice.capitalize, computer_choice.capitalize)
  end
end

def display_round_result(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    prompt('display_winner', 'YOU')
  elsif win?(computer_choice, player_choice)
    prompt('display_winner', 'COMPUTER')
  else
    prompt('tie')
  end
end

def update_score(scores, player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    scores[:player_score] += 1
  elsif win?(computer_choice, player_choice)
    scores[:computer_score] += 1
  else
    scores
  end
end

def display_current_score(scores)
  prompt('display_current_score',
         scores[:player_score],
         scores[:computer_score])
end

def match_over?(scores)
  scores[:player_score] == WINNING_SCORE ||
    scores[:computer_score] == WINNING_SCORE
end

def display_match_status(scores)
  if match_over?(scores)
    prompt('match_over', WINNING_SCORE)
  else
    prompt('match_continues', WINNING_SCORE)
  end
end

def display_grand_winner(scores)
  if scores[:player_score] == WINNING_SCORE
    prompt('display_grand_winner', 'YOU')
  else
    prompt('display_grand_winner', 'COMPUTER')
  end
end

def replay?
  prompt('replay')

  replay_input = ''
  loop do
    replay_input = gets.chomp
    break if ['y', 'yes', 'n', 'no'].include?(replay_input.downcase)
    puts "\n"
    prompt('valid_replay_input')
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
    display_options

    player_choice = get_player_choice
    computer_choice = get_computer_choice

    clear_screen

    display_choices(player_choice, computer_choice)

    display_choice_action(player_choice, computer_choice)
    display_round_result(player_choice, computer_choice)

    update_score(scores, player_choice, computer_choice)
    display_current_score(scores)

    display_match_status(scores)

    break if match_over?(scores)
  end
  display_grand_winner(scores)

  break unless replay?
  clear_screen
end
display_goodbye
