require 'pry'
GAME_TGT = 21
DLR_STAY = 17
SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9',
          'T', 'J', 'Q', 'K', 'A'].freeze

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  SUITS.product(VALUES)
end

# rubocop:disable Metrics/AbcSize
def card_display(cards, num_cards, hidden = false)
  dealer_first_card = cards[0] if hidden == true
  cards[0] = [' ', ' '] if hidden == true
  num_cards.times { print "  ______ " }
  puts ""
  num_cards.times { |num| print " |#{cards[num][0]}     |" }
  puts ""
  num_cards.times { print " |      |" }
  puts ""
  num_cards.times { |num| print " |  #{cards[num][1]}   |" }
  puts ""
  num_cards.times { print " |      |" }
  puts ""
  num_cards.times { |num| print " |_____#{cards[num][0]}|" }
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

def display_hands(d_cards, p_cards, values, hidden = false)
  system "clear"
  prompt("Dealer is showing: #{values[:dealer]}")
  card_display(d_cards, d_cards.length, hidden)
  prompt("Player is showing: #{values[:player]}")
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

def player_loop(d_cards, p_cards, values, deck)
  while values[:player] <= GAME_TGT
    case player_choice
    when 'h'
      p_cards = deal(deck, p_cards)
      values[:player] = value_calc(p_cards)
      display_hands(d_cards, p_cards, values, true)
    when 's'
      break
    end
  end
end

def dealer_loop(d_cards, p_cards, values, deck)
  prompt("Dealer is flipping over his hidden card...")
  sleep 1
  values[:dealer] = value_calc(d_cards)
  display_hands(d_cards, p_cards, values)
  sleep 1.5
  while values[:dealer] < DLR_STAY
    prompt("Dealer hits under #{DLR_STAY}")
    d_cards = deal(deck, d_cards)
    values[:dealer] = value_calc(d_cards)
    display_hands(d_cards, p_cards, values)
    sleep 2
  end
end

def check_for_bust(values)
  if values[:player] > GAME_TGT
    display_result(:bust)
    return true
  elsif values[:dealer] > GAME_TGT
    display_result(:dealer_bust)
    return true
  end
  nil
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

def compare_values(values)
  if values[:player] == values[:dealer]
    display_result(:tie)
  elsif values[:player] > values[:dealer]
    display_result(:win)
  else
    display_result(:lose)
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

prompt("Welcome to Twenty-One! Try to get close to 21 without going over")
prompt("Dealer will stay at 17")
sleep 5

loop do
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  initial_hands(deck, player_cards, dealer_cards)
  values = { player: value_calc(player_cards),
             dealer: value_calc(dealer_cards.values_at(1..-1)) }
  display_hands(dealer_cards, player_cards, values, true)

  player_loop(dealer_cards, player_cards, values, deck)
  if check_for_bust(values)
    play_again? ? next : break
  end

  dealer_loop(dealer_cards, player_cards, values, deck)
  if check_for_bust(values)
    play_again? ? next : break
  else
    compare_values(values)
  end

  break unless play_again?
end

prompt("Thanks for playing! Good-bye!")
