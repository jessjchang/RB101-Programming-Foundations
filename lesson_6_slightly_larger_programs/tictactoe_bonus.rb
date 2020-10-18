# ---------- YAML Module ---------- #
require 'yaml'
MESSAGES = YAML.load_file('tictactoe_messages.yml')

# ---------- Constants ---------- #
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_SCORE = 5

STARTING_USER = 'choose' # can set to 'player', 'computer', or 'choose'

MARKING_ROW_SPACES = 2  # For board display layout
BLANK_ROW_SPACES = 5    # For board display layout

# ---------- Methods ---------- #
def clear_screen
  system('clear')
end

def messages(msg_key)
  MESSAGES[msg_key]
end

def prompt(msg_key,
           custom_data1='',
           custom_data2='',
           custom_data3='')
  message = if custom_data1
              format(messages(msg_key),
                     custom_data1: custom_data1,
                     custom_data2: custom_data2,
                     custom_data3: custom_data3)
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

def valid_board_size?(num)
  /\A[+-]?\d+\z/.match(num) && num.to_i.odd? && num.to_i >= 3
end

def prompt_board_size
  prompt('choose_board_size')
  board_size = ''
  loop do
    board_size = gets.chomp
    break if valid_board_size?(board_size)
    puts "\n"
    prompt('invalid_board_size')
  end
  board_size.to_i
end

def find_winning_rows(brd_size)
  winning_rows = []
  position = 1
  while position < (brd_size**2)
    winning_row_sub_arr = []
    while winning_row_sub_arr.size < brd_size
      winning_row_sub_arr << position
      position += 1
    end
    winning_rows << winning_row_sub_arr
  end
  winning_rows
end

def find_winning_cols(brd_size)
  1.upto(brd_size).with_object([]) do |count, winning_cols|
    winning_col_sub_arr = []
    next_column_position = count
    while winning_col_sub_arr.size < brd_size
      winning_col_sub_arr << next_column_position
      next_column_position += brd_size
    end
    winning_cols << winning_col_sub_arr
  end
end

def find_winning_diagonals(brd_size)
  left_to_right_diagonal = []
  left_to_right_position = 1
  brd_size.times do
    left_to_right_diagonal << left_to_right_position
    left_to_right_position += (brd_size + 1)
  end

  right_to_left_diagonal = []
  right_to_left_position = brd_size
  brd_size.times do
    right_to_left_diagonal << right_to_left_position
    right_to_left_position += (brd_size - 1)
  end

  [] << left_to_right_diagonal << right_to_left_diagonal
end

def find_winning_lines(brd_size)
  find_winning_rows(brd_size) +
    find_winning_cols(brd_size) +
    find_winning_diagonals(brd_size)
end

def rule_board_position_spacing(brd_size)
  case brd_size**2
  when 0..9 then 2
  when 10..99 then 3
  when 100..999 then 4
  end
end

def rule_board_whitespace(brd_size)
  case brd_size**2
  when 0..9 then 5
  when 10..99 then 7
  when 100..999 then 9
  end
end

def rule_board_position_square(position, brd_size)
  case position.digits.size
  when 1
    "#{' ' * rule_board_position_spacing(brd_size)}#{position}"\
    "#{' ' * rule_board_position_spacing(brd_size)}"
  when 2
    "#{' ' * rule_board_position_spacing(brd_size)}#{position}"\
    "#{' ' * (rule_board_position_spacing(brd_size) - 1)}"
  when 3
    "#{' ' * (rule_board_position_spacing(brd_size) - 1)}#{position}"\
    "#{' ' * (rule_board_position_spacing(brd_size) - 1)}"
  end
end

def rule_board_position_row(position, brd_size)
  position_row = ''
  brd_size.times do |col|
    position_row << if col == brd_size - 1
                      rule_board_position_square(position, brd_size)
                    else
                      rule_board_position_square(position, brd_size) + '|'
                    end
    position += 1
  end
  position_row
end

def rule_board_whitespace_row(brd_size)
  whitespace_row = ''
  (brd_size - 1).times do
    whitespace_row << "#{' ' * rule_board_whitespace(brd_size)}|"
  end
  whitespace_row
end

def rule_board_border_row(brd_size)
  border_row = ''
  brd_size.times do |col|
    border_row << if col == brd_size - 1
                    '-' * rule_board_whitespace(brd_size)
                  else
                    "#{'-' * rule_board_whitespace(brd_size)}+"
                  end
  end
  border_row
end

