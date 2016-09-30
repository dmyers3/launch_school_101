require 'pry'
def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
 [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'],  
  ['H', '8'], ['H', '9'], ['H', 'T'], ['H', 'J'], ['H', 'Q'], ['H', 'K'],  
  ['H', 'A'], ['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'],  
  ['D', '7'], ['D', '8'], ['D', '9'], ['D', 'T'], ['D', 'J'], ['D', 'Q'],
  ['D', 'K'], ['D', 'A'], ['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'],
  ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', 'T'], ['S', 'J'],
  ['S', 'Q'], ['S', 'K'], ['S', 'A'], ['C', '2'], ['C', '3'], ['C', '4'],
  ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', 'T'],
  ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A']]
end

def card_display(cards, num_cards, player)
  dealer_first_card = cards[0] if player == 'd'
  cards[0] = [' ', ' '] if player == 'd'
  num_cards.times { print "  ______ "}
  puts ""
  num_cards.times { |num| print " |#{cards[num][0]}     |"  }
  puts ""
  num_cards.times { print " |      |" }
  puts ""
  num_cards.times { |num| print " |  #{cards[num][1]}   |" }
  puts ""
  num_cards.times { print " |      |" }
  puts ""
  num_cards.times { |num| print " |_____#{cards[num][0]}|" }
  puts ""
  cards[0] = dealer_first_card if player == 'd'
end


def deal(current_deck, hand)
  card_dealt = current_deck.sample
  current_deck.delete(card_dealt)
  hand.push(card_dealt)
end

def initial_hands(deck, player_cards, dealer_cards)
  2.times { player_cards = deal(deck, player_cards) }
  # player_cards = deal(deck, player_cards)
  2.times { dealer_cards = deal(deck, dealer_cards) }
  # dealer_cards = deal(deck, dealer_cards) 
end

def value(cards)
  value = 0
  num_aces = 0
  cards.each do |card|
    case card[1]
    when '2', '3', '4', '5', '6', '7', '8', '9' then value += card[1].to_i
    when 'T', 'J', 'Q', 'K' then value += 10
    when 'A'
      value += 1
      num_aces +=1
    end
  end
  value = ace_check(value, num_aces) if num_aces > 0
  value
end

def ace_check(val, aces)
  aces.times { val += 10 if val <= 11 }
  val
end

def display_hands(d_cards, p_cards)
  prompt("Dealer is showing: #{value(d_cards) - value([d_cards[0]])}")
  card_display(d_cards, d_cards.length, 'd')
  prompt("Player is showing: #{value(p_cards)}")
  card_display(p_cards, p_cards.length, 'p')
end

deck = initialize_deck
player_cards = [] 
dealer_cards = []
initial_hands(deck, player_cards, dealer_cards)
p dealer_cards
display_hands(dealer_cards, player_cards)

p player_cards
p dealer_cards




