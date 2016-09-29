# Tic Tac Toe
require 'pry'
WINNING_COMBOS = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8],
                  [3, 5, 7], [3, 6, 9], [4, 5, 6], [7, 8, 9]].freeze
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMP_MARKER = 'O'.freeze
PLAYER_MESSAGE = "Congratulations, You Won!".freeze
COMP_MESSAGE = "Sorry, You Lost".freeze

def prompt(message)
  puts "=> #{message}"
end

def joinor(arr, join_char = ', ', last_word = 'or')
  arr[arr.length - 1] = "#{last_word} #{arr[arr.length - 1]}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(join_char)
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts "You're the #{PLAYER_MARKER}, Computer is the #{COMP_MARKER}"
  puts ""
  puts "        |         |        "
  puts "   #{brd[1]}    |    #{brd[2]}    |    #{brd[3]}    "
  puts "        |         |        "
  puts "--------+---------+--------"
  puts "        |         |        "
  puts "   #{brd[4]}    |    #{brd[5]}    |    #{brd[6]}     "
  puts "        |         |        "
  puts "--------+---------+--------"
  puts "        |         |        "
  puts "   #{brd[7]}    |    #{brd[8]}    |    #{brd[9]}     "
  puts "        |         |        "
  puts ""
end
# rubocop:enable Metrics/AbcSize

def get_user_input(brd)
  input = ''
  loop do
    prompt("Which square do you want to select?")
    prompt("Enter a number from (#{joinor(empty_squares(brd), ', ', 'or')})")
    #prompt("Enter a number from (#{empty_squares(brd).join(', ')})")
    prompt("The numbers refer to the squares from left-right then top-bottom")
    prompt("Ex: top-left is '1', top-right is '3' and bottom-right is '9'")
    input = gets.chomp.to_i
    break if verify_input(input, brd)
    prompt("That isn't a valid choice! Make sure that the square isn't taken")
    sleep 2
  end
  input
end

def verify_input(input, brd)
  brd[input] == INITIAL_MARKER
end

def comp_strategy(marker, brd)
  empty_squares(brd).each do |square|
    sub_array = WINNING_COMBOS.select { |combo| combo.include?(square) }
    sub_array_without_square = sub_array.map { |combo| combo - [square] }
    sub_array_without_square.each do |array_check|
      return square if brd[array_check[0]] == marker &&
                       brd[array_check[1]] == marker
    end
  end
  nil
end

def get_comp_selection(brd)
  print("Computer is thinking..")
  10.times do
    print '..'
    sleep 0.2
  end

  # Checks to see if there is a square that can win the game
  comp_win_square = comp_strategy(COMP_MARKER, brd)
  return comp_win_square if (1..9).cover?(comp_win_square)

  # Checks to see if there is a square that will block user from winning
  comp_block_square = comp_strategy(PLAYER_MARKER, brd)
  return comp_block_square if (1..9).cover?(comp_block_square)

  if empty_squares(brd).include?(5)
    return 5
  else
    return empty_squares(brd).sample
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def update_board(brd, choice, player)
  if player == "user"
    brd[choice] = PLAYER_MARKER
  else
    brd[choice] = COMP_MARKER
  end
  brd
end

def end_of_game?(brd, player, score)
  if player == 'user'
    return true if winner?(brd, PLAYER_MARKER, PLAYER_MESSAGE)
  else
    return true if winner?(brd, COMP_MARKER, COMP_MESSAGE)
  end
  if empty_squares(brd) == []
    prompt("It's a tie!")
    return true
  end
  false
end

def winner?(brd, marker, message)
  player_squares = brd.select { |_square, value| value == marker }.keys
  WINNING_COMBOS.each do |combo|
    if (combo - player_squares).empty?
      prompt(message)
      return true
    end
  end
  false
end

def display_score(score)
  prompt("Current score is You: #{score[:player_count]}")
  prompt("            Computer: #{score[:computer_count]}")
end

def play_again
  answer = ''
  loop do
    prompt("Do you want to play again? (y/n)")
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
    prompt("Invalid choice")
  end
  answer
end

score = { player_count: 0, computer_count: 0 }
loop do
  prompt("Welcome to Tic Tac Toe!")
  prompt("First player to 5 wins!")
  board = initialize_board
  #while score[:player_count] < 5 && score[:computer_count] < 5
  

    loop do
      display_board(board)
      player_selection = get_user_input(board)
      board = update_board(board, player_selection, 'user')
      display_board(board)
      break if end_of_game?(board, 'user', score)
      comp_selection = get_comp_selection(board)
      board = update_board(board, comp_selection, 'comp')
      display_board(board)
      break if end_of_game?(board, 'comp', score)
      system "clear"
    end
  #end
  break if play_again == "n"
end
prompt("Thanks for playing! Good-bye!")