def display_rule_board_positions(brd_size)
  position = 1

  puts ""
  brd_size.times do |row|
    puts rule_board_whitespace_row(brd_size)
    puts rule_board_position_row(position, brd_size)
    puts rule_board_whitespace_row(brd_size)
    puts rule_board_border_row(brd_size) if row != brd_size - 1
    position += brd_size
  end
  puts ""
end

def display_rules(brd_size)
  clear_screen
  prompt('rules', PLAYER_MARKER, COMPUTER_MARKER, WINNING_SCORE)
  display_rule_board_positions(brd_size)
  prompt('enter_to_continue')
  STDIN.gets
  clear_screen
end

def starting_score
  { player_score: 0, computer_score: 0 }
end

def valid_yes_or_no_input?(input)
  ['y', 'yes', 'n', 'no'].include?(input.downcase)
end

def confirm_starting_user(starting_user)
  if starting_user == 'choose'
    prompt('choose_starting_user')
    starting_user_input = ''
    loop do
      starting_user_input = gets.chomp
      break if valid_yes_or_no_input?(starting_user_input)
      puts "\n"
      prompt('invalid_yes_or_no_input')
    end
    ['y', 'yes'].include?(starting_user_input.downcase) ? 'player' : 'computer'
  else
    starting_user
  end
end

def display_starting_user(current_user)
  puts "\n"
  if current_user == 'player'
    prompt('display_starting_user', 'YOU')
  else
    prompt('display_starting_user', 'COMPUTER')
  end
  pause_prompt
end

def initialize_board(brd_size)
  new_board = {}
  (1..(brd_size**2)).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def current_board_markings_square(position, brd)
  "#{' ' * MARKING_ROW_SPACES}#{brd[position]}#{' ' * MARKING_ROW_SPACES}"
end

def current_board_row_markings(position, brd, brd_size)
  marking_row = ''
  brd_size.times do |col|
    marking_row << if col == brd_size - 1
                     current_board_markings_square(position, brd)
                   else
                     current_board_markings_square(position, brd) + '|'
                   end
    position += 1
  end
  marking_row
end

def current_board_whitespace_row(brd_size)
  whitespace_row = ''
  (brd_size - 1).times { whitespace_row << "#{' ' * BLANK_ROW_SPACES}|" }
  whitespace_row
end

def current_board_border_row(brd_size)
  border_row = ''
  brd_size.times do |col|
    border_row << if col == brd_size - 1
                    '-' * BLANK_ROW_SPACES
                  else
                    "#{'-' * BLANK_ROW_SPACES}+"
                  end
  end
  border_row
end

def display_board(brd, brd_size)
  prompt('display_current_board', PLAYER_MARKER, COMPUTER_MARKER)
  position = 1
  puts ""
  brd_size.times do |row|
    puts current_board_whitespace_row(brd_size)
    puts current_board_row_markings(position, brd, brd_size)
    puts current_board_whitespace_row(brd_size)
    puts current_board_border_row(brd_size) if row != brd_size - 1
    position += brd_size
  end
  puts ""
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, delimiter=', ', joining_word='or')
  case array.size
  when 1 then array.first
  when 2 then "#{array.first} #{joining_word} #{array.last}"
  else
    array[-1] = "#{joining_word} #{array.last}"
    array.join(delimiter)
  end
end

def valid_player_choice?(num, brd)
  /\A[+-]?\d+\z/.match(num) && empty_squares(brd).include?(num.to_i)
end

def player_places_piece!(brd, brd_size)
  square = ''
  loop do
    prompt('player_choice', joinor(empty_squares(brd)))
    square = gets.chomp
    if valid_player_choice?(square, brd)
      square = square.to_i
      break
    elsif square.downcase == 'rules'
      display_rules(brd_size)
      display_board(brd, brd_size)
    else
      prompt('invalid_player_choice')
    end
  end
  brd[square] = PLAYER_MARKER
end

def find_winning_line_square(line, brd, target_marker, brd_size)
  if brd.values_at(*line).count(target_marker) == (brd_size - 1)
    (brd.select do |position, curr_marker|
      line.include?(position) && curr_marker == INITIAL_MARKER
    end).keys.first
  end
end

def set_winning_line_square(winning_lines, brd, target_marker, brd_size, square)
  if !square
    winning_lines.each do |line|
      square = find_winning_line_square(line, brd, target_marker, brd_size)
      break if square
    end
  else
    square
  end
  square
end

def offensive_moves(line, brd)
  if brd.values_at(*line).count(COMPUTER_MARKER) >= 1 &&
     !brd.values_at(*line).include?(PLAYER_MARKER)
    (brd.select do |position, curr_marker|
      line.include?(position) && curr_marker == INITIAL_MARKER
    end).keys
  end
