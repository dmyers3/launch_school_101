#Tic Tac Toe
WINNING_COMBOS = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 5, 7], [3, 6, 9], [] ]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMP_MARKER = 'O'

def display_board(game_state)
  puts ""
  puts "        |         |        "
  puts "   #{game_state[1]}    |    #{game_state[2]}    |    #{game_state[3]}    "
  puts "        |         |        "
  puts "--------+---------+--------"
  puts "        |         |        "
  puts "   #{game_state[4]}    |    #{game_state[5]}    |    #{game_state[6]}     "
  puts "        |         |        "
  puts "--------+---------+--------"
  puts "        |         |        "
  puts "   #{game_state[7]}    |    #{game_state[8]}    |    #{game_state[9]}     "
  puts "        |         |        "
  puts ""
end


def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end
  
def prompt(message)
  puts "=> #{message}"
end

def get_user_input(brd)
  input = ''
  loop do
    prompt("Which square do you want to select?")
    prompt("Enter a number from (#{empty_squares(brd).join(', ')})")
    prompt("The numbers refer to the squares from left-right then top-bottom")
    prompt("For example, top left square is '1', top right is '3' and bottom right is '9'")
    input = gets.chomp.to_i
    break if verify_input(input, brd)
    prompt("That isn't a valid choice! Make sure to enter 1-9 and that square isn't taken")
    sleep 2
  end
  input
end

def get_comp_selection(brd)
  print("Computer is thinking..")
  10.times do 
    print '..'
    sleep 0.3
  end
  empty_squares(brd).sample
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end
  

def verify_input(input, brd)
  brd[input] == INITIAL_MARKER
end

def update_board(brd, choice, player)
  if player == "user"
    brd[choice] = PLAYER_MARKER
  else
    brd[choice] = COMP_MARKER
  end
  brd
end

prompt("Welcome to Tic Tac Toe!")
board = initialize_board

loop do
  display_board(board)
  player_selection = get_user_input(board)
  board = update_board(board, player_selection, 'user')
  display_board(board)
  #win?(board, 'user')
  comp_selection = get_comp_selection(board)
  board = update_board(board, comp_selection, 'comp')
end
