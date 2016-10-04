require 'pry'
require 'to_words'
GAME_TGT = 21
DLR_STAY = 17
SUITS_CHAR = ["\u2665", "\u2666", "\u2660", "\u2663"].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9',
          'T', 'J', 'Q', 'K', 'A'].freeze
TOT_TO_WIN = 5

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  SUITS_CHAR.product(VALUES)
end

def display_score(score)
  prompt("Current score is You: #{score[:player_count]}")
  prompt("              Dealer: #{score[:computer_count]}")
end

# displays cards in graphic format
# hides dealers first card as well while still preserving its value
# rubocop:disable Metrics/AbcSize
def card_display(cards, num_cards, hidden = false)
  dealer_first_card = cards[0] if hidden == true
  cards[0] = [' ', ' '] if hidden == true
  num_cards.times { print "  ______ " }
  puts ""
  num_cards.times { |num| print " |#{cards[num][0].encode('utf-8')}     |" }
  puts ""
  num_cards.times { print " |      |" }
  puts ""
  num_cards.times { |num| print " |  #{cards[num][1]}   |" }
  puts ""
  num_cards.times { print " |      |" }
  puts ""
  num_cards.times { |num| print " |_____#{cards[num][0].encode('utf-8')}|" }
  puts ""
  cards[0] = dealer_first_card if hidden == true
end
# rubocop:enable Metrics/AbcSize

def deal(current_deck, hand)
  card_dealt = current_deck.sample
  current_deck.delete(card_dealt)
  hand.push(card_dealt)
end

def initial_hands(deck, player_cards, dealer_cards)
  2.times { player_cards = deal(deck, player_cards) }
  2.times { dealer_cards = deal(deck, dealer_cards) }
end

def value_calc(cards)
  sum = 0
  num_aces = 0
  cards.each do |card|
    case card[1]
    when '2', '3', '4', '5', '6', '7', '8', '9' then sum += card[1].to_i
    when 'T', 'J', 'Q', 'K' then sum += 10
    when 'A'
      sum += 1
      num_aces += 1
    end
  end
  sum = ace_check(sum, num_aces) if num_aces > 0
  sum
end

def ace_check(val, aces)
  aces.times { val += 10 if val <= 11 }
  val
end

def display_hands(d_cards, p_cards, totals, hidden = false)
  system "clear"
  prompt("Dealer is showing: #{totals[:dealer]}")
  card_display(d_cards, d_cards.length, hidden)
  prompt("You are showing: #{totals[:player]}")
  card_display(p_cards, p_cards.length)
end

def player_choice
  prompt("Would you like to hit or stay?")
  answer = ''
  loop do
    prompt("Enter 'H' or 'S'")
    answer = gets.chomp.downcase
    break if answer == 'h' || answer == 's'
    prompt("That's not a valid choice")
  end
  answer
end

def player_loop(d_cards, p_cards, totals, deck)
  while totals[:player] <= GAME_TGT
    case player_choice
    when 'h'
      p_cards = deal(deck, p_cards)
      totals[:player] = value_calc(p_cards)
      display_hands(d_cards, p_cards, totals, true)
    when 's'
      break
    end
  end
end

def dealer_loop(d_cards, p_cards, totals, deck)
  prompt("Dealer is flipping over his hidden card...")
  sleep 1
  totals[:dealer] = value_calc(d_cards)
  display_hands(d_cards, p_cards, totals)
  sleep 1.5
  while totals[:dealer] < DLR_STAY
    d_cards = deal(deck, d_cards)
    totals[:dealer] = value_calc(d_cards)
    display_hands(d_cards, p_cards, totals)
    sleep 1.5
  end
end

def bust?(totals)
  if totals[:player] > GAME_TGT
    display_result(:bust)
    return true
  elsif totals[:dealer] > GAME_TGT
    display_result(:dealer_bust)
    return true
  end
  false
end

def display_result(result)
  case result
  when :bust
    prompt("You Busted! Dealer Wins")
  when :dealer_bust
    prompt("Dealer Busted! You Win!")
  when :win
    prompt("Congratulations, You Won!")
  when :lose
    prompt("Sorry, You Lost")
  when :tie
    prompt("It's a push!")
  end
end

def determine_winner(totals, score)
  if totals[:player] == totals[:dealer]
    display_result(:tie)
  elsif totals[:player] > totals[:dealer]
    display_result(:win)
    score[:player_count] += 1
  else
    display_result(:lose)
    score[:computer_count] += 1
  end
end

def end_of_game_display(score)
  if score[:player_count] == TOT_TO_WIN
    prompt("You won the whole game!")
  elsif score[:computer_count] == TOT_TO_WIN
    prompt("Dealer wins the whole game")
  end
end

def play_again?
  answer = ''
  loop do
    prompt("Do you want to play again? (y/n)")
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
    prompt("Invalid choice")
  end
  answer == 'y'
end

prompt("Welcome to #{GAME_TGT.to_words.upcase}!")
prompt("Try to get as close as possible to #{GAME_TGT} without going over")
prompt("Dealer will stay at #{DLR_STAY}")
prompt("First to #{TOT_TO_WIN} wins!")
sleep 4

loop do
  score = { player_count: 0, computer_count: 0 }

  while score[:player_count] < TOT_TO_WIN && score[:computer_count] < TOT_TO_WIN
    display_score(score)
    sleep 3
    deck = initialize_deck
    player_cards = []
    dealer_cards = []
  
    initial_hands(deck, player_cards, dealer_cards)
    totals = { player: value_calc(player_cards),
               dealer: value_calc(dealer_cards.values_at(1..-1)) }
    display_hands(dealer_cards, player_cards, totals, true)
  
    player_loop(dealer_cards, player_cards, totals, deck)
    if bust?(totals)
      score[:computer_count] += 1 
      next
    end
  
    dealer_loop(dealer_cards, player_cards, totals, deck)
    if bust?(totals)
      score[:player_count] += 1
      next
    else
      determine_winner(totals, score)
    end
  end
  end_of_game_display(score)
  break unless play_again?
end

prompt("Thanks for playing! Good-bye!")