end

def best_offensive_square(winning_lines, brd)
  best_offensive_line = nil
  winning_lines.each do |line|
    if !offensive_moves(line, brd)
      next
    elsif !best_offensive_line && offensive_moves(line, brd)
      best_offensive_line = offensive_moves(line, brd)
    elsif offensive_moves(line, brd).size < best_offensive_line.size
      best_offensive_line = offensive_moves(line, brd)
    end
  end
  best_offensive_line.sample if best_offensive_line
end

def set_offensive_square(winning_lines, brd, square)
  if !square
    best_offensive_square(winning_lines, brd)
  else
    square
  end
end

def find_center_square(brd_size)
  ((brd_size**2) / 2) + 1
end

def set_center_square(brd, brd_size, square)
  if !square && brd[find_center_square(brd_size)] == INITIAL_MARKER
    find_center_square(brd_size)
  else
    square
  end
end

def set_random_square(brd, square)
  if !square
    empty_squares(brd).sample
  else
    square
  end
end

def computer_places_piece!(brd, brd_size, winning_lines)
  square = nil

  square = set_winning_line_square(winning_lines, brd,
                                   COMPUTER_MARKER, brd_size, square)

  square = set_winning_line_square(winning_lines, brd,
                                   PLAYER_MARKER, brd_size, square)

  square = set_offensive_square(winning_lines, brd, square)

  square = set_center_square(brd, brd_size, square)

  square = set_random_square(brd, square)

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_user, brd_size, winning_lines)
  if current_user == 'player'
    player_places_piece!(brd, brd_size)
  else
    computer_places_piece!(brd, brd_size, winning_lines)
  end
end

def alternate_user(current_user)
  current_user == 'player' ? 'computer' : 'player'
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won_round?(brd, winning_lines, brd_size)
  !!detect_round_winner(brd, winning_lines, brd_size)
end

def detect_round_winner(brd, winning_lines, brd_size)
  winning_lines.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == brd_size
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == brd_size
      return 'Computer'
    end
  end
  nil
end

def display_round_result(brd, winning_lines, brd_size)
  if detect_round_winner(brd, winning_lines, brd_size) == 'Player'
    prompt('display_round_winner', 'YOU')
  elsif detect_round_winner(brd, winning_lines, brd_size) == 'Computer'
    prompt('display_round_winner', 'COMPUTER')
  else
    prompt('tie')
  end
end

def update_score(brd, scores, winning_lines, brd_size)
  if detect_round_winner(brd, winning_lines, brd_size) == 'Player'
    scores[:player_score] += 1
  elsif detect_round_winner(brd, winning_lines, brd_size) == 'Computer'
    scores[:computer_score] += 1
  else
    scores
  end
end

def display_current_score(scores)
  prompt('display_current_score',
         scores[:player_score],
         scores[:computer_score])

  pause_prompt
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
  pause_prompt
end

def display_grand_winner(scores)
  if scores[:player_score] == WINNING_SCORE
    prompt('display_grand_winner', 'YOU')
  else
    prompt('display_grand_winner', 'COMPUTER')
  end
  pause_prompt
end

def replay?
  prompt('replay')

  replay_input = ''
  loop do
    replay_input = gets.chomp
    break if valid_yes_or_no_input?(replay_input)
    puts "\n"
    prompt('invalid_yes_or_no_input')
  end

  ['y', 'yes'].include?(replay_input.downcase)
end

def display_goodbye
  prompt('goodbye')
end

# ---------- Program start ---------- #
clear_screen

display_greeting

board_size = prompt_board_size
winning_lines = find_winning_lines(board_size)

display_rules(board_size)

# ---------- Main loop ---------- #
loop do
  scores = starting_score

  loop do
    current_user = confirm_starting_user(STARTING_USER)
    display_starting_user(current_user)
    board = initialize_board(board_size)

    loop do
      clear_screen
      display_board(board, board_size)

      place_piece!(board, current_user, board_size, winning_lines)

      current_user = alternate_user(current_user)
      break if someone_won_round?(board, winning_lines, board_size) ||
               board_full?(board)
    end

    clear_screen
    display_board(board, board_size)

    display_round_result(board, winning_lines, board_size)

    update_score(board, scores, winning_lines, board_size)
    display_current_score(scores)

    display_match_status(scores)
    break if match_over?(scores)
  end
  display_grand_winner(scores)

  break unless replay?
  clear_screen
end
display_goodbye
